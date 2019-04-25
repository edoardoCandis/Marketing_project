view: cohort_week {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'opportunities.created_week'


      SELECT
        TO_CHAR(DATE_TRUNC('week', opportunities.created_date ), 'YYYY-MM-DD') AS "opportunities.created_week",
        COUNT(DISTINCT CASE WHEN opportunities.check_demo_done_c  THEN opportunities.id  ELSE NULL END) AS "opportunities.done_demos"
      FROM salesforce.opportunities  AS opportunities
      LEFT JOIN salesforce.users  AS users ON opportunities.owner_id = users.id

      WHERE (DATE(opportunities.close_date ))>='2019-01-01'
                          AND opportunities.name NOT LIKE '%test%'
                          AND (CASE WHEN users.user_role_id='00E1t000000cVzBEAU' THEN 'Salesrep'
                    WHEN  users.user_role_id='00E1t000000ca3qEAA' THEN 'Successrep' ELSE 'Other'END)='Salesrep'
                          AND opportunities.is_deleted<>true
      GROUP BY DATE_TRUNC('week', opportunities.created_date )
      ORDER BY 1 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cohort_week {
    type: string
    primary_key: yes
    sql: ${TABLE}."opportunities.created_week" ;;
  }

  dimension: cohort_done_demos {
    type: number
    sql: ${TABLE}."opportunities.done_demos" ;;
  }

  measure: cohort_size {
    type: max
    sql: ${cohort_done_demos} ;;
  }

  set: detail {
    fields: [cohort_week, cohort_done_demos]
  }
}
