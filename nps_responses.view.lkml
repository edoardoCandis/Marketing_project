view: nps_responses {
  derived_table: {
    sql: with nps as (select
      n.*,
      c.account_id
      from success.nps_responses n
      left join salesforce.contacts c on lower(n.user_email) = lower(c.email)),

      contacts as (select distinct split_part(email, '@',2) as domain_,
      account_id
      from salesforce.contacts
      WHERE domain_ not like '%gmail%' and
      domain_ not like '%web.de' and
      domain_ not like '%candis%' and
      domain_ not like '%yahoo%'and
      domain_ not like '%google%' and
      domain_ not like '%t-online%' and
      domain_ not like '%icloud%'and
      domain_ not like '%gmx%'and
      domain_ not like '%live%'and
      domain_ not like '%msn%'and
      domain_ not like '%me.com%'and
      domain_ not like '%etl.de%'
      ),

      to_exclude as (select domain_,
              count (distinct account_id) c
              from contacts
              group by 1
              having c>1)


      select distinct n.id, n.response_date, n.user_email, n.nps,
      CASE WHEN  n.account_id IS NULL THEN c.account_id ELSE n.account_id END AS salesforce_account_id
      from nps n
      left join contacts c on lower(split_part(n.user_email, '@',2)) = c.domain_
      where user_email not like '%candis%'
      and domain_ not in (select domain_ from to_exclude)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: response_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.response_date ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.user_email ;;
  }

  dimension: nps {
    type: number
    sql: ${TABLE}.nps ;;
  }

  dimension: salesforce_account_id {
    type: string
    sql: ${TABLE}.salesforce_account_id ;;
  }

  measure: count_accounts {
    label: "Number of Salesforce accounts"
    description: "Number of Salesforce account that rated us at least once"
    type: count_distinct
    sql: ${salesforce_account_id} ;;
  }

  measure: promoters {
    type: count_distinct
    sql: CASE WHEN ${nps}>8 THEN ${id} ELSE null END  ;;
  }

  measure: detractors {
    type: count_distinct
    sql: CASE WHEN ${nps}<6 THEN ${id} ELSE null END  ;;
  }
  set: detail {
    fields: [id, user_email, nps, salesforce_account_id]
  }
}
