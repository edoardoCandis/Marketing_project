connection: "candis_redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


datagroup: new_opportunities {
  sql_trigger: SELECT COUNT(*) FROM salesforce.opportunities ;;
  max_cache_age: "24 hours"
}
persist_with: new_opportunities

explore: opportunities {
  fields: [ALL_FIELDS*,-opportunities.followup_owner_c]
  view_label: "Opportunity Information"
  # technically we need to think about only including salesreps:  AND ${users.user_role_id}='Salesrep' but this leads to problems at the start of the funnel.
  sql_always_where: ${close_date}>='2019-01-01'
                    AND ${name} NOT LIKE '%test%'
                    AND ${record_type_id}<>'Multiplier'
                    AND ${is_deleted}<>true;;
  always_filter: {
    filters: {
      field: users.user_role
      value:"Salesrep"
    }
  }
  group_label: "Sales"
  label: "Opportunity Funnel"
  description: "This Explore contains all Information about New Sales Opportunities"

  join: cb_subscriptions {
  fields: [cb_subscriptions.product_billing_cycle_c] #excluding all fields for now
  view_label: "Subscription Information"
  type: left_outer
  relationship: one_to_one
    sql_on: ${opportunities.subscription_id_c} = ${cb_subscriptions.id} ;;
  }

  join: accounts {
    view_label: "Account Source Information"
    type: left_outer
    relationship: many_to_one
    sql_on: ${opportunities.account_id} = ${accounts.id} ;;
    #we take the opportunity value to save the join
    #fields: [-accounts.converted_lead_method_c]
  }

  join: parent_accounts {
    view_label: "Multiplier Information"
    from: accounts
    type: left_outer
    relationship: many_to_one
    sql_on: ${accounts.id} = ${parent_accounts.id} ;;
    fields: [ parent_accounts.multiplier_fields*]
  }

  join: users {
    from: salesforce_users
    view_label: "Opportunity Information"
    type: left_outer
    relationship: many_to_one
    sql_on: ${opportunities.owner_id} = ${users.id} ;;
  }

  join: presales_reps {
    from: salesforce_users
    view_label: "Presales Rep"
    type: left_outer
    relationship: many_to_one
    sql_on: ${accounts.converted_lead_owner_id_c} = ${presales_reps.id} ;;
    sql_where: ${presales_reps.user_role}='Presales' ;;
  }

  #join: fact_demos_done_monthly {
  #
  #   type: left_outer
  #    relationship: one_to_one
  #    sql_on: ${users.name} = ${fact_demos_done_monthly.name} AND ${opportunities.demo_done_date_c_month}=${fact_demos_done_monthly.demo_done_date_c_month} ;;
  #  }

 join: meetings  {
    type: left_outer
    relationship: many_to_one
    sql_on: ${opportunities.id}=${meetings.what_id} ;;
    #only join Webdemos that where not deleted
    sql_where:  ${meetings.subject} LIKE '%webdemo%'
                AND ${meetings.is_deleted}<>true;;
  }

  join: fact_account_sources {
    view_label: "Account Source Information"
    type: left_outer
    relationship: one_to_one
    sql_on: ${accounts.id}=${fact_account_sources.account_id} ;;
  }

}

# ------------------ new explore ------------------------------

explore: meetings {
  sql_always_where:  ${subject} LIKE '%webdemo%'
                      AND ${is_deleted}<>true;;

}

# ------------------ new explore ------------------------------

explore: leads {
  group_label: "Sales"
  label: "Presales"
  view_label: "Lead"
  description: "Primarily Lead information. Everything from creation until demo booked."
  sql_always_where: ${is_deleted}<>true ;;

  always_filter: {
    filters: {
      field: group
      value: "targeted"
    }
  }
  join: converted_lead_account {
    view_label: "Converted Account"
    from: accounts
    type: left_outer
    fields: []
    relationship: many_to_one
    sql_on: ${leads.converted_account_id}=${converted_lead_account.id} ;;
    }

  join: converted_account_opportunity {
    view_label: "Converted Opportunity"
    from: opportunities
    type: left_outer
    fields: [converted_account_opportunity.basic_opportunity_information*]
    relationship: one_to_many
    sql_on: ${converted_account_opportunity.account_id}=${converted_lead_account.id} ;;
    }

  join: lead_owner {
    view_label: "Lead"
    from: salesforce_users
    relationship: many_to_one
    sql_on: ${leads.owner_id}=${lead_owner.id} ;;
  }
  join: fact_account_sources {
    type: left_outer
    fields: [fact_account_sources.grouping_source]
    relationship: many_to_one
    sql_on: ${leads.converted_account_id} = ${fact_account_sources.account_id} ;;
  }

}

# ------------------ new explore ------------------------------


explore: fact_monthly_revenues {
  group_label: "Management"
  label: "Total Revenue & Customers"
}



# Check everything on top of the Funnel (not applying the Salesrep condition
