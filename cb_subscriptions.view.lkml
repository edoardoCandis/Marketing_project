view: cb_subscriptions {
  sql_table_name: salesforce.cb_subscriptions ;;

  #---------- dimensions hidden -------------------

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: chargebeeapps_cb_id_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_cb_id_c ;;
  }

  dimension: chargebeeapps_cb_oppurtunity_c {
    type: string
    hidden: yes
    sql: ${TABLE}.chargebeeapps_cb_oppurtunity_c ;;
  }

  dimension: chargebeeapps_company_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_company_c ;;
  }

  dimension_group: chargebeeapps_next_billing_c {
    hidden: yes
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
    sql: ${TABLE}.chargebeeapps_next_billing_c ;;
  }

  dimension: chargebeeapps_plan_quantity_c {
    hidden: yes
    type: number
    sql: ${TABLE}.chargebeeapps_plan_quantity_c ;;
  }

  dimension_group: chargebeeapps_subcription_activated_at_c {
    hidden: yes
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
    sql: ${TABLE}.chargebeeapps_subcription_activated_at_c ;;
  }

  dimension: chargebeeapps_subscription_id_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_subscription_id_c ;;
  }

  dimension: chargebeeapps_subscription_plan_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_subscription_plan_c ;;
  }

  dimension_group: created {
    hidden: yes
    # date the subscription was created in Salesforce
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

  dimension: name {
    hidden: yes
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: chargebeeapps_current_term_end_c {
    hidden: yes
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
    sql: ${TABLE}.chargebeeapps_current_term_end_c ;;
  }

  dimension_group: chargebeeapps_current_term_start_c {
    hidden: yes
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
    sql: ${TABLE}.chargebeeapps_current_term_start_c ;;
  }

  dimension: chargebeeapps_customer_id_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_customer_id_c ;;
  }

  #---------- dimensions in use -------------------

  dimension: add_on_mrr_c {
    type: string
    sql: ${TABLE}.add_on_mrr_c ;;
  }

  dimension: additional_invoice_net_mrr_c {
    type: string
    sql: ${TABLE}.additional_invoice_net_mrr_c ;;
  }

  dimension: chargebee_subscription_url_c {
    type: string
    sql: ${TABLE}.chargebee_subscription_url_c ;;
  }

  dimension: chargebeeapps_cancel_reason_c {
    type: string
    sql: ${TABLE}.chargebeeapps_cancel_reason_c ;;
  }



  dimension: chargebeeapps_due_invoices_count_c {
    type: number
    sql: ${TABLE}.chargebeeapps_due_invoices_count_c ;;
  }

  dimension_group: chargebeeapps_due_since_c {
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
    sql: ${TABLE}.chargebeeapps_due_since_c ;;
  }


  dimension: chargebeeapps_mrr_c {
    type: string
    sql: ${TABLE}.chargebeeapps_mrr_c ;;
  }

  dimension: chargebeeapps_next_billing_amount_c {
    type: string
    sql: ${TABLE}.chargebeeapps_next_billing_amount_c ;;
  }



  dimension: chargebeeapps_plan_unit_price_c {
    type: string
    sql: ${TABLE}.chargebeeapps_plan_unit_price_c ;;
  }

  dimension: chargebeeapps_remaining_billing_cycles_c {
    type: number
    sql: ${TABLE}.chargebeeapps_remaining_billing_cycles_c ;;
  }




  dimension_group: chargebeeapps_subcription_cancelled_at_c {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      day_of_month,
      quarter,
      year
    ]
    sql: ${TABLE}.chargebeeapps_subcription_cancelled_at_c ;;
  }

  dimension_group: chargebeeapps_subscription_created_at_c {
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
    sql: ${TABLE}.chargebeeapps_subscription_created_at_c ;;
  }





  dimension: chargebeeapps_subscription_status_c {
    type: string
    sql: ${TABLE}.chargebeeapps_subscription_status_c ;;
  }



  dimension_group: end_of_moneyback_date_c {
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
    sql: ${TABLE}.end_of_moneyback_date_c ;;
  }

  dimension_group: end_of_trial_date_c {
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
    sql: ${TABLE}.end_of_trial_date_c ;;
  }

  dimension: in_money_back_c {
    type: yesno
    sql: ${TABLE}.in_money_back_c ;;
  }

  dimension: in_trial_stage_c {
    type: yesno
    sql: ${TABLE}.in_trial_stage_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }



  dimension: plan_included_documents_c {
    type: number
    sql: ${TABLE}.plan_included_documents_c ;;
  }

  dimension: product_billing_cycle_c {
    type: string
    sql: ${TABLE}.product_billing_cycle_c ;;
  }

  dimension: product_category_c {
    label: "Product Category"
    description: "Smartbooks or Workflows"
    type: string
    sql: ${TABLE}.product_category_c ;;
  }


  dimension: subscription_addon_count_c {
    type: number
    sql: ${TABLE}.subscription_addon_count_c ;;
  }

  dimension: subscription_stage_c {
    type: string
    sql: ${TABLE}.subscription_stage_c ;;
  }

  dimension: vat_id_c {
    type: string
    sql: ${TABLE}.vat_id_c ;;
  }

# ------------ measures here ------------
  measure: count {
    label: "Logo Churn"
    type: count
    drill_fields: [id, name]
  }

  measure: gross_mrr_c {
    type: sum
    value_format_name: eur
    sql: ${TABLE}.gross_mrr_c ;;
  }

  measure: plan_gross_mrr_c {
    label: "Plan Gross MRR"
    type: sum
    sql: ${TABLE}.plan_gross_mrr_c ;;
  }

  measure: average_gross_mrr {
    type: average
    value_format_name: eur
    sql: ${TABLE}.plan_gross_mrr_c;;
  }

  measure: initial_mrr_c {
    type: sum
    value_format_name: eur
    sql: ${TABLE}.initial_mrr_c ;;
  }
  measure: mrr_after_trial_c {
    type: sum
    value_format_name: eur
    sql: ${TABLE}.mrr_after_trial_c ;;
  }

  measure: last_net_mrr_c {
    label: "Net MRR Churn"
    type: sum
    value_format_name: eur
    sql: ${TABLE}.last_net_mrr_c ;;
    filters: {
      field: chargebeeapps_subscription_status_c
      value: "CANCELLED"
    }
  }

  measure: chargebeeapps_total_dues_c {
    type: sum
    value_format_name: eur
    sql: ${TABLE}.chargebeeapps_total_dues_c ;;
  }

}
