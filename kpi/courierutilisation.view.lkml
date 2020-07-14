view: courierutilisation {
  sql_table_name: "DATAMART"."COURIERUTILISATION"
    ;;

  dimension: available_flag {
    type: number
    sql: ${TABLE}."AVAILABLE_FLAG" ;;
  }

  dimension: courier_sc {
    type: string
    sql: ${TABLE}."COURIER_SC" ;;
  }

  dimension: courier_status {
    type: string
    sql: ${TABLE}."COURIER_STATUS" ;;
  }

  dimension: driver_class {
    type: string
    sql: ${TABLE}."DRIVER_CLASS" ;;
  }

  dimension: driver_key {
    type: string
    sql: ${TABLE}."DRIVER_KEY" ;;
  }

  dimension_group: firstjob {
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
    sql: ${TABLE}."FIRSTJOB" ;;
  }

  dimension_group: lastjob {
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
    sql: ${TABLE}."LASTJOB" ;;
  }

  dimension: local_available_flag {
    type: number
    sql: ${TABLE}."LOCAL_AVAILABLE_FLAG" ;;
  }

  dimension: local_courier_flag {
    type: string
    sql: ${TABLE}."LOCAL_COURIER_FLAG" ;;
  }

  dimension: local_working {
    type: number
    sql: ${TABLE}."LOCAL_WORKING" ;;
  }

  dimension: pro_available_flag {
    type: number
    sql: ${TABLE}."PRO_AVAILABLE_FLAG" ;;
  }

  dimension: pro_working {
    type: number
    sql: ${TABLE}."PRO_WORKING" ;;
  }

  dimension: rejectedjobcount {
    type: number
    sql: ${TABLE}."REJECTEDJOBCOUNT" ;;
  }

  dimension_group: report {
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
    sql: ${TABLE}."REPORT_DATE" ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}."UNIQUE_ID" ;;
  }

  dimension: workday {
    type: number
    sql: ${TABLE}."WORKDAY" ;;
  }

  dimension: working_courier {
    type: number
    sql: ${TABLE}."WORKING_COURIER" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
