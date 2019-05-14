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


  dimension: is_deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: chargebeeapps_subscription_plan_id {
    label: "Product ID"
    # use to merge products (plans)
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

  dimension: chargebeeapps_plan_unit_price_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_plan_unit_price_c ;;
  }

  dimension: chargebeeapps_remaining_billing_cycles_c {
    hidden: yes
    #maybe useful lateron, but for now not important
    type: number
    sql: ${TABLE}.chargebeeapps_remaining_billing_cycles_c ;;
  }

  dimension_group: end_of_moneyback_date_c {
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
    sql: ${TABLE}.end_of_moneyback_date_c ;;
  }

  dimension_group: end_of_trial_date_c {
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
    sql: ${TABLE}.end_of_trial_date_c ;;
  }
  dimension: chargebeeapps_cancel_reason_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_cancel_reason_c ;;
  }

  dimension: vat_id_c {
    hidden: yes
    type: string
    sql: ${TABLE}.vat_id_c ;;
  }

  dimension: chargebee_subscription_url_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebee_subscription_url_c ;;
  }

  dimension: chargebeeapps_due_invoices_count_c {
    hidden: yes
    type: number
    sql: ${TABLE}.chargebeeapps_due_invoices_count_c ;;
  }

  dimension_group: chargebeeapps_due_since_c {
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
    sql: ${TABLE}.chargebeeapps_due_since_c ;;
  }



  dimension: in_money_back_c {
    type: yesno
    label: "Subscription in Moneyback"
    description: "First 30 Days of Subscription"
    sql: ${TABLE}.in_money_back_c ;;
  }

  dimension: in_trial_stage_c {
    type: yesno
    label: "Subscription in Trial"
    description: "First 90 Days of Subscription. Includes moneyback"
    sql: ${TABLE}.in_trial_stage_c ;;
  }


  dimension: plan_included_documents_c {
    hidden: yes
    type: number
    sql: ${TABLE}.plan_included_documents_c ;;
  }

  dimension: subscription_addon_count_c {
    hidden: yes
    type: number
    sql: ${TABLE}.subscription_addon_count_c ;;
  }


  #---------- dimensions in use -------------------

  dimension: chargebeeapps_next_billing_amount_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_next_billing_amount_c ;;
  }


  dimension_group: chargebeeapps_subcription_cancelled_at_c {
    label: "Churn or Deactivation"
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
    label: "Became a Customer"
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

dimension: is_active {
  type: yesno
  label: "Active"
  sql:  chargebeeapps_subscription_status_c IN ('ACTIVE','NON_RENEWING') ;;
}

dimension: is_churn {
  type: yesno
  label: "Churned"
  description: "Only churn. Does not look at Cancellations during Trial"
  sql: NOT ${is_active} AND ${subscription_stage_c}= 'customer' ;;
}

  dimension: is_deactivation {
    type: yesno
    label: "Deactivated"
    description: "Only Cancellations within first 90 Days (Trial churn)"
    sql: NOT ${is_active} AND ${subscription_stage_c}<> 'customer' ;;
  }

  dimension: product_billing_cycle_c {
    label: "Billing Period"
    description: "Monthly or Yearly"
    type: string
    sql: ${TABLE}.product_billing_cycle_c ;;
  }

  dimension: product_category_c {
    label: "Product Category"
    description: "Smartbooks or Workflows"
    type: string
    sql: ${TABLE}.product_category_c ;;
  }


  dimension: subscription_stage_c {
    type: string
    sql: ${TABLE}.subscription_stage_c ;;
  }

dimension: last_net_mrr {
  type: number
  value_format_name: eur
  sql: CAST(${TABLE}.last_net_mrr_c as float4) ;;
}

# ------------ measures here ------------


  measure: active_subscriptions {
    type: count_distinct
    sql: ${id} ;;
    filters:  {
      field: is_active
      value: "yes"
    }
  }

# --------------- churn KPIs--------------

  measure: count_churn {
    label: "Logo Churn"
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: is_churn
      value: "no"
    }
  }

  measure: count_deactivations {
    label: "Logo Deactivations"
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: is_deactivation
      value: "no"
    }
  }

measure: net_mrr_deactivations{
  label: "Net MRR Deactivations"
  type: sum
  sql: ${last_net_mrr} ;;
  value_format_name: eur
  filters: {
    field: is_deactivation
    value: "yes"
    }
  }

  measure: net_mrr_churn{
    label: "Net MRR Churn"
    type: sum
    sql: ${last_net_mrr} ;;
    value_format_name: eur
    filters: {
      field: is_churn
      value: "yes"
    }
  }

# -- aggregated measures --


  measure: customer_mrr_churnrate {
    label: "MRR Churnrate (Customer)"
    type: sum
    value_format_name: percent_2
    sql: ${last_net_mrr}/(${fact_monthly_revenues.total_customer_mrr_previous_period}+${last_net_mrr}) ;;
    filters: {
      field: is_churn
      value: "yes"
    }
  }
  measure: trial_mrr_churnrate {
    label: "MRR Deactivationrate (Trial)"
    type: sum
    value_format_name: percent_2
    sql: ${last_net_mrr}/(${fact_monthly_revenues.total_trial_mrr_previous_period}+${fact_monthly_revenues.total_moneyback_mrr_previous_period}+${last_net_mrr}) ;;
    filters: {
      field: is_deactivation
      value: "yes"
    }
  }

# other measures where i am not yet sure how to incorporate them


  measure: add_on_mrr_c {
    label: "Addon Net MRR"
    type: sum
    sql: ${TABLE}.add_on_mrr_c ;;
    filters: {
      field: is_active
      value: "yes"
    }
  }

  measure: additional_invoice_net_mrr_c {
    label: "Current ACM"
    value_format_name: eur
    type: sum
    sql: ${TABLE}.additional_invoice_net_mrr_c ;;
    filters: {
      field: is_active
      value: "yes"
    }
  }

  measure: gross_mrr_c {
    label: "Subscription Gross MRR"
    description: "Theoretical MRR. Remains if churned"
    type: sum
    value_format_name: eur
    sql: ${TABLE}.gross_mrr_c ;;
  }

  measure: net_mrr_c{
    label: "Subscription Net MRR"
    type: sum
    sql: ${last_net_mrr} ;;
    value_format_name: eur
  }
  measure: chargebeeapps_mrr_c {
    label: "Current Net MRR"
    description: "MRR after Coupons. 0 if churned"
    type: sum
    value_format_name: eur
    sql: ${TABLE}.chargebeeapps_mrr_c ;;
  }



#----hidden measures -----------
  measure: chargebeeapps_total_dues_c {
    hidden: yes
    type: sum
    value_format_name: eur
    sql: ${TABLE}.chargebeeapps_total_dues_c ;;
  }
  measure: initial_mrr_c {
    hidden: yes
    type: sum
    value_format_name: eur
    sql: ${TABLE}.initial_mrr_c ;;
  }

  measure: mrr_after_trial_c {
    hidden: yes
    type: sum
    value_format_name: eur
    sql: ${TABLE}.mrr_after_trial_c ;;
  }
  measure: plan_gross_mrr_c {
    label: "Plan Gross MRR"
    hidden: yes
    type: sum
    sql: ${TABLE}.plan_gross_mrr_c ;;
  }
}
