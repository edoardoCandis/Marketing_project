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

# This belongs more in the success section or financials since it is mostly used for billing purposes
#explore: fact_documents_processed_monthly {
 # label: "Processing Overview"
#}

explore: doc_processed_raw {
  group_label: "Document Processing"
  label: "Processed Documents"
  always_filter: {
    filters: {
      field: received_quarter
      value: "this quarter"
    }
    }
# one could join document data confirmations here SELECT * FROM candis_server.documents_confirm_data WHERE is_processed=false)

}

explore: field_confirmations_error {
  group_label: "Document Processing"
  label: "Processing Errors"
  join: reviewers {
    relationship: many_to_one
    type: left_outer
    sql_on: ${reviewers.email}=${field_confirmations_error.reviewer} ;;
  }
}


# ---------- AI Training Explores -------------------------

explore: review_task_escalated {
  group_label: "AI Training"
  label: "Escalations"
  view_label: "Escalated Task Information"
  join: reviewers {
    relationship: many_to_one
    view_label: "Reviewer Information"
    type: left_outer
    sql_on:  ${reviewers.db_id}=${review_task_escalated.escalated_by} ;;
  }
}


explore: review_task_resolved {
  view_label: "Task Information"
  group_label: "AI Training"
  label: "Review Tasks"
  join: reviewers {
    view_label: "Reviewer Information"
    relationship: many_to_one
    type: left_outer
    sql_on: ${reviewers.tracking_user_id}=${review_task_resolved.tracking_user_id} ;;
  }
}
