view: jobspivoted {
  sql_table_name: "DATAMART"."JOBSPIVOTED"
    ;;

  dimension: accrualsincost {
    group_label: "Accruals"
    type: number
    sql: ${TABLE}."ACCRUALSINCOST" ;;
  }

  dimension: accrualsinrevenue {
    group_label: "Accruals"
    type: number
    sql: ${TABLE}."ACCRUALSINREVENUE" ;;
  }

  dimension: accrualsoutcost {
    group_label: "Accruals"
    type: number
    sql: ${TABLE}."ACCRUALSOUTCOST" ;;
  }

  dimension: accrualsoutrevenue {
    group_label: "Accruals"
    type: number
    sql: ${TABLE}."ACCRUALSOUTREVENUE" ;;
  }

  dimension: agentcost {
    type: number
    sql: ${TABLE}."AGENTCOST" ;;
  }

  dimension: archive {
    type: number
    sql: ${TABLE}."ARCHIVE" ;;
  }

  dimension: costadjustment {
    type: number
    sql: ${TABLE}."COSTADJUSTMENT" ;;
  }

  dimension: cpa {
    type: number
    sql: ${TABLE}."CPA" ;;
  }

  dimension: credits {
    type: number
    sql: ${TABLE}."CREDITS" ;;
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
    value_format_name: id
  }

  dimension: jobno_archive {
    primary_key: yes
    type: string
    sql: ${jobno}||'-'||${archive} ;;
  }

  dimension: nondistributedjobcost {
    type: number
    sql: ${TABLE}."NONDISTRIBUTEDJOBCOST" ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}."REVENUE" ;;
    value_format_name: gbp
  }

  dimension: revenueadjustment {
    type: number
    sql: ${TABLE}."REVENUEADJUSTMENT" ;;
    value_format_name: gbp
  }

  dimension: totalcost {
    type: number
    sql: ${TABLE}."TOTALCOST" ;;
    value_format_name: gbp
  }

  dimension: totalcostadjusted {
    type: number
    sql: ${TABLE}."TOTALCOSTADJUSTED" ;;
    value_format_name: gbp
  }

  dimension: totalrevenue {
    type: number
    sql: ${TABLE}."TOTALREVENUE" ;;
    value_format_name: gbp
  }

  dimension: totalrevenueadjusted {
    type: number
    sql: ${TABLE}."TOTALREVENUEADJUSTED" ;;
    value_format_name: gbp
  }

  dimension: trunkcost {
    type: number
    sql: ${TABLE}."TRUNKCOST" ;;
    value_format_name: gbp
  }

  #########################################    measures   ########################################

  measure: sum_of_revenue {
    type: sum
    sql: ${totalrevenue} ;;
    value_format_name: gbp
    drill_fields: []
  }
}
