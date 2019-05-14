view: products {
  sql_table_name: salesforce.products ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: chargebeeapps_addon_type_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_addon_type_c ;;
  }

  dimension: product_code {
    hidden: yes
    type: string
    sql: ${TABLE}.product_code ;;
  }

  dimension: chargebeeapps_invoice_name_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_invoice_name_c ;;
  }


  dimension: chargebeeapps_product_type_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_product_type_c ;;
  }

  dimension: chargebeeapps_status_c {
    hidden: yes
    type: string
    sql: ${TABLE}.chargebeeapps_status_c ;;
  }


  dimension: is_active {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_deleted {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }


  dimension: name {
    label: "Product Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: Package {
    #type: string
    sql: CASE WHEN ${name} LIKE '%Light%' OR ${name} LIKE '%1€%' THEN 'Light'
              WHEN ${name} LIKE '%Startup%' THEN 'Startup'
              WHEN ${name} LIKE '%Basic%' THEN 'Basic'
              WHEN ${name} LIKE '%Pro%' THEN 'Pro'
              WHEN ${name} LIKE '%Expert%' THEN 'Expert'
              WHEN ${name} LIKE '%Startup%' THEN 'Startup'
              WHEN ${name} LIKE '%Workflows XS%' THEN 'XS'
              WHEN ${name} LIKE '%Workflows S%' THEN 'S'
              WHEN ${name} LIKE '%Workflows M%' THEN 'M'
              WHEN ${name} LIKE '%Workflows L%' THEN 'L'
              WHEN ${name} LIKE '%Workflows XL%' THEN 'XL'
              ELSE 'Other' END;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
