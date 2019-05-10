connection: "candis_redshift"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


datagroup: new_opportunities {
  sql_trigger: SELECT COUNT(*) FROM salesforce.opportunities ;;
  max_cache_age: "24 hours"
}
persist_with: new_opportunities

explore: opportunities {
  # technically we need to think about only including salesreps:  AND ${users.user_role_id}='Salesrep' but this leads to problems at the start of the funnel.
  sql_always_where: ${close_date}>='2019-01-01'
                    AND ${name} NOT LIKE '%test%'
                    AND ${record_type_id}<>'Multiplier'
                    AND ${is_deleted}<>true;;
  always_filter: {
    filters: {
      field: users.user_role_id
      value:"Salesrep"
    }

  }
  group_label: "Growth Metrics"
  label: "Sales Funnel View"
  description: "This Explore contains all Information about New Sales Opportunities"

  join: cb_subscriptions {
  fields: [cb_subscriptions.product_billing_cycle_c] #excluding all fields for now
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

  join: presales_reps {
    from: users
    view_label: "Presales Rep"
    type: left_outer
    relationship: many_to_one
    sql_on: ${accounts.converted_lead_owner_id_c} = ${presales_reps.id} ;;
    sql_where: ${presales_reps.user_role_id}='Presales' ;;
  }

  join: fact_demos_done_monthly {
    type: left_outer
    relationship: one_to_one
    sql_on: ${users.name} = ${fact_demos_done_monthly.name} AND ${opportunities.demo_done_date_c_month}=${fact_demos_done_monthly.demo_done_date_c_month} ;;
  }

  join: cohort_week {
    type: left_outer
    relationship: one_to_many
    sql_on:  ;;
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

# ------------------ new explore ------------------------------

explore: meetings {
  sql_always_where:  ${subject} LIKE '%webdemo%'
                      AND ${is_deleted}<>true;;

}

# ------------------ new explore ------------------------------

explore: leads {
  sql_always_where: ${is_deleted}<>true ;;

  join: converted_lead_account {
    from: accounts
    type: left_outer
    relationship: many_to_one
    sql_on: ${leads.converted_account_id}=${converted_lead_account.id} ;;
    }

    join: converted_account_opportunity {
      from: opportunities
      type: left_outer
      relationship: many_to_one
      sql_on: ${converted_account_opportunity.account_id}=${converted_lead_account.id} ;;
    }
}

# Check everything on top of the Funnel (not applying the Salesrep condition
