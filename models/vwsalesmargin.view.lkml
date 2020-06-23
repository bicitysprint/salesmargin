view: vwsalesmargin {
  sql_table_name: "DATAMART"."VWSALESMARGIN"
    ;;

  dimension: accrualsincosttt {
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
    type: string
    sql: ${TABLE}."AM" ;;
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

  measure: count {
    type: count
    drill_fields: [monthname, clientname]
  }
}
