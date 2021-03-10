view: vw_customers {
  sql_table_name: "DATAMART"."VW_CUSTOMERS"
    ;;

  dimension: accountcode {
    primary_key: yes
    type: string
    sql: ${TABLE}."ACCOUNTCODE" ;;
  }

  dimension: accountmanager {
    type: string
    sql: ${TABLE}."ACCOUNTMANAGER" ;;
  }

  dimension: accountmanagerid {
    type: string
    sql: ${TABLE}."ACCOUNTMANAGERID" ;;
  }

  dimension: accountname {
    type: string
    sql: ${TABLE}."ACCOUNTNAME" ;;
  }

  dimension: acquisitioncode {
    type: string
    sql: ${TABLE}."ACQUISITIONCODE" ;;
  }

  dimension: acquisitionname {
    type: string
    sql: ${TABLE}."ACQUISITIONNAME" ;;
  }

  dimension: archive {
    type: string
    sql: ${TABLE}."ARCHIVE" ;;
  }

  dimension: bgt_classification {
    type: string
    sql: ${TABLE}."BGT_CLASSIFICATION" ;;
  }

  dimension: clientcode {
    type: string
    sql: ${TABLE}."CLIENTCODE" ;;
  }

  dimension: clientname {
    type: string
    sql: ${TABLE}."CLIENTNAME" ;;
  }

  dimension: clientreportstatus {
    type: string
    sql: ${TABLE}."CLIENTREPORTSTATUS" ;;
  }

  dimension: consolcode {
    type: string
    sql: ${TABLE}."CONSOLCODE" ;;
  }

  dimension: consolname {
    type: string
    sql: ${TABLE}."CONSOLNAME" ;;
  }

  dimension: datsrc {
    type: string
    sql: ${TABLE}."DATSRC" ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}."DIVISION" ;;
  }

  dimension: fckey {
    type: string
    sql: ${TABLE}."FCKEY" ;;
  }

  dimension: fckey_name {
    type: string
    sql: ${TABLE}."FCKEY_NAME" ;;
  }

  dimension: isnewcustomer {
    type: number
    sql: ${TABLE}."ISNEWCUSTOMER" ;;
  }

  dimension: opptype {
    type: string
    sql: ${TABLE}."OPPTYPE" ;;
  }

  dimension: regional_manager {
    type: string
    sql: ${TABLE}."REGIONAL_MANAGER" ;;
  }

  dimension: reportgroup {
    type: string
    sql: ${TABLE}."REPORTGROUP" ;;
  }

  dimension: sector1 {
    type: string
    sql: ${TABLE}."SECTOR1" ;;
  }

  dimension: sector2 {
    type: string
    sql: ${TABLE}."SECTOR2" ;;
  }

  dimension: sectorsource {
    type: string
    sql: ${TABLE}."SECTORSOURCE" ;;
  }

  dimension: sic {
    type: string
    sql: ${TABLE}."SIC" ;;
  }

  dimension: sicdesc {
    type: string
    sql: ${TABLE}."SICDESC" ;;
  }

  measure: count {
    type: count
    drill_fields: [accountname, clientname, acquisitionname, consolname, fckey_name]
  }

  set: explore_set {
    fields: [clientreportstatus]
  }

}
