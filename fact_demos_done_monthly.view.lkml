# If necessary, uncomment the line below to include explore_source.

#include: "New_Customers.model.lkml"

view: fact_demos_done_monthly
{
  derived_table: {
    explore_source: opportunities {
      column: name { field: users.name }
      column: demo_done_date_c_month {}
      column: done_demos {}
      filters: {
        field: opportunities.demo_done_date_c_date
        value: "after 2019/01/01"
      }
    }
  }
  dimension: name {}

  dimension: demo_done_date_c_month {
    type: date_month
  }
  dimension: done_demos {
    type: number
  }
}
