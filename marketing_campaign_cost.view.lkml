view: marketing_campaign_cost {
  derived_table: {
    sql: select month, campaign_name as name, spendings as budget_spent, utm_campaign from marketing.temp_facebook_comp_acq_campaign_spendings
      where month>='2019-01-01'
      UNION
      select distinct *, null as utm_campaign FROM marketing.temp_adwords_comp_acq_campaign_spendings
      where month>='2019-01-01'
       ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension: month {
    type: date_month
    sql: concat(${TABLE}.month,'-01')::date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: budget_spent {
    type: sum
    value_format: "0.00\€"
    sql: ${TABLE}.budget_spent ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  set: detail {
    fields: [month, name, budget_spent, utm_campaign]
  }
}
