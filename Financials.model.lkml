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


# ------------ Explore for Invoices & Refunds ---------------

explore: cb_invoices {
  view_label: "Invoices & Credit Notes"
  sql_always_where: ${cb_invoices.chargebeeapps_invoice_date_c_month}>='2019-01'
                    AND ${is_deleted}<>true ;;
  label: "Financials"
  description: "All Information regarding Invoices, Credit Notes & PL Costs"

  join: cb_credit_notes {
    view_label: "Credit Notes"
    relationship: one_to_one
    sql_on: ${cb_invoices.id}=${cb_credit_notes.chargebeeapps_invoice_c};;
  }

 }

# ------------ Explore for Monthly Cost & Revenues ---------------

explore: fact_monthly_revenues {

join: bwa_costs {
  view_label: "Cost Data"
  relationship: one_to_many
  sql_on: ${fact_monthly_revenues.date_month}=${bwa_costs.month_month} ;;
}


}
