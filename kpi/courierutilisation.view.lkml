view: courierutilisation {
  sql_table_name: "DATAMART"."COURIERUTILISATION"
    ;;

  dimension: available_flag {
    type: number
    sql: ${TABLE}."AVAILABLE_FLAG" ;;
  }

  dimension: available_ {
    type: yesno
    sql: case when ${available_flag} = 1 then true else false end ;;
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
      time_of_day,
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
      time_of_day,
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
      day_of_week,
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

  dimension: uid_date {
    primary_key: yes
    type: string
    sql: ${unique_id}||'-'||${report_date} ;;
  }

  dimension: workday {
    type: number
    sql: ${TABLE}."WORKDAY" ;;
  }

  dimension: working_courier {
    type: number
    sql: ${TABLE}."WORKING_COURIER" ;;
  }

  dimension: working_ {
    type: yesno
    sql: case when ${working_courier} = 1 then true else false end ;;
  }

  ###########################  measures  #######################

  measure: sum_of_available_courier {
    type: sum
    sql: ${available_flag} ;;
    drill_fields: [available_detail*]
  }

  measure: sum_of_working_courier {
    type: sum
    sql: ${working_courier} ;;
    drill_fields: [available_detail*]
  }

  measure: sum_of_local_available {
    type: sum
    sql: ${local_available_flag} ;;
    drill_fields: [available_detail*]
  }

  measure: sum_of_local_working {
    type: sum
    sql: ${local_working} ;;
    drill_fields: [available_detail*]
  }

  measure: sum_of_pro_available {
    type: sum
    sql: ${pro_available_flag} ;;
    drill_fields: [available_detail*]
  }

  measure: sum_of_pro_working {
    type: sum
    sql: ${pro_working} ;;
    drill_fields: [available_detail*]
  }

  measure: courier_utilisation {
    type: number
    sql: case when sum(${available_flag}) = 0 then 0 else
      sum(${working_courier}) / sum(${available_flag}) end  ;;
    value_format: "#.00%"
    drill_fields: [available_detail*]
  }

  measure: pro_utilisation {
    type: number
    sql: case when sum(${pro_available_flag}) = 0 then 0 else
      sum(${pro_working}) / sum(${pro_available_flag}) end  ;;
    value_format: "#.00%"
    drill_fields: [available_detail*]
  }

  measure: local_utilisation {
    type: number
    sql: case when sum(${local_available_flag}) = 0 then 0 else
      sum(${local_working}) / sum(${local_available_flag}) end  ;;
    value_format: "#.00%"
    drill_fields: [available_detail*]
  }

  measure: sum_of_rejected_jobs {
    type: sum
    sql: ${rejectedjobcount} ;;
    drill_fields: [available_detail*]
  }

  measure: count_of_couriers_rejected {
    type: count_distinct
    filters: {
      field: rejectedjobcount
      value: ">0"
    }
    sql: ${unique_id} ;;
    drill_fields: [available_detail*]
  }


  ##########################   drill sets   #######################

  set: available_detail {
    fields: [report_date,unique_id,driver_key,local_courier_flag,courier_sc,available_,working_,firstjob_time_of_day,lastjob_time_of_day,sum_of_rejected_jobs]
  }










}
