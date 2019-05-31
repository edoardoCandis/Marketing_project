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

  dimension: bankname {
    hidden: yes
    type: string
    sql: ${TABLE}.bankname ;;
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

  dimension_group: disconnectedat {
    hidden: yes
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
    label: "Owner id"
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

  measure: count {
    type: count
    drill_fields: [ownername, bankname, name]
  }
  measure: accounts_count {
    label: "Number of accounts"
    type: count_distinct
    sql: ${transactionaccountid} ;;
  }
}
