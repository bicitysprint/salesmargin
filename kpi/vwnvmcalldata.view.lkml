view: vwnvmcalldata {
  sql_table_name: "DATAMART"."VWNVMCALLDATA"
    ;;

  dimension: abandoned {
    type: number
    sql: ${TABLE}."ABANDONED" ;;
  }

  dimension: agentid {
    type: string
    sql: ${TABLE}."AGENTID" ;;
  }


  dimension: answered {
    type: number
    sql: ${TABLE}."ANSWERED" ;;
  }

  dimension: avg_call_duration_minutes {
    type: number
    sql: ${TABLE}."AVGCALLDURATIONMINUTES" ;;
##    value_format: "HH:MM:SS"
  }

  dimension: avg_handled_time_minutes {
    type: number
    sql: ${TABLE}."AVGHANDLEDTIMEMINUTES" ;;
##    value_format: "HH:MM:SS"
  }

  dimension: avg_queue_duration_minutes {
    type: number
    sql: ${TABLE}."AVGQUEUEDURATIONMINUTES" ;;
##    value_format: "HH:MM:SS"
  }

  dimension: call_answered_20 {
    type: number
    sql: ${TABLE}."CALLANSWERED20" ;;
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

  dimension: handled_time_minutes {
    label: "Total Handled Time (Mins)"
    type: number
    sql: ${TABLE}."HANDLEDTIMEMINUTES" ;;
  }

  dimension: call_duration_minutes {
    label: "Total Call Durations (Mins)"
    type: number
    sql: ${TABLE}."CALLDURATIONMINUTES" ;;
  }

  dimension: queue_duration_minutes {
    label: "Total Queue Duration (Mins)"
    type: number
    sql: ${TABLE}."QUEUEDURATIONMINUTES" ;;
  }


  dimension: queue_name {
    type: string
    sql: case
    when ${TABLE}."QUEUENAME" = 'CITYBAGS QUEUE' or "QUEUENAME" = 'SWINDON NCC CS QUEUE'
    or "QUEUENAME" = 'LONDON CENTRAL RECEPTION QUEUE' or "QUEUENAME" = 'IT SERVICE DESK QUEUE'
    or "QUEUENAME" = 'FREIGHT DESK QUEUE' or "QUEUENAME" = 'UCD MOD QUEUE'
    or "QUEUENAME" = 'UCD BRISTOL STRATEGIC TEAMS' or "QUEUENAME" = 'HEMEL OOH LOWER QUEUE'
    or "QUEUENAME" = 'HEMEL OOH OPS QUEUE' or "QUEUENAME" = 'SOUTHERN HEALTH QUEUE'
    or "QUEUENAME" = 'MULTIPLE' or "QUEUENAME" = 'OTD MATCHES QUEUE'
    or "QUEUENAME" = 'BBC QUEUE'
    or "QUEUENAME" = 'OTD P2H QUEUE' or "QUEUENAME" = 'OTD RETAIL QUEUE'
    or "QUEUENAME" = 'BECKTON MAN VAN QUEUE' or "QUEUENAME" = 'CLINICAL TRIAL QUEUE'
    or "QUEUENAME" = 'TRANSWORLD CS QUEUE' or "QUEUENAME" = 'TRANSWORLD OPS QUEUE'
    or "QUEUENAME" = 'ENFIELD COORDINATORS'
    then 'SPECIALIST'
    when ${TABLE}."QUEUENAME" = 'OPERATIONS QUEUE' or "QUEUENAME" = 'OTD OPS QUEUE'
    then 'LONDON'
    else ${TABLE}."QUEUENAME"
    END ;;
  }

  dimension: sc {
    label: "Service Centre"
    type: string
    sql: ${TABLE}."SC" ;;
  }

  dimension: short_abandoned {
    type: number
    sql: ${TABLE}."SHORTABANDONED" ;;
  }

  dimension: total_calls {
    type: number
    sql: ${TABLE}."TOTALCALLS" ;;
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
    type: number
    sql:${TABLE}."TOTALCALLS"  ;;
    drill_fields: [total_calls_detail*]
    value_format_name: decimal_0
  }

  measure: abandon_rate {
    type: number
    sql: case when (${abandoned}) = 0 then 0 else
      (${abandoned}) / (${total_calls}) end  ;;
    value_format: "#.00%"
    drill_fields: [abandon_rate_detail*]
  }

#############################-DRILL SETS-##################################

set: total_calls_detail {
  fields: [date_date,queue_duration_minutes,call_duration_minutes,handled_time_minutes,total_calls]
}

  set: abandon_rate_detail {
    fields: [date_date,total_calls,answered,abandoned,abandon_rate]
  }

}
