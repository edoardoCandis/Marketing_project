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
    value_format_name: eur
    type: sum
    sql: ${TABLE}.source_cost_bing ;;
  }

  measure: source_cost_facebook {
    value_format_name: eur
    type: sum
    sql: ${TABLE}.source_cost_facebook ;;
  }

  measure: source_cost_google {
    value_format_name: eur
    type: sum
    sql: ${TABLE}.source_cost_google ;;
  }

  measure: source_cost_linkedin {
    type: sum
    value_format_name: eur
    sql: ${TABLE}.source_cost_linkedin ;;
  }

  measure: source_cost_xing {
    value_format_name: eur
    type: sum
    sql: ${TABLE}.source_cost_xing ;;
  }

  # measure: cost {
  #  type: number
  # sql: CASE WHEN ${fact_reattributed_sources.source} = 'facebook' THEN ${source_cost_facebook}
  #WHEN ${fact_reattributed_sources.source} = 'xing' THEN ${source_cost_xing}
  #WHEN ${fact_reattributed_sources.source} = 'linkeding' THEN ${source_cost_linkedin}
  #WHEN ${fact_reattributed_sources.source} = 'google' THEN ${source_cost_google}
  #WHEN ${fact_reattributed_sources.source} = 'bing' THEN ${source_cost_bing}
  #ELSE 0 END;;
  #}

  measure: total_cost {
    type: sum
    value_format_name: eur
    sql: ${TABLE}.source_cost_bing+${TABLE}.source_cost_facebook+${TABLE}.source_cost_google+${TABLE}.source_cost_linkedin+${TABLE}.source_cost_xing ;;
  }


}
