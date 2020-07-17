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
    }

  measure: count_of_collection_fail {
    group_label: "Collection SLA"
    type: sum
    sql: ${slajobcount}-${collectionpass} ;;
    }

  measure: collection_pass_per_cent {
    group_label: "Collection SLA"
    type: number
    sql: ${collectionpass}/${slajobcount} ;;
    value_format: "#.00%"
    }

  measure: count_of_first_delivery_pass {
    group_label: "Delivery SLA"
    type: sum
    sql: ${firstdbtpass} ;;
    value_format_name: decimal_0
##    drill_fields: [sla_first_deliver_detail_*]
  }

  measure: count_of_final_delivery_pass {
    group_label: "Delivery SLA"
    type: sum
    sql: ${finaldbtpass} ;;
    value_format_name: decimal_0
##    drill_fields: [sla_final_deliver_detail_*]
  }

 }
