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
    label: "Queue Name"
    type: string
    sql: ${TABLE}."QUEUENAME" ;;
  }

  dimension: sc {
    label: "Service Centre"
    type: string
    primary_key: yes
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

## proposed aggregation measures

## measure: total_avg_abandon_rate {

## measure: total_avg_queue_duration {

## measure: total_avg_handled_time {

  measure: number_of_calls {
    type: sum
    sql:${TABLE}."TOTALCALLS"  ;;
    drill_fields: [total_calls_detail*]
    value_format_name: decimal_0
  }

  measure: count_of_abandon {
    type: count
 ##   sql:${TABLE}."ABANDONED"  ;;
  }


  measure: abandon_rate {
    type: average
    sql: case when (${abandoned}) = 0 then 0 else
      (${abandoned}) / (${total_calls}) end  ;;
    value_format: "#.00%"
    drill_fields: [abandon_rate_detail*]
  }

 measure: total_avg_queue_duration {
  type: average
  sql: ${TABLE}."AVGQUEUEDURATIONMINUTES"  ;;
  value_format_name: decimal_2
 }

 measure: total_avg_handled_time {
   type: average
   sql: ${TABLE}."AVGHANDLEDTIMEMINUTES" ;;
   value_format_name: decimal_2
 }


#############################-DRILL SETS-##################################

set: total_calls_detail {
  fields: [date_date,agentid,queue_duration_minutes,call_duration_minutes,handled_time_minutes,total_calls]
}

  set: abandon_rate_detail {
    fields: [date_date,agentid,total_calls,answered,abandoned,abandon_rate]
  }

}
