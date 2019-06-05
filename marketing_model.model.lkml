connection: "candis_redshift"

include: "*.view.lkml"

explore: online_marketing_sources {
  sql_always_where: ${close_date_date}>='2019-01-01' ;;

  join: cohort_costs {
    type: left_outer
    relationship: many_to_one
    sql_on: ${online_marketing_sources.created_date_date} =  ${cohort_costs.created_date_date} ;;


  }
}

explore: source_cost_daily {
  label: "Cohort_costs"

  join: cohort_method_wages_costs  {
    type:  full_outer
    relationship: one_to_one
    sql_on: ${cohort_method_wages_costs.created_date_date} = ${source_cost_daily.date_date} AND ${cohort_method_wages_costs.source} = ${source_cost_daily.source} ;;
  }

}


#------------------------------------------
explore: leads {
 label: "Sales Funnel: Leads & Opportunities"


  join: converted_account_opportunity {
    from: opportunities
    type: full_outer
    relationship: one_to_one
    sql_on: ${accounts.id}=${converted_account_opportunity.id} ;;
  }

  join: lead_owner {
    view_label: "Lead"
    from: salesforce_users
    relationship: many_to_one
    sql_on: ${leads.owner_id}=${lead_owner.id} ;;
  }

  join: opportunities {
    type: full_outer
    relationship: many_to_one
    sql_on: ${leads.converted_opportunity_id} = ${opportunities.id} ;;
  }

  join: fact_account_sources {
    type: left_outer
    relationship: many_to_one
    sql_on: ${opportunities.account_id} = ${fact_account_sources.account_id} ;;
  }
      join: accounts {
      type: left_outer
      relationship: many_to_one
      sql_on: ${leads.converted_account_id}=${accounts.id} ;;
    }


}

explore: temp_adwords_comp_acq_campaign_spendings {}
explore: temp_facebook_comp_acq_campaign_spendings {}
explore: marketing_campaign_cost {}
# explore: leads {
#   sql_always_where: (${converted_account_opportunity.close_date} >='2019-01-01' OR ${converted_account_opportunity.close_date} is null)
#       AND (${converted_account_opportunity.name} NOT LIKE '%test%' OR ${converted_account_opportunity.name} IS NULL)
#       AND (${converted_account_opportunity.is_deleted}<>true OR ${converted_account_opportunity.is_deleted} IS NULL )
#       AND (NOT ${accounts.referral_account_c}  OR ${accounts.referral_account_c} IS NULL);;
#     #   AND (${opportunities.record_type_id} = 'Company')
#
#
#     join: accounts {
#       type: left_outer
#       relationship: many_to_one
#       sql_on: ${leads.converted_account_id}=${accounts.id} ;;
#     }
#
#     join: converted_account_opportunity {
#       from: opportunities
#       type: full_outer
#       relationship: one_to_one
#       sql_on: ${accounts.id}=${converted_account_opportunity.id} ;;
#     }
#
#     join: fact_account_sources {
#       type: left_outer
#       relationship: one_to_one
#       sql_on: ${accounts.id} = ${fact_account_sources.account_id} ;;
#     }
#     join: lead_owner {
#       view_label: "Lead"
#       from: salesforce_users
#       relationship: many_to_one
#       sql_on: ${leads.owner_id}=${lead_owner.id} ;;
#     }
#
#     join: website_visits {
#       type: full_outer
#       relationship: many_to_many
#       sql_on: ${leads.tracking_user_id_c} = ${website_visits.user_id}  ;;
#     }
#   }

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

    join: fact_monthly_sales_and_method_cost {
      type: full_outer
      relationship: many_to_one
      # this is technically not correct since we are joining cost of sale on created month instead of closed month. But for simplicity i will leave it like that for now.
      sql_on: ${opportunities.created_month}=${fact_monthly_sales_and_method_cost.month_month} AND ${account_sources.lead_method}=${fact_monthly_sales_and_method_cost.lead_method} AND ${account_sources.presales}=1 ;;
    }
  }


explore: leads_with_content_flag {
  always_filter: {filters: {
    field: is_deleted
    value: "no"
  }
    }
  join: opportunities_with_content_flag {
    type: full_outer
    relationship: many_to_one
    sql_on: ${leads_with_content_flag.converted_opportunity_id} = ${opportunities_with_content_flag.id} ;;
  }
}
