view: kpi {
  sql_table_name: "DATAMART"."KPI"
    ;;

  dimension: accountcode {
    label: "Account Code"
    type: string
    sql: ${TABLE}."ACCOUNTCODE" ;;
  }

  dimension: accountname {
    label: "Account Name"
    type: string
    sql: ${TABLE}."ACCOUNTNAME" ;;
  }

  dimension: agent {
    type: string
    sql: ${TABLE}."AGENT" ;;
  }

  dimension: allocatedregion {
    label: "Allocating Region"
    group_label: "Service Centre Group"
    type: string
    sql: ${TABLE}."ALLOCATEDREGION" ;;
  }

  dimension: allocatedsc {
    label: "Allocating Service Centre"
    group_label: "Service Centre Group"
    type: string
    sql: ${TABLE}."ALLOCATEDSC" ;;
  }

  dimension: archive {
    type: number
    sql: ${TABLE}."ARCHIVE" ;;
  }

  dimension_group: bookingdatetime {
    label: "Booking"
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."BOOKINGDATETIME" ;;
  }

  dimension: clientname {
    type: string
    sql: ${TABLE}."CLIENTNAME" ;;
  }

  dimension: clientno {
    type: string
    sql: ${TABLE}."CLIENTNO" ;;
  }

  dimension_group: collection_arrival {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."COLLECTION_ARRIVAL_TIME" ;;
  }

  dimension_group: collection_earliest {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."COLLECTION_EARLIEST" ;;
  }

  dimension_group: collection_latest {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."COLLECTION_LATEST" ;;
  }

  dimension: collectionsla {
    label: "Collection SLA #"
    type: number
    sql: ${TABLE}."COLLECTIONSLA" ;;
  }

  dimension: collectionsla_ {
    label: "Collection SLA"
    type: string
    sql: iff(${collectionsla} = 1, 'Pass','Fail') ;;
  }

  dimension: consolno {
    type: string
    sql: ${TABLE}."CONSOLNO" ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}."COST" ;;
    value_format_name: gbp
  }

  dimension: courierregion {
    label: "Courier Region"
    group_label: "Service Centre Group"
    type: string
    sql: ${TABLE}."COURIERREGION" ;;
  }

  dimension: couriersc {
    label: "Courier Service Centre"
    group_label: "Service Centre Group"
    type: string
    sql: ${TABLE}."COURIERSC" ;;
  }

  dimension: cpa {
    label: "CPA"
    type: number
    sql: (
    select ${TABLE}."CPA" from ${TABLE} where ${TABLE}."CPA" != 0
    ) ;;
    value_format_name: gbp
  }

  dimension_group: delivery_arrival {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVERY_ARRIVAL_TIME" ;;
  }

  dimension_group: delivery_datetime {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVERY_DATETIME" ;;
  }

  dimension_group: delivery_earliest {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVERY_EARLIEST" ;;
  }

  dimension_group: delivery_latest {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVERY_LATEST" ;;
  }

  dimension: delivery_sla_type {
    type: string
    sql: ${TABLE}."DELIVERY_SLA_TYPE" ;;
  }

  dimension: driverkey {
    type: string
    sql: ${TABLE}."DRIVERKEY" ;;
  }

  dimension: driverstatus {
    type: string
    sql: ${TABLE}."DRIVERSTATUS" ;;
  }

  dimension_group: final_dbt {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."FINAL_DBT" ;;
  }

  dimension: finaldbtsla {
    label: "Final DBT SLA #"
    type: number
    sql: ${TABLE}."FINALDBTSLA" ;;
  }

  dimension: finaldbtsla_ {
    label: "Final DBT SLA"
    type: string
    sql: iff(${finaldbtsla} = 1 , 'Pass','Fail') ;;
  }

  dimension_group: firstdbt {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."FIRSTDBT" ;;
  }

  dimension: firstdbtsla {
    label: "First DBT SLA #"
    type: number
    sql: ${TABLE}."FIRSTDBTSLA" ;;
  }

  dimension: firstdbtsla_ {
    label: "First DBT SLA"
    type: string
    sql: iff(${firstdbtsla} = 1 , 'Pass','Fail') ;;
  }

  dimension_group: job_creation {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."JOB_CREATION_TIME" ;;
  }

  dimension: jobno {
    label: "Job Number"
    primary_key: yes
    type: number
    sql: ${TABLE}."JOBNO" ;;
  }

  dimension: jobregion {
    label: "Job Region"
    group_label: "Service Centre Group"
    type: string
    sql: ${TABLE}."JOBREGION" ;;
  }

  dimension: jobsc {
    label: "Job Service Centre"
    group_label: "Service Centre Group"
    type: string
    sql: ${TABLE}."JOBSC" ;;
  }

  dimension: localworking {
    type: number
    sql: ${TABLE}."LOCALWORKING" ;;
  }

  dimension_group: pickup_datetime {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."PICKUP_DATETIME" ;;
  }

  dimension: profit {
    type: number
    sql: ${TABLE}."PROFIT" ;;
    value_format_name: gbp
  }

  dimension: gm {
    label: "Gross Margin"
    type: number
    sql: case when ${revenue} = 0 then 0 else ${profit} / ${revenue} end ;;
    value_format: "#.00%"
  }

  dimension: proworking {
    type: number
    sql: ${TABLE}."PROWORKING" ;;
  }

  dimension: rejecteddriver {
    type: string
    sql: ${TABLE}."REJECTEDDRIVER" ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}."REVENUE" ;;
    value_format_name: gbp
  }

  dimension: servicecode {
    type: string
    sql: ${TABLE}."SERVICECODE" ;;
  }

  dimension: umbrella {
    type: string
    sql: ${TABLE}."UMBRELLA" ;;
  }

  dimension: group_umbrella {
    type: string
    sql: case when ${umbrella} = 'International' then 'International'
              when ${umbrella} = 'UK Overnight' then 'UK Overnight'
              when ${umbrella} = 'Network Courier' then 'Network Courier' else 'SameDay' end  ;;
  }

  ############################   sla time taken in minutes  ################

  dimension: sla_flag {
    type: string
    sql: case when ${umbrella} in ('UK Overnight','International','Network Courier') then 'N' else 'Y' end ;;
  }

  dimension: time_to_collect {
    label: "Time to collect (mins)"
    type: number
    sql: datediff(m,${bookingdatetime_time},ifnull(${collection_arrival_time},${pickup_datetime_time})) ;;
  }

  dimension: time_to_deliver {
    label: "Time to deliver (mins)"
    type: number
    sql: datediff(m,${bookingdatetime_time},ifnull(${delivery_arrival_time},${delivery_datetime_time})) ;;
  }

  ############################  sales and margin measures   #################################

  measure: sum_of_revenue {
    group_label: "Sales & Margin"
    type: sum
    sql: ${revenue} ;;
    drill_fields: [revenue_detail*]
    value_format_name: gbp
  }

  measure: sum_of_cost {
    group_label: "Sales & Margin"
    type: sum
    sql: ${cost} ;;
    drill_fields: []
    value_format_name: gbp
  }

  measure: sum_of_profit {
    group_label: "Sales & Margin"
    type: sum
    sql: ${profit} ;;
    drill_fields: []
    value_format_name: gbp
  }

  measure: gross_margin {
    label: "Total Gross Margin"
    group_label: "Sales & Margin"
    type: number
    sql: case when sum(${revenue}) = 0 then 0 else
         sum(${profit}) / sum(${revenue}) end
    ;;
    value_format: "#.00%"
  }

  measure: job_count {
    type:  count_distinct
    sql: ${jobno} ;;
    value_format_name: decimal_0
  }


#################################   cpa measures ###################################

measure: sum_of_cpa {
  type: sum
  sql: ${cpa} ;;
  value_format_name: gbp
  drill_fields: [cpa_detail*]
}


##################################     sla  measures    #################################

  measure: count_of_collection_pass {
    group_label: "Collection SLA"
    type: sum
    sql: ${collectionsla} ;;
    value_format_name: decimal_0
    drill_fields: [sla_collect_detail_*]
  }

  measure: count_of_collection_fail {
    group_label: "Collection SLA"
    type: count_distinct
    sql: ${jobno} ;;
    filters: {
      field: collectionsla
      value: "=0"
    }
    value_format_name: decimal_0
    drill_fields: [sla_collect_detail_*]
  }

  measure: collection_pass_per_cent {
    group_label: "Collection SLA"
    type: number
    sql: sum(${collectionsla}) / count(distinct ${jobno}) ;;
    value_format: "#.00%"
    drill_fields: [sla_collect_detail_*]
  }

  measure: average_collection_mins {
    group_label: "Collection SLA"
    type: number
    sql: iff(${time_to_collect} < 0 , 0 , avg(${time_to_collect}) ;;
     drill_fields: [sla_collect_detail_*]
  }

  measure: count_of_first_delivery_pass {
    group_label: "Delivery SLA"
    type: sum
    sql: ${firstdbtsla} ;;
    value_format_name: decimal_0
    drill_fields: [sla_first_deliver_detail_*]
  }

  measure: count_of_first_delivery_fail {
    group_label: "Delivery SLA"
    type: count_distinct
    sql: ${jobno} ;;
    filters: {
      field: firstdbtsla
      value: "=0"
    }
    value_format_name: decimal_0
    drill_fields: [sla_first_deliver_detail_*]
  }

  measure: first_delivery_pass_per_cent {
    group_label: "Delivery SLA"
    type: number
    sql: sum(${firstdbtsla}) / count(distinct ${jobno}) ;;
    value_format: "#.00%"
    drill_fields: [sla_first_deliver_detail_*]
  }

  measure: count_of_final_delivery_pass {
    group_label: "Delivery SLA"
    type: sum
    sql: ${finaldbtsla} ;;
    value_format_name: decimal_0
    drill_fields: [sla_final_deliver_detail_*]
  }

  measure: count_of_final_delivery_fail {
    group_label: "Delivery SLA"
    type: count_distinct
    sql: ${jobno} ;;
    filters: {
      field: finaldbtsla
      value: "=0"
    }
    value_format_name: decimal_0
    drill_fields: [sla_first_deliver_detail_*]
  }

  measure: final_delivery_pass_per_cent {
    group_label: "Delivery SLA"
    type: number
    sql: sum(${finaldbtsla}) / count(distinct ${jobno}) ;;
    value_format: "#.00%"
    drill_fields: [sla_final_deliver_detail_*]
  }

  measure: average_delivery_mins {
    group_label: "Delivery SLA"
    type: number
    sql: iff(${time_to_deliver} < 0 , 0 , avg(${time_to_deliver}) ;;
    drill_fields: [sla_final_deliver_detail_*]
  }

###################################    drill sets    #####################################


  set: revenue_detail {
    fields: [jobregion,jobsc,bookingdatetime_date,jobno,accountcode,accountname,group_umbrella,revenue]
  }

  set: margin_detail {
    fields: [jobregion,jobsc,bookingdatetime_date,jobno,accountcode,accountname,group_umbrella,revenue,cost,profit]
  }

 set: cpa_detail {
    fields: [allocatedregion,allocatedsc,bookingdatetime_date,jobno,accountcode,accountname,group_umbrella,cpa]
 }

  set: sla_collect_detail_ {
    fields: [allocatedregion,allocatedsc,accountcode,accountname,jobno,bookingdatetime_time,collection_arrival_time,pickup_datetime_time,
             time_to_collect,collectionsla_]
  }

  set: sla_first_deliver_detail_ {
    fields: [allocatedregion,allocatedsc,accountcode,accountname,jobno,bookingdatetime_time,delivery_arrival_time,delivery_datetime_time,
      firstdbt_time,time_to_deliver,firstdbtsla_]
  }

  set: sla_final_deliver_detail_ {
    fields: [allocatedregion,allocatedsc,accountcode,accountname,jobno,bookingdatetime_time,delivery_arrival_time,delivery_datetime_time,
      final_dbt_time,time_to_deliver,finaldbtsla_]
  }


}
