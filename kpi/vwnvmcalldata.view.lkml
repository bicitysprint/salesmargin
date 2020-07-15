view: vwnvmcalldata {
  sql_table_name: "DATAMART"."VWNVMCALLDATA"
    ;;

  dimension: abandoned {
    type: number
    sql: ${TABLE}."ABANDONED" ;;
  }

  dimension: answered {
    type: number
    sql: ${TABLE}."ANSWERED" ;;
  }

  dimension: avg_call_duration {
    type: number
    sql: ${TABLE}."AVG_CALL_DURATION" ;;
  }

  dimension: avg_handled_time {
    type: number
    sql: ${TABLE}."AVG_HANDLED_TIME" ;;
  }

  dimension: avg_queue_duration {
    type: number
    sql: ${TABLE}."AVG_QUEUE_DURATION" ;;
  }

  dimension: call_answered_20 {
    type: number
    sql: ${TABLE}."CALL_ANSWERED_20" ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}."DATE" ;;
  }

  dimension: queue_name {
    type: string
    sql: ${TABLE}."QUEUE_NAME" ;;
  }

  dimension: sc {
    type: string
    sql: ${TABLE}."SC" ;;
  }

  dimension: short_abandoned {
    type: number
    sql: ${TABLE}."SHORT_ABANDONED" ;;
  }

  dimension: total_calls {
    type: number
    sql: ${TABLE}."TOTAL_CALLS" ;;
  }

  dimension: distinct_sc {
   type: string
    sql:
  (
      SELECT (DISTINCT ${TABLE}."SC")
      FROM vwnvmcalldata AS v
      WHERE v.sc = ${TABLE}."SC"
    ) ;;
  }

##############################-MEASURES-#####################################

  measure: count {
    type: count
    drill_fields: [total_calls]
  }





}
