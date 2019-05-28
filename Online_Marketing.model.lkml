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

explore: online_marketing_sources {
  sql_always_where: ${close_date_date}>='2019-01-01' ;;

  join: cohort_costs {
    type: left_outer
    relationship: many_to_one
    sql_on: ${online_marketing_sources.created_date_date} =  ${cohort_costs.created_date_date} ;;


  }



}


# explore: fact_reattributed_sources {
#   sql_always_where: ${close_date_date}>='2019-01-01' ;;

# join: cohort_costs {
#   type: left_outer
#   relationship: many_to_one
#   sql_on: ${fact_reattributed_sources.created_date_date} =  ${fact_source_cost_daily.date_date} ;;


# }
# }


#------------------------------------------
explore: leads {
  sql_always_where: (${converted_account_opportunity.close_date} >='2019-01-01' OR ${converted_account_opportunity.close_date} is null)
  AND (${converted_account_opportunity.name} NOT LIKE '%test%' OR ${converted_account_opportunity.name} IS NULL)
  AND (${converted_account_opportunity.is_deleted}<>true OR ${converted_account_opportunity.is_deleted} IS NULL )
  AND (NOT ${accounts.referral_account_c}  OR ${accounts.referral_account_c} IS NULL);;
#   AND (${opportunities.record_type_id} = 'Company')


join: accounts {
  type: left_outer
  relationship: many_to_one
  sql_on: ${leads.converted_account_id}=${accounts.id} ;;
  }

  join: converted_account_opportunity {
    from: opportunities
    type: full_outer
    relationship: one_to_one
    sql_on: ${accounts.id}=${converted_account_opportunity.id} ;;
  }

join: fact_account_sources {
  type: left_outer
  relationship: one_to_one
  sql_on: ${accounts.id} = ${fact_account_sources.account_id} ;;
}
  join: lead_owner {
    view_label: "Lead"
    from: salesforce_users
    relationship: many_to_one
    sql_on: ${leads.owner_id}=${lead_owner.id} ;;
  }

  join: website_visits {
    type: full_outer
    relationship: many_to_many
    sql_on: ${website_visits.received_at_date} = ${converted_account_opportunity.created_date} AND ${website_visits.source} = ${fact_account_sources.grouping_source}  ;;
  }
}

explore:website_visits   {

join:  online_marketing_sources {
  type: full_outer
  relationship: many_to_many
  sql_on: ${website_visits.received_at_date} = ${online_marketing_sources.created_date_date} AND ${website_visits.source} = ${online_marketing_sources.source}  ;;
}
}

explore: fact_source_cost_daily {
  sql_always_where:  ;;
  label: "Onlinemarketing Spendings"
}

explore: opportunities {
  label: "Customer Acquisiton Sources"
  sql_always_where: ${close_date}>='2019-01-01'
                    AND NOT ${is_test}
                    AND ${record_type_id}<>'Multiplier'
                    AND ${is_deleted}<>true;;

  join: account_sources {
    from: fact_account_sources
    type: full_outer
    relationship: many_to_one
    sql_on: ${opportunities.account_id}=${account_sources.account_id} ;;
  }
}
