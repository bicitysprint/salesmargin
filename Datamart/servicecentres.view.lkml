view: servicecentres {
  sql_table_name: "DATAMART"."SERVICECENTRES"
    ;;

  dimension: accountsc {
    type: string
    sql: ${TABLE}."ACCOUNTSC" ;;
  }

  dimension: allocatedsc {
    type: string
    sql: ${TABLE}."ALLOCATEDSC" ;;
  }

  dimension: archive {
    type: number
    sql: ${TABLE}."ARCHIVE" ;;
  }

  dimension: couriersc {
    type: string
    sql: ${TABLE}."COURIERSC" ;;
  }

  dimension: jobno {
    type: number
    sql: ${TABLE}."JOBNO" ;;
  }

  dimension: jobsc {
    type: string
    sql: ${TABLE}."JOBSC" ;;
  }

  dimension: masc {
    type: string
    sql: ${TABLE}."MASC" ;;
  }

  dimension: ndisc {
    type: string
    sql: ${TABLE}."NDISC" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
