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


# we can use the same grouping since the data must only update daily

datagroup: new_opportunities {
  sql_trigger: SELECT COUNT(*) FROM salesforce.opportunities ;;
  max_cache_age: "24 hours"
}
persist_with: new_opportunities

explore: cb_invoices {
  join: cb_credit_notes {
    relationship: one_to_one
    sql_on: ${cb_invoices.id}=${cb_credit_notes.chargebeeapps_invoice_c} ;;
  }
join: bwa_costs {
  relationship: many_to_many
  sql_on: ${cb_invoices.chargebeeapps_invoice_date_c_month}=${bwa_costs.month} ;;
}


}
