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

explore: opportunities {
  sql_always_where: ${close_date}>='2019-01-01' AND ${name} NOT LIKE '%test%' AND ${users.user_role_id}='Salesrep'  ;;
  label: "New Customers"
  join: cb_subscriptions {
    type: left_outer
    relationship: one_to_one
    sql_on: ${opportunities.subscription_id_c} = ${cb_subscriptions.id} ;;
  }

  join: accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${opportunities.account_id} = ${accounts.id} ;;
  }
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${opportunities.owner_id} = ${users.id} ;;
  }
}
