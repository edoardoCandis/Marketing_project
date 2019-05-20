view: cohort_costs {
  derived_table: {
    sql: WITH method_sales as ( SELECT distinct

        o.created_date,

        CASE WHEN s.act_source IS NULL AND can_redistr =1 THEN dummy.reatt_source ELSE act_source END AS this_source,



        CASE
        WHEN lower(this_source) LIKE '%other%' THEN 'other'
        WHEN lower(this_source) LIKE '%facebook%' OR lower(this_source) LIKE '%instagram%' THEN 'facebook'
        WHEN lower(this_source) LIKE '%google%' OR lower(this_source) LIKE '%adwords%' THEN 'google'
        WHEN lower(this_source) LIKE '%bing%' OR lower(this_source) LIKE '%linkedin%' OR lower(this_source) LIKE '%xing%' THEN lower(this_source)
        WHEN lower(converted_lead_source_c) LIKE '%comx%' OR lower(account_channel_c) LIKE '%comx%' OR lower(this_source) LIKE '%com x%' OR lower(this_source) LIKE 'comx'THEN 'com X'
        WHEN converted_lead_source_c LIKE '%BVMW%' OR account_channel_c LIKE '%BVMW%' OR lower(this_source) LIKE 'bvmw list' THEN 'bvmw list'
        WHEN lower(account_channel_c) LIKE '%xing%' THEN 'xing'
        WHEN this_source IS NULL THEN NULL
        ELSE 'other' END AS source,

        CASE
        WHEN dummy.reatt_source IS NULL then 1.00
        WHEN  source LIKE 'google' then  0.32
        WHEN   source LIKE 'bing' then  0.00
        WHEN   source LIKE 'linkedin' then  0.01
        WHEN   source LIKE 'bvmw list' then  0.00
        WHEN   source LIKE 'other' then  0.39
        WHEN   source LIKE 'facebook' then  0.23
        WHEN   source LIKE 'xing' then  0.04
        WHEN   source LIKE 'com X' then  0.01
        WHEN source IS NULL THEN 0.00
        END AS share,

        CASE WHEN o.is_won AND reatt_source IS NOT NULL THEN o.id ELSE NULL END AS reattr,


        CASE WHEN reattr IS NOT NULL AND o.is_won THEN (cost_of_method + cost_of_sale)*share
        WHEN reattr IS NOT NULL THEN cost_of_method*share
        WHEN o.is_won THEN cost_of_method + cost_of_sale
        ELSE cost_of_method END AS cost

        FROM salesforce.opportunities o
        LEFT JOIN salesforce.accounts a on o.account_id = a.id
        LEFT JOIN marketing.fact_account_sources s on a.id = s.account_id
        LEFT JOIN marketing.fact_monthly_sales_and_method_cost c on c.month = to_char(o.created_date, 'yyyy-mm') AND lower(c.lead_method) = lower(converted_lead_method_c)
              LEFT JOIN ( SELECT DISTINCT
                      CASE WHEN RANDOM() <0.1 THEN 'google'
                      WHEN RANDOM() <0.2 THEN 'facebook'
                      WHEN RANDOM() <0.3 THEN 'xing'
                      WHEN RANDOM() <0.4 THEN 'bing'
                      WHEN RANDOM() <0.5 THEN 'com x'
                      WHEN RANDOM() <0.6 THEN 'bvmw list'
                      WHEN RANDOM() <0.7 THEN 'linkedin'
                      ELSE 'other' END AS reatt_source

                      FROM marketing.fact_account_sources
                      WHERE act_source IS NOT NULL) dummy ON s.act_source IS NULL AND can_redistr = 1
        WHERE
        a.record_type_id= '0121t000000LSGXAA4'
        AND NOT referral_account_c
        AND NOT o.is_deleted),

days as (select
        to_char(created_date, 'yyyy-mm') as month,
        count(distinct created_date::date) as distinct_days
        from method_sales
        where source = 'google'
        group by 1),

marketing_wages as ( select f.month,
                    sum(amount)*0.65/distinct_days as amount_per_day
                    from financials.bwa_costs f left join days d on f.month=d.month
                    where expense_account LIKE '%Marketing Team%'
                    group by 1,distinct_days)

SELECT DISTINCT
created_date::date,
source,
sum(coalesce(cost,0)) + max(CASE WHEN source = 'facebook' THEN source_cost_facebook
        WHEN source = 'google' THEN source_cost_google + COALESCE(f.amount_per_day,500)
        WHEN source = 'bing' THEN source_cost_bing
        WHEN source = 'xing' THEN source_cost_xing
        WHEN source = 'linkedin' THEN source_cost_linkedin ELSE 0 END) as tot_cost
FROM method_sales a
right JOIN marketing.fact_source_cost_daily b on a.created_date::date = b.date::date
left join marketing_wages f ON to_char(b.date,'yyyy-mm') = f.month

GROUP BY 1,2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: primary_key {
    primary_key:yes
    sql: concat(${created_date_date},${source}) ;;
  }

  dimension_group: created_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]

    sql: ${TABLE}.created_date ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  measure: tot_cost {
    type: sum
    value_format: "0.00\€"
    sql: ${TABLE}.tot_cost ;;
  }

  set: detail {
    fields: [source, tot_cost]
  }
}
