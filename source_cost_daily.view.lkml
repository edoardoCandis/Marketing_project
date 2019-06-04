view: source_cost_daily {
  derived_table: {
    sql: select
      date,
      source,
      CASE WHEN source = 'facebook' THEN source_cost_facebook
      WHEN source = 'google' THEN source_cost_google
      WHEN source = 'bing' THEN source_cost_bing
      WHEN source = 'xing' THEN source_cost_xing
      WHEN source = 'linkedin' THEN source_cost_linkedin END as tot_cost
      from(SELECT DISTINCT
                                    CASE WHEN RANDOM() <0.2 THEN 'google'
                                    WHEN RANDOM() <0.4 THEN 'facebook'
                                    WHEN RANDOM() <0.6 THEN 'xing'
                                    WHEN RANDOM() <0.8 THEN 'bing'
                                    ELSE 'linkedin' END AS source
                                    FROM marketing.fact_account_sources)
      left join marketing.fact_source_cost_daily on date is not null
      order by 1,2
       ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension_group: date {
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

    sql: ${TABLE}.date ;;
    }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: primary_key {
    primary_key: yes
    type: string
    sql: concat(${date_date},${source}) ;;
  }
  measure: tot_cost {
    label: "Source cost"
    value_format: "0.00\€"
    type: sum
    sql: ${TABLE}.tot_cost ;;
  }

  set: detail {
    fields: [source, tot_cost]
  }
}
