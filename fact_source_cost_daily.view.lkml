view: fact_source_cost_daily {
  sql_table_name: marketing.fact_source_cost_daily ;;

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  measure: source_cost_bing {
    type: number
    sql: ${TABLE}.source_cost_bing ;;
  }

  measure: source_cost_facebook {
    type: number
    sql: ${TABLE}.source_cost_facebook ;;
  }

  measure: source_cost_google {
    type: number
    sql: ${TABLE}.source_cost_google ;;
  }

  measure: source_cost_linkedin {
    type: number
    sql: ${TABLE}.source_cost_linkedin ;;
  }

  measure: source_cost_xing {
    type: number
    sql: ${TABLE}.source_cost_xing ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: cost {
    type: number
    sql: CASE WHEN ${online_marketing_pivot.source} = 'facebook' THEN ${source_cost_facebook}
    WHEN ${online_marketing_pivot.source} = 'xing' THEN ${source_cost_xing}
    WHEN ${online_marketing_pivot.source} = 'linkeding' THEN ${source_cost_linkedin}
    WHEN ${online_marketing_pivot.source} = 'google' THEN ${source_cost_google}
    WHEN ${online_marketing_pivot.source} = 'bing' THEN ${source_cost_bing}
    ELSE 0 END;;
  }


}
