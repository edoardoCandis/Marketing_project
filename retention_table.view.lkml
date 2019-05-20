view: retention_table {
  derived_table: {
    sql: --query result: a list of active subscription with their related initial mrr, united to a list of the opportunities that churned (that will thus be replicated) with the related amount and churn_month
      SELECT
      s.id,
      to_char(chargebeeapps_subscription_created_at_c::date, 'yyyy-mm') as created_month,
      -1 AS subs_last,
      COALESCE(convert(float,initial_mrr_c),0.00) as amount


      FROM salesforce.cb_subscriptions s
      LEFT JOIN salesforce.opportunities o ON s.chargebeeapps_cb_oppurtunity_c = o.id OR o.subscription_id_c = s.id
      LEFT JOIN salesforce.accounts a on s.chargebeeapps_company_c = a.id

      WHERE
      --chargebeeapps_subscription_status_c  IN ('CANCELLED','NON_RENEWING')
      (chargebeeapps_subcription_cancelled_at_c BETWEEN '2018-12-01' AND GETDATE() OR chargebeeapps_subcription_cancelled_at_c IS NULL )
      AND a.record_type_id= '0121t000000LSGXAA4'
      AND chargebeeapps_subscription_created_at_c > '2018-10-01'

      UNION

      SELECT
      s.id,
      to_char(chargebeeapps_subscription_created_at_c::date, 'yyyy-mm') as created_month,
      DATEDIFF('day', s.chargebeeapps_subscription_created_at_c::date, chargebeeapps_subcription_cancelled_at_c::date)/30 AS subs_last,
      COALESCE(convert(float,-initial_mrr_c),0.00) as amount


      FROM salesforce.cb_subscriptions s
      LEFT JOIN salesforce.opportunities o ON s.chargebeeapps_cb_oppurtunity_c = o.id OR o.subscription_id_c = s.id
      LEFT JOIN salesforce.accounts a on s.chargebeeapps_company_c = a.id

      WHERE
      chargebeeapps_subscription_status_c  IN ('CANCELLED','NON_RENEWING')
      AND chargebeeapps_subcription_cancelled_at_c BETWEEN '2018-12-01' AND GETDATE()
      AND a.record_type_id= '0121t000000LSGXAA4'
      AND chargebeeapps_subscription_created_at_c BETWEEN '2018-10-01' AND chargebeeapps_subcription_cancelled_at_c
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: created_month {
    type: string
    sql: ${TABLE}.created_month ;;
  }

  dimension: subs_last {
    type: number
    sql: ${TABLE}.subs_last ;;
  }

  measure: amount {
    type: sum
    sql: ${TABLE}.amount ;;
  }

  set: detail {
    fields: [id, created_month, subs_last, amount]
  }
}
