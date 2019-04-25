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

explore: opportunities {
  # technically we need to think about only including salesreps:  AND ${users.user_role_id}='Salesrep' but this leads to problems at the start of the funnel.
  sql_always_where: ${close_date}>='2019-01-01'
                    AND ${name} NOT LIKE '%test%'
                    AND ${users.user_role_id}='Salesrep'
                    AND ${is_deleted}<>true;;
  group_label: "Growth Metrics"
  label: "New Customers"
  description: "This Explore contains all Information about new Sales"
  join: cb_subscriptions {
  fields: [] #excluding all fields for now
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
    view_label: "Salesrep"
    type: left_outer
    relationship: many_to_one
    sql_on: ${opportunities.owner_id} = ${users.id} ;;
  }
  join: fact_demos_done_monthly {
    type: left_outer
    relationship: one_to_one
    sql_on: ${users.name} = ${fact_demos_done_monthly.name} AND ${opportunities.demo_done_date_c_month}=${fact_demos_done_monthly.demo_done_date_c_month} ;;
  }
  join: cohort_week {
    type: left_outer
    relationship: one_to_one
    sql_on: ${opportunities.created_week} = ${cohort_week.cohort_week} ;;
  }
  join: meetings  {
    type: left_outer
    relationship: many_to_one
    sql_on: ${opportunities.id}=${meetings.what_id} ;;
    #only join Webdemos that where not deleted
    sql_where:  ${meetings.subject} LIKE '%webdemo%'
                AND ${meetings.is_deleted}<>true;;
  }
}

explore: meetings {
  sql_always_where:  ${subject} ='Webdemo'
                      AND ${is_deleted}<>true;;

}
