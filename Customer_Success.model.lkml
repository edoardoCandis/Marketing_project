connection: "candis_redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

datagroup: new_opportunities {
  sql_trigger: SELECT COUNT(*) FROM salesforce.opportunities ;;
  max_cache_age: "24 hours"
}
persist_with: new_opportunities


# ------ explores start here ---------

explore: cb_subscriptions {
  label: "Churn & Susbcriptions"
  view_label: "Subscription Information"
  sql_always_where: ${is_deleted}<>true ;;

  join: plan_name {
    view_label: "Subscription Information"
    from: products
    type: left_outer
    relationship: many_to_one
    fields: [plan_name.product_basic_informatin*]
    sql_on: ${cb_subscriptions.chargebeeapps_subscription_plan_id}=${plan_name.id} ;;
  }

  join: churn_reasons {
    type: left_outer
    relationship: one_to_many
    sql_on: ${cb_subscriptions.id}=${churn_reasons.subscription_id} ;;
  }

  join: fact_monthly_revenues {
    fields: []
    type: left_outer
    relationship: many_to_one
    sql_on: ${cb_subscriptions.chargebeeapps_subcription_cancelled_at_c_month} =${fact_monthly_revenues.date_month};;
  }
  join: top_churn_reasons {
    type: left_outer
    relationship: one_to_many
    sql_on: ${churn_reasons.churn_reason_split} = ${top_churn_reasons.churn_reason_split} AND ${top_churn_reasons.subscription_stage_c} = ${churn_reasons.subscription_stage_c};;
  }
}

explore: customer_interactions {
  label: "Customer Interactions"
always_join: [tags]
join: tags {
  type: left_outer
  relationship: many_to_one
  sql_on: ${customer_interactions._tag} = ${tags.id};;
  fields: [tags.name]
}
}

explore: nps_responses {
label: "NPS Responses"
}

#------------------------------------------
explore: retention_table {
  sql_always_where: ${created_month}>='2019-01' ;;
}
