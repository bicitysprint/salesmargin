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
##    value_format: "HH:MM:SS"
  }

  dimension: avg_handled_time {
    type: number
    sql: ${TABLE}."AVG_HANDLED_TIME" ;;
##    value_format: "HH:MM:SS"
  }

  dimension: avg_queue_duration {
    type: number
    sql: ${TABLE}."AVG_QUEUE_DURATION" ;;
##    value_format: "HH:MM:SS"
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
    sql: case
    when ${TABLE}."QUEUE_NAME" = 'CITYBAGS QUEUE' or "QUEUE_NAME" = 'SWINDON NCC CS QUEUE'
    or "QUEUE_NAME" = 'LONDON CENTRAL RECEPTION QUEUE' or "QUEUE_NAME" = 'IT SERVICE DESK QUEUE'
    or "QUEUE_NAME" = 'FREIGHT DESK QUEUE' or "QUEUE_NAME" = 'UCD MOD QUEUE'
    or "QUEUE_NAME" = 'UCD BRISTOL STRATEGIC TEAMS' or "QUEUE_NAME" = 'HEMEL OOH LOWER QUEUE'
    or "QUEUE_NAME" = 'HEMEL OOH OPS QUEUE' or "QUEUE_NAME" = 'SOUTHERN HEALTH QUEUE'
    or "QUEUE_NAME" = 'MULTIPLE' or "QUEUE_NAME" = 'OTD MATCHES QUEUE'
    or "QUEUE_NAME" = 'BBC QUEUE' or "QUEUE_NAME" = 'OTD OPS QUEUE'
    or "QUEUE_NAME" = 'OTD P2H QUEUE' or "QUEUE_NAME" = 'OTD RETAIL QUEUE'
    or "QUEUE_NAME" = 'BECKTON MAN VAN QUEUE' or "QUEUE_NAME" = 'CLINICAL TRIAL QUEUE'
    or "QUEUE_NAME" = 'TRANSWORLD CS QUEUE' or "QUEUE_NAME" = 'TRANSWORLD OPS QUEUE'
    or "QUEUE_NAME" = 'ENFIELD COORDINATORS'
    then 'SPECIALIST'
    else ${TABLE}."QUEUE_NAME"
    END ;;
  }

  dimension: sc {
    label: "Service Centre"
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

##  dimension: distinct_sc {
##   type: string
##    sql:
##  (
##      SELECT_DISTINCT(${TABLE}."SC")
##      FROM vwnvmcalldata AS v
##      WHERE v.sc = ${TABLE}."SC"
##    ) ;;
##  }

##############################-MEASURES-#####################################

  measure: count {
    type: count
    drill_fields: [total_calls]
  }

  measure: number_of_calls {
    type: sum
    sql:${TABLE}."TOTAL_CALLS"  ;;
  }

  measure: abandon_rate {
    type: number
    sql: case when (${abandoned}) = 0 then 0 else
      (${abandoned}) / (${total_calls}) end  ;;
    value_format: "#.00%"
  }


}
