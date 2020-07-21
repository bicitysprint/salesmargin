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
      day_of_week,
      week,
      month,
      month_num,
      month_name,
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
    value_format_name: gbp
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
        link: {
         label: "See SLA Detail for {{value}}"
         url: "/dashboards/399?Service%20Centre={{value}}&Date={{ _filters['vwkpisummary.bookingdate_date']}}
               &Region={{ _filters['vwkpisummary.region']}}"
         icon_url: "https://cecil.citysprint.co.uk/favicon.ico"
       }
        link: {
          label: "See Call Stats Detail for {{value}}"
          url: "/dashboards/406?Service%20Centre={{value}}&Date={{ _filters['vwkpisummary.bookingdate_date']}}
               &Region={{ _filters['vwkpisummary.region']}}"
          icon_url: "https://cecil.citysprint.co.uk/favicon.ico"
       }
        link: {
          label: "See CPA Detail for {{value}}"
          url: "/dashboards/400?Service%20Centre={{value}}&Date={{ _filters['vwkpisummary.bookingdate_date']}}
               &Region={{ _filters['vwkpisummary.region']}}"
          icon_url: "https://cecil.citysprint.co.uk/favicon.ico"
        }

        link: {
          label: "See Utilisation Detail for {{value}}"
          url: "/dashboards/402?Service%20Centre={{value}}&Date={{ _filters['vwkpisummary.bookingdate_date']}}
               &Region={{ _filters['vwkpisummary.region']}}"
          icon_url: "https://cecil.citysprint.co.uk/favicon.ico"
        }
  }

  dimension: servicecentre_date {
    hidden: yes
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
    sql: case when sum(${abandoned}) = 0 then 0 else
      sum(${abandoned}) / sum(${total_calls}) end  ;;
    value_format: "#.00%"
    drill_fields: []
  }

  measure: number_of_calls {
    type: number
    sql:${TABLE}."TOTAL_CALLS"  ;;
##    drill_fields: [total_calls_detail*]
    value_format_name: decimal_0
  }

  measure: sum_of_cpa {
    description: "Courier Pay Adjustments"
    label: "CPA"
    type: sum
    filters: [vwkpisummary.cpa: "!=0"]
    sql: ${cpa} ;;
    value_format_name: gbp
 ##   drill_fields: [cpa_detail*]
    }

  measure: sum_revenue {
    label: "Revenue"
    type: sum
    sql: ${revenue} ;;
    value_format_name: gbp
  }

##################################     sla  measures    #################################

  measure: sla_job_count {
    label: "SLA Job Count"
    type: sum
    sql: ${slajobcount} ;;
  }

  measure: count_of_collection_pass {
    group_label: "Collection SLA"
    label: "Collection Pass"
    type: sum
    sql: ${collectionpass} ;;
    value_format_name: decimal_0

##    drill_fields: [kpi.allocatedregion,kpi.allocatedsc,kpi.accountcode,kpi.accountname,kpi.jobno,kpi.bookingdatetime_time,kpi.collection_arrival_time,kpi.pickup_datetime_time,
##             kpi.time_to_collect,kpi.collectionsla_]
    }

  measure: count_of_collection_fail {
    group_label: "Collection SLA"
    label: "Collection Fail"
    type: sum
    sql: ${slajobcount}-${collectionpass} ;;
    }

  measure: collection_pass_per_cent {
    group_label: "Collection SLA"
    label: "Collection Pass %"
    type: number
    sql: sum(${collectionpass})/sum(${slajobcount}) ;;
    value_format: "#.00%"
    }

  measure: collection_fail_per_cent {
    group_label: "Collection SLA"
    label: "Collection Fail %"
    type: number
    sql: case when sum(${slajobcount}) = 0 then 0 else
         sum(${slajobcount}-${collectionpass})/sum(${slajobcount}) end ;;
    value_format: "#.00%"
  }

  measure: count_of_first_delivery_pass {
    group_label: "Delivery SLA"
    label: "First DBT Pass"
    type: sum
    sql: ${firstdbtpass} ;;
    value_format_name: decimal_0
##    drill_fields: [sla_first_deliver_detail_*]
  }

  measure: count_of_first_delivery_fail {
    group_label: "Delivery SLA"
    label: "First DBT Fail"
    type: sum
    sql: ${slajobcount}-${firstdbtpass} ;;

##    filters: {
##    field: firstdbtsla
##      value: "=0"
##    }
##    value_format_name: decimal_0
##    drill_fields: [sla_first_deliver_detail_*]
  }

  measure: first_delivery_pass_per_cent {
    group_label: "Delivery SLA"
    label: "First DBT %"
    type: number
    sql: sum(${firstdbtpass})/sum(${slajobcount}) ;;
    value_format: "#.00%"
##    drill_fields: [sla_first_deliver_detail_*]
  }

  measure: first_delivery_fail_per_cent {
    group_label: "Delivery SLA"
    label: "First DBT Fail %"
    type: number
    sql: case when sum(${slajobcount}) = 0 then 0 else
         sum( ${slajobcount}-${firstdbtpass})/sum(${slajobcount}) end ;;
    value_format: "#.00%"
  }

  measure: count_of_final_delivery_pass {
    group_label: "Delivery SLA"
    label: "Final DBT Pass"
    type: sum
    sql: ${finaldbtpass} ;;
    value_format_name: decimal_0
##    drill_fields: [sla_final_deliver_detail_*]

  }

  measure: count_of_final_delivery_fail {
    group_label: "Delivery SLA"
    label: "Final DBT Fail"
    type: sum
    sql: ${slajobcount}-${finaldbtpass} ;;

}

  measure: final_delivery_pass_per_cent {
    group_label: "Delivery SLA"
    label: "Final DBT %"
    type: number
    sql: sum(${finaldbtpass})/sum(${slajobcount}) ;;
    value_format: "#.00%"
##    drill_fields: [sla_first_deliver_detail_*]
  }

  measure: final_delivery_fail_per_cent {
    group_label: "Delivery SLA"
    label: "Final DBT Fail %"
    type: number
    sql: case when sum(${slajobcount}) = 0 then 0 else
         sum(${slajobcount}-${finaldbtpass})/sum(${slajobcount}) end  ;;
    value_format: "#.00%"
##    drill_fields: [sla_first_deliver_detail_*]

  }

########################### courier util measures  #######################

  measure: available {
    group_label: "Courier Utilisation"
    label: "Available"
    type: sum
    sql: ${availablecount} ;;
    value_format_name: decimal_0
##    drill_fields: [available_detail*]

  }

    measure: courier_utilisation {
    group_label: "Courier Utilisation"
    type: number
    sql: case when sum(${availablecount}) = 0 then 0 else
      sum(${workingcount}) / sum(${availablecount}) end  ;;
    value_format: "#.00%"
##    drill_fields: [available_detail*]

  }

  measure: pro_utilisation {
    group_label: "Courier Utilisation"
    type: number
    sql: case when sum(${proavailablecount}) = 0 then 0 else
      sum(${proworkingcount}) / sum(${proavailablecount}) end  ;;
    value_format: "#.00%"
##    drill_fields: [available_detail*]

  }

  measure: local_utilisation {
    group_label: "Courier Utilisation"
    type: number
    sql: case when sum(${localavailablecount}) = 0 then 0 else
      sum(${localworkingflag}) / sum(${localavailablecount}) end  ;;
    value_format: "#.00%"
##    drill_fields: [available_detail*]

    }

}
