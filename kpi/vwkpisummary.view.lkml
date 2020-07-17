view: vwkpisummary {
  sql_table_name: "DATAMART"."VWKPISUMMARY"
    ;;

  dimension: abandoned {
    type: number
    sql: ${TABLE}."ABANDONED" ;;
  }

  dimension: availablecount {
    type: number
    sql: ${TABLE}."AVAILABLECOUNT" ;;
  }

  dimension: avg_handled_time_minutes {
    type: number
    sql: ${TABLE}."AVG_HANDLED_TIME_MINUTES" ;;
  }

  dimension: avg_queue_duration_minutes {
    type: number
    sql: ${TABLE}."AVG_QUEUE_DURATION_MINUTES" ;;
  }

  dimension_group: bookingdate {
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
    sql: ${TABLE}."BOOKINGDATE" ;;
  }

  dimension: collectionpass {
    type: number
    sql: ${TABLE}."COLLECTIONPASS" ;;
  }

  dimension: cpa {
    type: number
    sql: ${TABLE}."CPA" ;;
  }

  dimension: finaldbtpass {
    type: number
    sql: ${TABLE}."FINALDBTPASS" ;;
  }

  dimension: firstdbtpass {
    type: number
    sql: ${TABLE}."FIRSTDBTPASS" ;;
  }

  dimension: localavailablecount {
    type: number
    sql: ${TABLE}."LOCALAVAILABLECOUNT" ;;
  }

  dimension: localworkingflag {
    type: number
    sql: ${TABLE}."LOCALWORKINGFLAG" ;;
  }

  dimension: proavailablecount {
    type: number
    sql: ${TABLE}."PROAVAILABLECOUNT" ;;
  }

  dimension: proworkingcount {
    type: number
    sql: ${TABLE}."PROWORKINGCOUNT" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}."REVENUE" ;;
  }

  dimension: servicecentre {
    type: string
    sql: ${TABLE}."SERVICECENTRE" ;;
  }

  dimension: servicecentre_date {
    primary_key: yes
    type: string
    sql: ${servicecentre}||'-'||${bookingdate_date} ;;
  }

  dimension: slajobcount {
    type: number
    sql: ${TABLE}."SLAJOBCOUNT" ;;
  }

  dimension: total_calls {
    type: number
    sql: ${TABLE}."TOTAL_CALLS" ;;
  }

  dimension: workingcount {
    type: number
    sql: ${TABLE}."WORKINGCOUNT" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: abandon_rate {
    type: number
    sql: case when (${abandoned}) = 0 then 0 else
      (${abandoned}) / (${total_calls}) end  ;;
    value_format: "#.00%"
    drill_fields: []
  }

##################################     sla  measures    #################################

  measure: count_of_collection_pass {
    group_label: "Collection SLA"
    type: sum
    sql: ${collectionpass} ;;
    value_format_name: decimal_0
##    drill_fields: [sla_collect_detail_*]
  }

##  measure: count_of_collection_fail {
##    group_label: "Collection SLA"
##    type: count_distinct
##    sql: ${jobno} ;;
##    filters: {
##      field: collectionsla
##      value: "=0"
##    }
##    value_format_name: decimal_0
##    drill_fields: [sla_collect_detail_*]
##  }

##  measure: collection_pass_per_cent {
##    group_label: "Collection SLA"
##    type: number
##    sql: sum(${collectionsla}) / count(distinct ${jobno}) ;;
##    value_format: "#.00%"
##    drill_fields: [sla_collect_detail_*]
##  }

##  measure: average_collection_mins {
##    group_label: "Collection SLA"
##    type: number
##    sql: iff(${time_to_collect} < 0 , 0 , avg(${time_to_collect}) ;;
##    drill_fields: [sla_collect_detail_*]
##  }

  measure: count_of_first_delivery_pass {
    group_label: "Delivery SLA"
    type: sum
    sql: ${firstdbtpass} ;;
    value_format_name: decimal_0
##    drill_fields: [sla_first_deliver_detail_*]
  }

##  measure: count_of_first_delivery_fail {
##    group_label: "Delivery SLA"
##    type: count_distinct
##    sql: ${jobno} ;;
##    filters: {
##    field: firstdbtsla
##      value: "=0"
##    }
##    value_format_name: decimal_0
##    drill_fields: [sla_first_deliver_detail_*]
##  }

##  measure: first_delivery_pass_per_cent {
##    group_label: "Delivery SLA"
##    type: number
##    sql: sum(${firstdbtsla}) / count(distinct ${jobno}) ;;
##    value_format: "#.00%"
##    drill_fields: [sla_first_deliver_detail_*]
##  }

  measure: count_of_final_delivery_pass {
    group_label: "Delivery SLA"
    type: sum
    sql: ${finaldbtpass} ;;
    value_format_name: decimal_0
##    drill_fields: [sla_final_deliver_detail_*]
  }

##  measure: count_of_final_delivery_fail {
##    group_label: "Delivery SLA"
##    type: count_distinct
##    sql: ${jobno} ;;
##    filters: {
##      field: finaldbtsla
##      value: "=0"
##    }
##    value_format_name: decimal_0
##    drill_fields: [sla_first_deliver_detail_*]
##  }

##  measure: final_delivery_pass_per_cent {
##    group_label: "Delivery SLA"
##    type: number
##    sql: sum(${finaldbtsla}) / count(distinct ${jobno}) ;;
##    value_format: "#.00%"
##    drill_fields: [sla_final_deliver_detail_*]
##  }

##  measure: average_delivery_mins {
##    group_label: "Delivery SLA"
##    type: number
##    sql: iff(${time_to_deliver} < 0 , 0 , avg(${time_to_deliver}) ;;
##    drill_fields: [sla_final_deliver_detail_*]
##  }



}