view: cb_subscriptions {
  sql_table_name: salesforce.cb_subscriptions ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

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

  dimension: chargebeeapps_cb_id_c {
    type: string
    sql: ${TABLE}.chargebeeapps_cb_id_c ;;
  }

  dimension: chargebeeapps_cb_oppurtunity_c {
    type: string
    sql: ${TABLE}.chargebeeapps_cb_oppurtunity_c ;;
  }

  dimension_group: chargebeeapps_chargebee_modified_time_c {
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
    sql: ${TABLE}.chargebeeapps_chargebee_modified_time_c ;;
  }

  dimension: chargebeeapps_city_c {
    type: string
    sql: ${TABLE}.chargebeeapps_city_c ;;
  }

  dimension: chargebeeapps_company_c {
    type: string
    sql: ${TABLE}.chargebeeapps_company_c ;;
  }

  dimension: chargebeeapps_company_name_c {
    type: string
    sql: ${TABLE}.chargebeeapps_company_name_c ;;
  }

  dimension: chargebeeapps_country_c {
    type: string
    sql: ${TABLE}.chargebeeapps_country_c ;;
  }

  dimension_group: chargebeeapps_current_term_end_c {
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
    type: string
    sql: ${TABLE}.chargebeeapps_customer_id_c ;;
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

  dimension: chargebeeapps_first_name_c {
    type: string
    sql: ${TABLE}.chargebeeapps_first_name_c ;;
  }

  dimension: chargebeeapps_last_name_c {
    type: string
    sql: ${TABLE}.chargebeeapps_last_name_c ;;
  }

  dimension: chargebeeapps_mrr_c {
    type: string
    sql: ${TABLE}.chargebeeapps_mrr_c ;;
  }

  dimension: chargebeeapps_next_billing_amount_c {
    type: string
    sql: ${TABLE}.chargebeeapps_next_billing_amount_c ;;
  }

  dimension_group: chargebeeapps_next_billing_c {
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
    type: number
    sql: ${TABLE}.chargebeeapps_plan_quantity_c ;;
  }

  dimension: chargebeeapps_plan_unit_price_c {
    type: string
    sql: ${TABLE}.chargebeeapps_plan_unit_price_c ;;
  }

  dimension: chargebeeapps_po_number_c {
    type: string
    sql: ${TABLE}.chargebeeapps_po_number_c ;;
  }

  dimension: chargebeeapps_remaining_billing_cycles_c {
    type: number
    sql: ${TABLE}.chargebeeapps_remaining_billing_cycles_c ;;
  }

  dimension: chargebeeapps_shipping_email_c {
    type: string
    sql: ${TABLE}.chargebeeapps_shipping_email_c ;;
  }

  dimension: chargebeeapps_shipping_line_1_c {
    type: string
    sql: ${TABLE}.chargebeeapps_shipping_line_1_c ;;
  }

  dimension: chargebeeapps_shipping_line_2_c {
    type: string
    sql: ${TABLE}.chargebeeapps_shipping_line_2_c ;;
  }

  dimension: chargebeeapps_shipping_phone_c {
    type: string
    sql: ${TABLE}.chargebeeapps_shipping_phone_c ;;
  }

  dimension: chargebeeapps_state_c {
    type: string
    sql: ${TABLE}.chargebeeapps_state_c ;;
  }

  dimension_group: chargebeeapps_subcription_activated_at_c {
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

  dimension_group: chargebeeapps_subcription_cancelled_at_c {
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

  dimension: chargebeeapps_subscription_id_c {
    type: string
    sql: ${TABLE}.chargebeeapps_subscription_id_c ;;
  }

  dimension: chargebeeapps_subscription_plan_c {
    type: string
    sql: ${TABLE}.chargebeeapps_subscription_plan_c ;;
  }

  dimension_group: chargebeeapps_subscription_started_at_c {
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
    sql: ${TABLE}.chargebeeapps_subscription_started_at_c ;;
  }

  dimension: chargebeeapps_subscription_status_c {
    type: string
    sql: ${TABLE}.chargebeeapps_subscription_status_c ;;
  }

  dimension: chargebeeapps_total_dues_c {
    type: string
    sql: ${TABLE}.chargebeeapps_total_dues_c ;;
  }

  dimension_group: chargebeeapps_trail_end_c {
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
    sql: ${TABLE}.chargebeeapps_trail_end_c ;;
  }

  dimension_group: chargebeeapps_trial_start_c {
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
    sql: ${TABLE}.chargebeeapps_trial_start_c ;;
  }

  dimension: chargebeeapps_zip_code_c {
    type: string
    sql: ${TABLE}.chargebeeapps_zip_code_c ;;
  }

  dimension: copy_of_gross_mrr_c {
    type: string
    sql: ${TABLE}.copy_of_gross_mrr_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
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

  dimension: gross_mrr_c {
    type: string
    sql: ${TABLE}.gross_mrr_c ;;
  }

  dimension: in_money_back_c {
    type: yesno
    sql: ${TABLE}.in_money_back_c ;;
  }

  dimension: in_trial_stage_c {
    type: yesno
    sql: ${TABLE}.in_trial_stage_c ;;
  }

  dimension: initial_mrr_c {
    type: string
    sql: ${TABLE}.initial_mrr_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: last_net_mrr_c {
    type: string
    sql: ${TABLE}.last_net_mrr_c ;;
  }

  dimension_group: last_referenced {
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
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed {
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
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: mrr_after_trial_c {
    type: string
    sql: ${TABLE}.mrr_after_trial_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: plan_gross_mrr_c {
    type: string
    sql: ${TABLE}.plan_gross_mrr_c ;;
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
    type: string
    sql: ${TABLE}.product_category_c ;;
  }

  dimension_group: received {
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
    sql: ${TABLE}.received_at ;;
  }

  dimension: subscription_addon_count_c {
    type: number
    sql: ${TABLE}.subscription_addon_count_c ;;
  }

  dimension: subscription_stage_c {
    type: string
    sql: ${TABLE}.subscription_stage_c ;;
  }

  dimension_group: system_modstamp {
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
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: uuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: uuid_ts {
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
    sql: ${TABLE}.uuid_ts ;;
  }

  dimension: vat_id_c {
    type: string
    sql: ${TABLE}.vat_id_c ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
