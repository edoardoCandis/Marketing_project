view: fact_transaction_accounts {
  label: "transaction accounts"
  sql_table_name: mongodb.fact_transaction_accounts ;;

  dimension: _connectedby {
    type: string
    sql: ${TABLE}._connectedby ;;
  }

  dimension: _patchedconnectedbyat {
    hidden: yes
    type: string
    sql: ${TABLE}._patchedconnectedbyat ;;
  }

  dimension: accountnumber {
    label: "Account Number"
    type: string
    sql: ${TABLE}.accountnumber ;;
  }

  dimension: bankcode {
    hidden: yes
    type: string
    sql: ${TABLE}.bankcode ;;
  }

  dimension: bankname_detail {
    hidden: yes
    type: string
    sql: lower(${TABLE}.bankname) ;;
  }

  dimension: bank {
    type: string
    sql: CASE WHEN ${bankname_detail} LIKE '%commerzbank%' THEN 'commerzbank'
              WHEN ${bankname_detail} LIKE '%deutsche bank%' THEN 'deutsche bank'
              WHEN ${bankname_detail} LIKE '%sparkasse%' THEN 'sparkasse'
              WHEN ${bankname_detail} LIKE '%volksbank%' THEN 'volksbank'
              WHEN ${bankname_detail} LIKE '%raiffeisen%' THEN 'raiffeisenbank'
              WHEN ${bankname_detail} LIKE '%postbank%' THEN 'postbank'
              WHEN ${bankname_detail} LIKE '%gls%' THEN 'gls bank'
              WHEN ${bankname_detail} LIKE '%vr-bank%' THEN 'vr bank'
              ELSE ${bankname_detail} END;;
  }

  dimension: connectedby {
    hidden: yes
    type: string
    sql: ${TABLE}.connectedby ;;
  }

  dimension_group: createdat {
    label: "Created at"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.createdat ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: is_connected {
    type: yesno
    sql: CASE WHEN ${disconnectedat_raw} IS NULL then true else false END ;;
  }
  dimension_group: disconnectedat {
    hidden: no
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.disconnectedat ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ownerid {
    label: "Company ID"
    type: string
    sql: ${TABLE}.ownerid ;;
  }

  dimension: ownername {
    hidden: yes
    type: string
    sql: ${TABLE}.ownername ;;
  }

  dimension: syncbalances {
    type: yesno
    sql: ${TABLE}.syncbalances ;;
  }

  dimension_group: syncedat {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.syncedat ;;
  }

  dimension: syncstartdate {
    hidden: yes
    type: string
    sql: ${TABLE}.syncstartdate ;;
  }

  dimension: syncstatus {
    hidden: yes
    type: string
    sql: ${TABLE}.syncstatus ;;
  }

  dimension: transactionaccountid {
    label: "Transaction Account id"
    type: string
    primary_key: yes
    sql: ${TABLE}.transactionaccountid ;;
  }

  dimension: transactionaccountkey {
    hidden: yes
    type: string
    sql: ${TABLE}.transactionaccountkey ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updatedat {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updatedat ;;
  }

  dimension: usesequencenumber {
    type: yesno
    sql: ${TABLE}.usesequencenumber ;;
  }

  measure: accounts_count {
    label: "Total Transaction Accounts"
    type: count_distinct
    sql: ${transactionaccountid} ;;
    drill_fields: [transactionaccountid,label,ownername, bankname_detail, name]
  }

  measure: companies_count {
    label: "Total Candis Accounts"
    type: count_distinct
    sql: ${ownerid} ;;
  }
}
