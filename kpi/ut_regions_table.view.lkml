view: ut_regions_table {
  sql_table_name: "CC"."UT_REGIONS_TABLE"
    ;;

  dimension: group {
    type: string
    sql: ${TABLE}."GROUP" ;;
  }

  dimension: grouped_name {
    type: string
    sql: ${TABLE}."GROUPED_NAME" ;;
  }

  dimension: radio_freq {
    type: string
    sql: ${TABLE}."RADIO_FREQ" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: sales_code_d {
    primary_key: yes
    type: string
    sql: ${TABLE}."SALES_CODE_D" ;;
  }

  dimension: sales_code_desc {
    type: string
    sql: ${TABLE}."SALES_CODE_DESC" ;;
  }

  dimension: split {
    description: "CS - CitySprint, MX - Healthcare, OD - On the Dot, N/A - Not Available"
    type: string
    sql: IFNULL(${TABLE}."SPLIT", 'N/A') ;;
  }

  dimension: ss_flag {
    type: string
    sql: ${TABLE}."SS_FLAG" ;;
  }

  measure: count {
    type: count
    drill_fields: [grouped_name]
  }

  set: explore_set {
    fields: [split]
  }

}
