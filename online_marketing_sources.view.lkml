view: online_marketing_sources {
  derived_table: {
    sql: SELECT distinct
              a.id as account_id,
              o.id as opportunity_id,
              o.created_date,
              o.close_date,
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

              converted_lead_method_c,

              CASE WHEN is_won THEN 1 ELSE o.probability::float END AS probability,

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

              CASE WHEN o.is_won THEN share ELSE 0 END AS share_won,
              CASE WHEN o.is_won THEN o.id ELSE NULL END AS opp_won,
              CASE WHEN o.is_won AND reatt_source IS NOT NULL THEN o.id ELSE NULL END AS reattr,


              CASE WHEN reattr IS NOT NULL AND o.is_won THEN (cost_of_method + cost_of_sale)*share
              WHEN reattr IS NOT NULL THEN cost_of_method*share
              WHEN o.is_won THEN cost_of_method + cost_of_sale
              ELSE cost_of_method END AS cost,


              CASE WHEN o.amount IS NULL THEN 0
              ELSE round(o.amount::float,2)*share END AS this_amount,

              CASE WHEN is_won THEN this_amount::float*0.7 ELSE 0 END AS won_amount,

              CASE WHEN this_amount::float*probability::float IS NULL OR probability<0.5 THEN 0 ELSE this_amount::float*probability::float*0.7/100 END AS expected_amount
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
              AND NOT o.is_deleted
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: n_opportunities {
    type:  count_distinct
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id;;
  }

  dimension_group: close_date {
    type: time
    sql: ${TABLE}.close_date ;;
  }



  dimension: week_of_conversion {
    type: number
    value_format_name: decimal_0
    sql: DATEDIFF('Day', ${created_date_date}, ${close_date_date}) / 7;;
  }


  dimension: this_source {
    type: string
    sql: ${TABLE}.this_source ;;
  }

  dimension: source {
    label: "Account Source"
    description: "Source after Reattribution"
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: converted_lead_method_c {
    type: string
    sql: ${TABLE}.converted_lead_method_c ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
  }

  measure: share_won {
    type: sum
    sql:${TABLE}.share_won
    ;;
  }

  measure: share {
    type: sum
    sql:${TABLE}.share
      ;;
  }

  measure: opp_won {
    type: count_distinct
    sql: ${TABLE}.opp_won ;;
  }

  dimension: reattr {
    type: string
    sql: ${TABLE}.reattr ;;
  }

  measure: cost {
    type: sum
    sql: ${TABLE}.cost ;;
  }

  dimension: this_amount {
    type: number
    sql: ${TABLE}.this_amount ;;
  }

  measure: won_amount {
    type: sum
    value_format: "0.00\€"
    sql: ${TABLE}.won_amount ;;
  }

  measure: expected_amount {
    type: sum
    value_format: "0.00\€"
    sql: ${TABLE}.expected_amount ;;
  }


  parameter: metric_selector {
    type: string
    allowed_value: {value: "MRR"}
    allowed_value: {value: "New Subscriptions"}
    allowed_value: {value: "Expected MRR"}
    allowed_value: {value: "MRR*6"}

  }

  measure: metric {
    label_from_parameter: metric_selector
    type: number
    value_format: "0.00"


    sql:
      CASE WHEN {% parameter metric_selector %} = 'MRR' THEN
           ${won_amount}
      WHEN {% parameter metric_selector %} = 'New Subscriptions' THEN ${share_won}
      WHEN {% parameter metric_selector %} = 'Expected MRR' THEN ${expected_amount}
      ELSE ${won_amount}*6
      END;;
     html: {% if metric_selector._parameter_value == "'New Subscriptions'" %} {{ share_won._rendered_value }}
     {% elsif metric_selector._parameter_value == "'MRR*6'" %} {{ won_amount._rendered_value }}
     {% elsif metric_selector._parameter_value == "'Expected MRR'" %} {{ expected_amount._rendered_value }}
     {% elsif metric_selector._parameter_value == "'MRR'" %} {{ won_amount._rendered_value }}{% endif %} ;;

  }

  set: detail {
    fields: [
      created_date_time,
      week_of_conversion,
      close_date_time,
      this_source,
      source,
      converted_lead_method_c,
      probability,
      share,
      share_won,
      opp_won,
      reattr,
      cost,
      this_amount,
      won_amount,
      expected_amount
    ]
  }
}
