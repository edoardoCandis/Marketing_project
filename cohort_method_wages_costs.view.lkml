view: cohort_method_wages_costs {
  derived_table: {
    sql: WITH tot as (SELECT


                      SUM(CASE WHEN o.amount IS NULL THEN 0
                      WHEN is_won THEN round(amount::float,0) ELSE 0 END) AS won_amount

                      FROM salesforce.opportunities o
                      LEFT JOIN salesforce.accounts a on o.account_id = a.id
                      LEFT JOIN marketing.fact_account_sources s on a.id = s.account_id

                      WHERE
                      o.created_date between getdate() - 118 and getdate()
                      AND a.record_type_id= '0121t000000LSGXAA4'
                      AND NOT referral_account_c
                      AND NOT o.is_deleted
                      AND act_source IS NOT NULL),

          reattribution_share as (SELECT


              grouping_source AS source,

      SUM(CASE WHEN o.amount IS NULL THEN 0
      WHEN is_won THEN round(amount::float,0) ELSE 0 END) / (SELECT * FROM tot) AS reatt_share

      FROM salesforce.opportunities o
      LEFT JOIN salesforce.accounts a on o.account_id = a.id
      LEFT JOIN marketing.fact_account_sources s on a.id = s.account_id
      WHERE
      o.created_date between getdate() - 118 and getdate()
      AND a.record_type_id= '0121t000000LSGXAA4'
      AND NOT referral_account_c
      AND NOT o.is_deleted
      AND act_source is not null
      GROUP BY 1),

      method_sales as ( SELECT

                    o.created_date,

                    CASE WHEN s.act_source IS NULL AND can_redistr =1 THEN dummy.reatt_source ELSE act_source END AS this_source,
                    s.paid,
                    s.lead_method,



                    grouping_source AS source,

                    CASE WHEN reatt_source is null then 1 else reatt_share end as share,

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
                                  WHEN RANDOM() <0.8 THEN 'easybill'
                                  WHEN RANDOM() <0.9 THEN 'website backlink'

                                  ELSE 'other' END AS reatt_source

                                  FROM marketing.fact_account_sources
                                  WHERE act_source IS NOT NULL) dummy ON s.act_source IS NULL AND can_redistr = 1
                                  LEFT JOIN reattribution_share r on r.source = dummy.reatt_source

                    WHERE
                    a.record_type_id= '0121t000000LSGXAA4'
                    AND NOT referral_account_c
                    AND NOT o.is_deleted),

            days as (select
                    to_char(created_date, 'yyyy-mm') as month,
                    count(distinct created_date::date) as distinct_days
                    from method_sales
                    where source = 'google' AND NOT paid
                    group by 1),

            marketing_wages as ( select f.month,
                                sum(amount)*0.65/distinct_days as amount_per_day
                                from financials.bwa_costs f left join days d on f.month=d.month
                                where expense_account LIKE '%Marketing Team%'
                                group by 1,distinct_days)

            SELECT
            created_date::date,
            source,
            paid,
            lead_method,

            sum(coalesce(cost,0)) + max(CASE WHEN source = 'google' AND NOT paid THEN COALESCE(f.amount_per_day,500) ELSE 0 END) AS method_wages_cost


            FROM method_sales a
            left join marketing_wages f ON to_char(created_date,'yyyy-mm') = f.month
            where a.created_date>'2019-01-01'

            GROUP BY 1,2,3,4
            order by 1,2
       ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }
  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
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

  dimension: paid {
    type: yesno
    sql: ${TABLE}.paid ;;
  }

  dimension: lead_method {
    type: string
    sql: ${TABLE}.lead_method ;;
  }

  measure: method_wages_cost {
    type: sum
    value_format: "0.00\€"
    sql: ${TABLE}.method_wages_cost ;;
  }

  set: detail {
    fields: [ source, method_wages_cost]
  }
}
