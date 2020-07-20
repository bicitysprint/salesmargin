view: vwsalesmargin {
  sql_table_name: "DATAMART"."VWSALESMARGIN"
    ;;

  dimension: accountcode {
    type: string
    sql: ${TABLE}."CLIENTCODE" ;;
  }

  dimension_group: accountstartdate  {
    label: "Account Start"
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
    sql: ${TABLE}."ACCOUNTSTARTDATE" ;;
  }


  dimension: archivedate {
    type: date
    sql: ${TABLE}."ARCHIVE_START_DATE" ;;
  }


  dimension: archivemonth {
    type: number
    sql: ${TABLE}."ARCHIVEMONTHDATE" ;;
  }


  dimension: accountstartdate {
    type: date
    sql: ${TABLE}."accountstartdate" ;;
  }


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
    order_by_field: am
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

##  dimension: monthnumber {
##    type: number
##    sql: case
##    when ${TABLE}."MONTHNAME" = 'Jan' then '1'
##    when ${TABLE}."MONTHNAME" = 'Feb' then '2'
##    when ${TABLE}."MONTHNAME" = 'Mar' then '3'
##    when ${TABLE}."MONTHNAME" = 'Apr' then '4'
##    when ${TABLE}."MONTHNAME" = 'May' then '5'
##    when ${TABLE}."MONTHNAME" = 'Jun' then '6'
##    when ${TABLE}."MONTHNAME" = 'Jul' then '7'
##    when ${TABLE}."MONTHNAME" = 'Aug' then '8'
##    when ${TABLE}."MONTHNAME" = 'Sep' then '9'
##    when ${TABLE}."MONTHNAME" = 'Oct' then '10'
##    when ${TABLE}."MONTHNAME" = 'Nov' then '11'
##    when ${TABLE}."MONTHNAME" = 'Dec' then '12'
##    else ${TABLE}."MONTHNAME"
##    END  ;;
##  }

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


  dimension: final_revenue {
    type: number
    sql: ${TABLE}."TOTALREVENUEADJUSTED" ;;
  }

  dimension: final_cost {
    type: number
    sql: ${TABLE}."TOTALCOSTADJUSTED" ;;
  }



  measure: rev {
    type: sum
    value_format_name: gbp_0
    sql: ${final_revenue} ;;
    drill_fields: [rev, clientcode, clientname]
  }

  measure: cost {
    type: sum
    value_format_name: gbp_0
    sql: ${final_cost} ;;
  }

  measure: profit {
    type: number
    value_format_name: gbp_0
    sql: sum(${final_revenue}-${final_cost}) ;;
  }

  measure: count {
    type: count
    drill_fields: [monthname, clientname]
  }

  set: account_manager_fields {
    fields: [
      am
      ]
  }

}
