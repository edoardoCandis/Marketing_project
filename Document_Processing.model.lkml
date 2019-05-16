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

explore: fact_documents_processed_monthly {
  label: "Processing Overview"
}

explore: doc_processed_raw {
  label: "Documents Processed"
# one could join document data confirmations here SELECT * FROM candis_server.documents_confirm_data WHERE is_processed=false)
}

explore: reviewers {
  label: "AI Training"
  always_filter: {
    filters: {
      field: active_reviewer
      value: "yes"
    }
  }

  # here you can the merge explores to calculate an escalation rate
  join: review_task_resolved {
    relationship: one_to_many
    type: left_outer
    sql_on: ${reviewers.tracking_user_id}=${review_task_resolved.tracking_user_id} ;;
  }

}
