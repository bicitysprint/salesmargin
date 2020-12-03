view: vwnoanswercalls {
  sql_table_name: "DATAMART"."VWNOANSWERCALLS"
    ;;

  dimension: agentid {
    type: string
    sql: ${TABLE}."AGENTID" ;;
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

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: inboundcalls {
    type: number
    sql: ${TABLE}."INBOUNDCALLS" ;;
  }

  dimension: noanswers {
    type: number
    sql: ${TABLE}."NOANSWERS" ;;
  }

  dimension: sc {
    label: "Service Centre"
    type: string
    sql: ${TABLE}."SC" ;;
    drill_fields: [agentid]
  }

  dimension: totalcalls {
    type: number
    sql: ${TABLE}."TOTALCALLS" ;;
  }

  dimension: abandoned_rate {
    type: number
    sql: case when ${totalcalls} = 0 then 0 else
         ${noanswers} / ${totalcalls} end    ;;
    value_format: "#.00%"
  }

  ###################################  measures

  measure: number_of_inbound_calls {
    type: sum
    sql: ${inboundcalls} ;;
    drill_fields: [agentid,sc,department,number_of_inbound_calls]
  }

  measure: number_of_total_calls {
    type: sum
    sql: ${totalcalls} ;;
    drill_fields: [agentid,sc,department,number_of_inbound_calls,number_of_no_answers]
  }

  measure: number_of_no_answers {
    type: sum
    sql: ${noanswers} ;;
    drill_fields: [agentid,sc,department,number_of_no_answers]
  }

  measure: abandon_rate {
    type: number
    sql: case when sum(${totalcalls}) = 0 then 0 else
         sum(${noanswers}) / sum(${totalcalls}) end    ;;
    value_format: "#.00%"
    drill_fields: [agentid,sc,department,number_of_inbound_calls,number_of_no_answers]
  }


}
