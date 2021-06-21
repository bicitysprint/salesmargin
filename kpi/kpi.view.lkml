view: kpi {
  sql_table_name: "DATAMART"."KPI"
    ;;

  dimension: accountcode {
    label: "Account Code"
    type: string
    sql: ${TABLE}."ACCOUNTCODE" ;;
    drill_fields: [jobno,driverkey]
  }

  dimension: accountname {
    label: "Account Name"
    type: string
    sql: ${TABLE}."ACCOUNTNAME"  ;;
    drill_fields: [jobno,driverkey]
  }

  dimension: accountscregion {
    label: "Account Region"
    group_label: "Service Centre Group"
    type: string
    sql:  REPLACE((CASE WHEN ${allocatedsc} = 'London Healthcare' THEN ${allocatedregion}
                   WHEN ${TABLE}."ACCOUNTSCREGION" = 'National Accounts' THEN IFNULL(${courierregion},${jobregion})
                   ELSE ${TABLE}."ACCOUNTSCREGION" END),'&','And')  ;;
    drill_fields: [accountcode,accountname,allocatedsc,driverkey,jobno]
  }

  dimension: accountsc {
    label: "Account Service Centre"
    group_label: "Service Centre Group"
    type: string
    sql: REPLACE((CASE WHEN ${allocatedsc} = 'London Healthcare' THEN 'London Healthcare'
                  WHEN ${TABLE}."ACCOUNTSC" = 'National Accounts' THEN IFNULL(${couriersc},${jobsc})
                  ELSE  ${TABLE}."ACCOUNTSC" END),'&','And') ;;
    drill_fields: [accountcode,accountname,driverkey,jobno]
  }

  dimension: accountscoriginal {
    label: "Account Service Centre (With National Accounts)"
    group_label: "Service Centre Group"
    type: string
    sql: REPLACE(${TABLE}."ACCOUNTSC",'&','And') ;;
    drill_fields: [accountcode,accountname,driverkey,jobno]
  }

  dimension: agent {
    type: string
    sql: ${TABLE}."AGENT" ;;
  }

  dimension: allocatedregion {
    label: "Allocating Region"
    group_label: "Service Centre Group"
    type: string
    sql:  REPLACE( ${TABLE}."ALLOCATEDREGION" , '&','And')  ;;
    drill_fields: [accountcode,accountname,allocatedsc,driverkey,jobno]
  }

  dimension: allocatedsc {
    label: "Allocating Service Centre"
    group_label: "Service Centre Group"
    type: string
    sql: ${TABLE}."ALLOCATEDSC" ;;
    drill_fields: [accountcode,accountname,driverkey,jobno]
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
      day_of_week,
      week,
      week_of_year ,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."BOOKINGDATETIME" ;;
    drill_fields: [bookingdatetime_date]
  }

  dimension: clientname {
    description: "GF Name"
    type: string
    sql: ${TABLE}."CLIENTNAME" ;;
    drill_fields: [consolno,accountcode,accountname,jobno]
  }

  dimension: clientno {
    description: "GF Code"
    type: string
    sql: ${TABLE}."CLIENTNO" ;;
    drill_fields: [consolno,accountcode,accountname,jobno]
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

  dimension: collection_window {
    hidden: yes
    type: string
    sql: ${collection_earliest_time_of_day}||' - '||${collection_latest_time_of_day} ;;
  }

  dimension: collection_window_ {
    type: string
    sql: case when ${collection_sla_type} = 'Window' then ${collection_window} else ' ' end ;;
  }

  dimension: collectionsla_ {
    label: "Collection SLA"
    type: string
    sql: iff(${collectionsla} = 1, 'Pass','Fail') ;;
  }

  dimension: collection_sla_type {
    type: string
    sql: ${TABLE}."COLLECTION_SLA_TYPE" ;;
  }

  dimension: consolno {
    type: string
    sql: ${TABLE}."CONSOLNO" ;;
    drill_fields: [accountcode,accountname,jobno]
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
    sql:  REPLACE( ${TABLE}."COURIERREGION" , '&','And')  ;;
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
    sql: ${TABLE}."CPA"  ;;
    value_format_name: gbp
  }

  dimension: customer_miles {
    type: number
    sql: ${TABLE}."UNITSDISTANCE" ;;
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

  dimension: delivery_window {
    type: string
    sql: ${delivery_earliest_time_of_day}||' - '||${delivery_latest_time_of_day} ;;
  }

  dimension: delivery_sla_type {
    type: string
    sql: ${TABLE}."DELIVERY_SLA_TYPE" ;;
  }

  dimension: departmentname {
    type:  string
    sql: ${TABLE}."DEPARTMENTNAME" ;;
  }

  dimension: driverkey {
    type: string
    sql: ${TABLE}."DRIVERKEY" ;;
    drill_fields: [jobno]
  }

  dimension: driverstatus {
    type: string
    sql: ${TABLE}."DRIVERSTATUS" ;;
  }

  dimension: exceptions {
    type: string
    sql: ${TABLE}."EXCEPTIONS" ;;
  }

  dimension: exception_pass {
    type: number
    sql: ${TABLE}."EXCEPTIONPASS" ;;
  }

  dimension: exception_code {
    type: string
    sql: ${TABLE}."JOBCODES" ;;
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

  dimension: finaldbt_or_window {
    type: string
    sql: case when ${delivery_sla_type} = 'Window' then ${delivery_window} else ${final_dbt_time} end  ;;
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

  dimension: firstdbt_or_window {
    type: string
    sql: case when ${delivery_sla_type} = 'Window' then ${delivery_window} else ${firstdbt_time} end  ;;
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

  dimension: frompostocde {
    type: string
    sql: ${TABLE}."FROMPOSTCODE"  ;;
  }

  dimension_group: job_creation {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      day_of_week,
      day_of_week_index,
      week,
      week_of_year,
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
    sql:  REPLACE( ${TABLE}."JOBREGION" , '&','And')  ;;
  }

  dimension: jobsc {
    label: "Job Service Centre"
    group_label: "Service Centre Group"
    type: string
    sql: REPLACE(${TABLE}."JOBSC",'&','And') ;;
    drill_fields: [accountcode,accountname,driverkey,jobno]
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

  dimension: qas_validation {
    type: string
    sql: ${TABLE}."QASVALIDATION" ;;

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

  dimension: radiofrequency {
    type: string
    sql: ${TABLE}."RADIOFREQUENCY" ;;
  }

  dimension: referenceno {
    type: string
    sql: ${TABLE}."REFERENCENO" ;;
  }

  dimension: reference2 {
    type: string
    sql: ${TABLE}."REFERENCE2" ;;
  }

  dimension: reference3 {
    type: string
    sql: ${TABLE}."REFERENCE3" ;;
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

  dimension: sla_job_type {
    label: "Job Type"
    type: string
    sql:  ${TABLE}."SLA_JOB_TYPE" ;;
  }

  dimension: topostocde {
    type: string
    sql: ${TABLE}."TOPOSTCODE"  ;;
  }

  dimension: topostcode_area {
    map_layer_name: uk_postcode_areas
    sql: CASE WHEN SUBSTRING(${topostocde}, 2, 1) IN ('0','1','2','3','4','5','6','7','8','9')
         THEN UPPER(LEFT(${topostocde}, 1))
         ELSE UPPER(LEFT(${topostocde}, 2)) END ;;
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

  dimension: vehicletype {
    label: "Vehicle Code"
    type: string
    sql: ${TABLE}."VEHICLETYPE" ;;
  }

  dimension: vehicledesc {
    label: "Vehicle Type"
    type: string
    sql: ${TABLE}."VEHICLEDESC" ;;
  }

  ############################   sla time taken in minutes  ################

  dimension: sla_flag {
    type: string
    sql: case when ${umbrella} in ('UK Overnight','International','Network Courier') then 'N'
         when ${servicecode} in ('H','MH') then 'N'
         when ${consolno} = 'QUOTAB' then 'N'
         when ${accountcode} in ('CS203398','CS203404') then 'N'
         when ${radiofrequency} = '35' then 'N' else 'Y' end ;;
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

  dimension: operator {
    label: "Allocated By Operator"
    type: string
    sql: ${TABLE}."OPERATOR" ;;
  }

  dimension: operator_id {
    label: "Allocated By Operator Id"
    type: string
    sql: ${TABLE}."OPERATOR_ID" ;;
  }

  dimension: allocated_date {
    label: "Allocated Date"
    type: date
    sql: ${TABLE}."ALLOCATED_DATETIME" ;;
  }

  dimension: allocated_time {
    label: "Allocated Time"
    type: date_time_of_day
    sql: ${TABLE}."ALLOCATED_DATETIME" ;;
  }

  dimension: accountstartdate {
    label: "Account Start Date"
    type: date
    sql: ${TABLE}."ACCOUNTSTARTDATE" ;;
  }

  dimension: allosc_couriersc_match {
    group_label: "Service Centre Group"
    label: "Allocating SC Matches Courier SC"
    type: string
    sql: iff( ${allocatedsc} = ${couriersc} , 'Yes' , 'No' ) ;;
  }

  dimension: reason {
    label: "Rejected Reason"
    type: string
    sql: ${TABLE}."REASON" ;;
  }

########################## sla for Agilitas dbt no buffer - temporary

  dimension: deliveryvsdbt {
    group_label: "Agilitas Delivery SLA"
    type: number
    sql: datediff(m,${final_dbt_time},${delivery_datetime_time}) ;;
  }


  dimension: deliverysla_dbt{
    group_label: "Agilitas Delivery SLA"
    label: "DBT No Buffer, only for Agilitas"
    type: number
    sql: case
         when ${accountcode} in ('CS198318','CS207785','CS207786') and ${servicecode} = 'DV' then
         (iff(${deliveryvsdbt} >= 1 , 0 , 1))
         else ${finaldbtsla} end
             ;;
  }

  dimension: deliverysla_dbt_text {
    group_label: "Agilitas Delivery SLA"
    label: "DBT Pass/Fail No Buffer, only for Agilitas"
    type: string
    sql: iff(${deliverysla_dbt} = 1, 'Pass', 'Fail') ;;
  }

  ###########################   customer miles measures   ##################################

  measure: sum_of_customer_miles {
    type: sum
    sql: ${customer_miles} ;;
    drill_fields: [miles_detail*]
  }

  ############################  sales and margin measures   #################################

  measure: sum_of_revenue {
    group_label: "Sales & Margin"
    type: sum
    sql: ${revenue} ;;
    drill_fields: [revenue_detail*]
    value_format_name: gbp
##    link: {label: "Drill Sorted by sale price" url: "{{ sum_of_revenue._link}}&sorts=kpi.sum_of_revenue desc" }
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
    drill_fields: [margin_with_service_detail*]
    link: {label: "Drill Sorted by service" url: "{{ gross_margin._link}}&sorts=kpi.bookingdatetime_week_of_year,kpi.accountcode,kpi.servicecode" }
  }

  measure: job_count {
    type:  count_distinct
    sql: ${jobno} ;;
    value_format_name: decimal_0
    drill_fields: [jobcount_detail_*]
  }

  measure: trading_account_count {
    type:  count_distinct
    sql: ${accountcode} ;;
    value_format_name: decimal_0
    drill_fields: [account_count_detail*]
  }


#################################   cpa measures ###################################

measure: sum_of_cpa {
  type: sum
  filters: [kpi.cpa: "!=0"]
  sql: ${cpa} ;;
  value_format_name: gbp
  drill_fields: [cpa_detail*]
}

##measure: profit_less_cpa {
##  type: sum
##  sql: ${profit}-${cpa} ;;
##  value_format_name: gbp
##}


##################################     sla  measures    #################################

  measure: sla_job_count {
    type:  count_distinct
    sql: ${jobno} ;;
    value_format_name: decimal_0
    drill_fields: [sla_detail_*]
  }


  measure: count_of_collection_pass {
    group_label: "Collection SLA"
    type: count_distinct
    sql: ${jobno} ;;
    filters: {
      field: collectionsla
      value: "=1"
    }
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
    sql: case when count(distinct ${jobno}) = 0 then 0 else
         sum(${collectionsla}) / count(distinct ${jobno}) end ;;
    value_format: "#.00%"
    drill_fields: [sla_collect_detail_*]
  }

  measure: collection_fail_per_cent {
    group_label: "Collection SLA"
    type: number
    sql: case when count(distinct ${jobno}) = 0 then 0 else
         count(distinct (case when ${collectionsla} =0 then ${jobno} end)) / count(distinct ${jobno}) end ;;
    value_format: "#.00%"
    drill_fields: [sla_collect_detail_*]
  }

  measure: average_collection_mins {
    group_label: "Collection SLA"
    type: average
    sql: iff(${time_to_collect} < 0 , 0 ,${time_to_collect}) ;;
     drill_fields: [sla_collect_detail_*]
     value_format_name: decimal_0
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
    sql: case when count(distinct ${jobno}) = 0 then 0 else
         sum(${firstdbtsla}) / count(distinct ${jobno}) end ;;
    value_format: "#.00%"
    drill_fields: [sla_first_deliver_detail_*]
  }

  measure: first_delivery_fail_per_cent {
    group_label: "Delivery SLA"
    type: number
    sql: case when count(distinct ${jobno}) = 0 then 0 else
         count(distinct (case when ${firstdbtsla} =0 then ${jobno} end)) / count(distinct ${jobno}) end ;;
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
    drill_fields: [sla_final_deliver_detail_*]
  }

  measure: final_delivery_pass_per_cent {
    group_label: "Delivery SLA"
    type: number
    sql: case when count(distinct ${jobno}) = 0 then 0 else
         sum(${finaldbtsla}) / count(distinct ${jobno}) end ;;
    value_format: "#.00%"
    drill_fields: [sla_final_deliver_detail_*]
  }

  measure: final_delivery_fail_per_cent {
    group_label: "Delivery SLA"
    type: number
    sql: case when count(distinct ${jobno}) = 0 then 0 else
         count(distinct (case when ${finaldbtsla} =0 then ${jobno} end)) / count(distinct ${jobno}) end ;;
    value_format: "#.00%"
    drill_fields: [sla_final_deliver_detail_*]
  }

  measure: average_delivery_mins {
    group_label: "Delivery SLA"
    type: average
    sql: iff(${time_to_deliver} < 0 , 0 , ${time_to_deliver}) ;;
    drill_fields: [sla_final_deliver_detail_*]
    value_format_name: decimal_0
  }

################################### Measures : Agilitas delivery sla temporary  ########################

  measure: count_of_dbt_pass {
    group_label: "Agilitas Delivery SLA"
    type: sum
    sql: ${deliverysla_dbt} ;;
    value_format_name: decimal_0
    drill_fields: [sla_final_deliver_detail_*]
  }

  measure: count_of_dbt_fail {
    group_label: "Agilitas Delivery SLA"
    type: count_distinct
    sql: ${jobno} ;;
    filters: {
      field: deliverysla_dbt
      value: "=0"
    }
    value_format_name: decimal_0
    drill_fields: [sla_final_deliver_detail_*]
  }

  measure: dbt_pass_per_cent {
    group_label: "Agilitas Delivery SLA"
    type: number
    sql: case when count(distinct ${jobno}) = 0 then 0 else
      sum(${deliverysla_dbt}) / count(distinct ${jobno}) end ;;
    value_format: "#.00%"
    drill_fields: [sla_final_deliver_detail_*]
  }

  measure: dbt_fail_per_cent {
    group_label: "Agilitas Delivery SLA"
    type: number
    sql: case when count(distinct ${jobno}) = 0 then 0 else
      count(distinct (case when ${deliverysla_dbt} =0 then ${jobno} end)) / count(distinct ${jobno}) end ;;
    value_format: "#.00%"
    drill_fields: [sla_final_deliver_detail_*]
  }


###################################    drill sets    #####################################


  set: revenue_detail {
    fields: [accountscregion,accountsc,bookingdatetime_week_of_year,accountcode,accountname,sum_of_revenue,sum_of_cost,sum_of_profit,gross_margin]
  }

  set: account_count_detail {
    fields: [accountcode,accountname,job_count,sum_of_revenue,sum_of_cost,sum_of_profit,gross_margin]
  }

  set: miles_detail {
    fields: [accountscregion,accountsc,bookingdatetime_week_of_year,accountcode,accountname,sum_of_revenue,sum_of_customer_miles,job_count]
  }

  set: margin_detail {
    fields: [accountscregion,accountsc,bookingdatetime_week_of_year,accountcode,accountname,revenue,cost,profit]
  }

  set: margin_with_service_detail {
    fields: [bookingdatetime_week_of_year,accountcode,accountname,servicecode,sum_of_revenue,sum_of_cost,gross_margin]
  }

  set: sla_collect_detail_ {
    fields: [allocatedregion,allocatedsc,radiofrequency,accountcode,accountname,consolno,clientno,clientname,jobno,servicecode,sla_job_type,driverkey,bookingdatetime_date,bookingdatetime_time_of_day,collection_arrival_date,collection_arrival_time_of_day,pickup_datetime_date,pickup_datetime_time_of_day,
             collection_window_,time_to_collect,collectionsla_,frompostocde,topostocde]
  }

  set: sla_detail_ {
    fields: [allocatedregion,allocatedsc,radiofrequency,accountcode,accountname,consolno,clientno,clientname,jobno,servicecode,sla_job_type,driverkey,bookingdatetime_date,bookingdatetime_time_of_day,collection_arrival_date,collection_arrival_time_of_day,pickup_datetime_date,pickup_datetime_time_of_day,
      collection_window_,time_to_collect,collectionsla_,delivery_arrival_date,delivery_arrival_time_of_day,delivery_datetime_date,delivery_datetime_time_of_day,
      final_dbt_date,final_dbt_time_of_day,delivery_window,time_to_deliver,finaldbtsla_,frompostocde,topostocde]
  }

  set: sla_first_deliver_detail_ {
    fields: [allocatedregion,allocatedsc,accountcode,accountname,consolno,clientno,clientname,jobno,servicecode,sla_job_type,driverkey,bookingdatetime_date,bookingdatetime_time_of_day,delivery_arrival_date,delivery_arrival_time_of_day,delivery_datetime_date,delivery_datetime_time_of_day,
      firstdbt_or_window,time_to_deliver,firstdbtsla_,frompostocde,topostocde]
  }

  set: sla_final_deliver_detail_ {
    fields: [allocatedregion,allocatedsc,accountcode,accountname,consolno,clientno,clientname,jobno,servicecode,sla_job_type,driverkey,bookingdatetime_date,bookingdatetime_time_of_day,delivery_arrival_date,delivery_arrival_time_of_day,delivery_datetime_date,delivery_datetime_time_of_day,
      finaldbt_or_window,time_to_deliver,finaldbtsla_,frompostocde,topostocde,exception_code,exceptions]
  }

  set: jobcount_detail_ {
    fields: [allocatedregion,allocatedsc,accountcode,accountname,consolno,clientno,clientname,jobno,servicecode,sla_job_type,driverkey,bookingdatetime_date,bookingdatetime_time_of_day,collection_arrival_time_of_day,time_to_collect,collection_window,collectionsla_,delivery_arrival_date,delivery_arrival_time_of_day,delivery_datetime_date,delivery_datetime_time_of_day,
      finaldbt_or_window,time_to_deliver,finaldbtsla_,frompostocde,topostocde,exception_code,exceptions,revenue,cost,gm]
  }

#############################-CPA DRILL SETS-###################################

  set: cpa_detail {
    fields: [allocatedregion,allocatedsc,bookingdatetime_date,jobno,driverkey,accountcode,consolno,group_umbrella,cpa]
  }

  set: cpa_detail2 {
    fields: [allocatedregion,allocatedsc,bookingdatetime_date,accountcode,jobno,driverkey,cpa]
  }

############################# set for SLA only explore  ##############################

  set: sla_explore {
    fields: [accountcode,accountname,bookingdatetime_date,bookingdatetime_time_of_day,bookingdatetime_month_name,bookingdatetime_year,clientno,clientname,collectionsla,collection_arrival_date,collection_arrival_time_of_day,collection_window,collectionsla_,consolno,customer_miles,
      delivery_arrival_date,delivery_arrival_time_of_day,delivery_datetime_date,delivery_datetime_time_of_day,finaldbtsla,finaldbtsla_,exception_code,exception_pass,frompostocde,group_umbrella,jobno,pickup_datetime_date,pickup_datetime_time_of_day,sla_job_type,servicecode,sla_flag,time_to_collect,time_to_deliver,topostocde,umbrella,
      average_collection_mins,collection_pass_per_cent,count_of_collection_pass,count_of_collection_fail,average_delivery_mins,count_of_final_delivery_fail,count_of_final_delivery_pass,final_delivery_pass_per_cent,sla_job_count,sum_of_customer_miles]
  }

}
