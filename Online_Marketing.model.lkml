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
# explore: opportunities  {
#   sql_always_where: ${close_date}>='2019-01-01'
#                     AND ${name} NOT LIKE '%test%'
#                     AND ${record_type_id}<>'Multiplier'
#                     AND ${is_deleted}<>true
#                     AND NOT ${accounts.referral_account_c} ;;




# join: accounts {
#   type: left_outer
#   relationship: many_to_one
#   sql_on: ${opportunities.account_id}=${accounts.id} ;;
#   }

# join:account_sources_reattributed {
#   type: left_outer
#   relationship: many_to_one
#   sql_on: ${accounts.id}=${account_sources_reattributed.account_id} ;;
#   fields: [account_sources_reattributed.source,account_sources_reattributed.share]
# }



# join: fact_source_cost_daily {
#   type: left_outer
#   relationship: many_to_one
#   sql_on: ${opportunities.created_date::date} = ${fact_source_cost_daily.date_date} ;;
# }

# join: fact_monthly_sales_and_method_cost {
#   type: left_outer
#   relationship: many_to_one
#   sql_on: ${fact_monthly_sales_and_method_cost.month}=to_char(${opportunities.created_date},'yyyy-mm') AND ${fact_monthly_sales_and_method_cost.lead_method}=${opportunities.account_lead_method_c}};;

# }
# }

explore: fact_reattributed_sources {
  sql_always_where: ${close_date_date}>='2019-01-01' ;;

join: fact_source_cost_daily {
  type: left_outer
  relationship: many_to_one
  sql_on: ${fact_reattributed_sources.created_date_date} =  ${fact_source_cost_daily.date_date} ;;

}
}
#explore: fact_source_cost_daily {}
