view: website_visits {
  derived_table: {
    sql: select distinct
      a.anonymous_id,
      a.user_id,
      a.received_at,
      b.source

      FROM candis_website.pages a
      LEFT JOIN (
              SELECT
              RANK () OVER( PARTITION BY anonymous_id ORDER BY received_at asc) as rank,
              anonymous_id,

              CASE
              WHEN context_campaign_source LIKE '%facebook%' OR url LIKE '%facebook%' THEN 'facebook'
              WHEN context_campaign_source LIKE '%google%' OR context_campaign_source LIKE '%adwords%'
              OR url LIKE '%google%' OR url LIKE '%gclid%' OR url LIKE '%adwords%' THEN 'google'
              WHEN context_campaign_source LIKE '%bing%' OR url LIKE '%bing%' OR url LIKE '%msclkid%' THEN 'bing'
              WHEN lower(context_campaign_source) LIKE '%linkedin%' OR url LIKE '%linkedin%' THEN 'linkedin'
              WHEN lower(context_campaign_source) LIKE '%xing%' OR url LIKE '%xing%' THEN 'xing'
              ELSE 'other' END AS source

              FROM candis_website.pages) b ON a.anonymous_id = b.anonymous_id
      WHERE b.rank=1
      and received_at > '2019-01-01'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: visitors{
    type: count_distinct
    sql: ${anonymous_id} ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension_group: received_at {
    type: time
    sql: ${TABLE}.received_at ;;
  }
  dimension: primary_key {
    primary_key: yes
    type: string
    sql: concat(${anonymous_id},${received_at_raw})
      ;;
  }
  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  set: detail {
    fields: [anonymous_id, received_at_time, source]
  }
}
