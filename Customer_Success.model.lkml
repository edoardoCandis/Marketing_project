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


explore: cb_subscriptions {
  label: "Churn & Susbcriptions"
  sql_always_where: ${is_deleted}<>true ;;

  join: plan_name {
    from: products
    type: left_outer
    relationship: many_to_one
    sql_on: ${cb_subscriptions.chargebeeapps_subscription_plan_id}=${plan_name.id} ;;
  }
}
