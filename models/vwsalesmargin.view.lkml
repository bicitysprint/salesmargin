view: vwsalesmargin {
  sql_table_name: "DATAMART"."VWSALESMARGIN"
    ;;

  dimension: accrualsincost {
    type: number
    sql: ${TABLE}."ACCRUALSINCOST" ;;
  }

  dimension: accrualsinrevenue {
    type: number
    sql: ${TABLE}."ACCRUALSINREVENUE" ;;
  }

  dimension: accrualsoutcost {
    type: number
    sql: ${TABLE}."ACCRUALSOUTCOST" ;;
  }

  dimension: accrualsoutrevenue {
    type: number
    sql: ${TABLE}."ACCRUALSOUTREVENUE" ;;
  }

  dimension: agentcost {
    type: number
    sql: ${TABLE}."AGENTCOST" ;;
  }

  dimension: am {
    label: "Account Manager"
    type: string
    sql: ${TABLE}."AM" ;;
    drill_fields: [account_manager_fields*]
  }

  dimension: archive {
    type: number
    sql: ${TABLE}."ARCHIVE" ;;
  }

  dimension_group: bookingdatetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."BOOKINGDATETIME" ;;
  }

  dimension: clientcode {
    type: string
    sql: ${TABLE}."CLIENTCODE" ;;
  }

  dimension: clientname {
    type: string
    sql: ${TABLE}."CLIENTNAME" ;;
  }

  dimension: cpa {
    type: number
    sql: ${TABLE}."CPA" ;;
  }

  dimension: credits {
    type: number
    sql: ${TABLE}."CREDITS" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}."DISCOUNT" ;;
  }

  dimension: drivercost {
    type: number
    sql: ${TABLE}."DRIVERCOST" ;;
  }

  dimension: jobno {
    type: number
    sql: ${TABLE}."JOBNO" ;;
  }

  dimension: monthname {
    type: string
    sql: ${TABLE}."MONTHNAME" ;;
  }

  dimension: nondistributedjobcost {
    type: number
    sql: ${TABLE}."NONDISTRIBUTEDJOBCOST" ;;
  }

  dimension: opptype {
    type: string
    sql: ${TABLE}."OPPTYPE" ;;
  }

  dimension: reportgroup {
    type: string
    sql: ${TABLE}."REPORTGROUP" ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}."REVENUE" ;;
  }

  dimension: sector {
    type: string
    sql: ${TABLE}."SECTOR" ;;
  }

  dimension: trunkcost {
    type: number
    sql: ${TABLE}."TRUNKCOST" ;;
  }


  dimension: split_revenue {
    type: number
    sql: ${TABLE}."SPLIT_REVENUE" ;;
  }

  dimension: split_cost {
    type: number
    sql: ${TABLE}."SPLIT_COST" ;;
  }



  measure: rev {
    type: sum
    value_format_name: gbp_0
    sql: ${revenue}+${discount}+${credits}+${split_revenue} ;;
  }

  measure: cost {
    type: sum
    value_format_name: gbp_0
    sql: ${drivercost}+${agentcost}+${trunkcost}+${nondistributedjobcost}+${split_cost} ;;
  }


  measure: count {
    type: count
    drill_fields: [monthname, clientname]
  }

  set: account_manager_fields {
    fields: [
      am,
      clientcode,
      clientname,
      rev,
      cost
    ]
  }

}
