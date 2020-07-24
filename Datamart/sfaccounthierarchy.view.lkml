view: sfaccounthierarchy {
  sql_table_name: "DATAMART"."SFACCOUNTHIERARCHY"
    ;;

  dimension: accountcode {
    type: string
    sql: ${TABLE}."ACCOUNTCODE" ;;
  }

  dimension: accountid {
    type: string
    sql: ${TABLE}."ACCOUNTID" ;;
  }

  dimension: accountmanager {
    type: string
    sql: ${TABLE}."ACCOUNTMANAGER" ;;
  }

  dimension: accountmanagerid {
    type: string
    sql: ${TABLE}."ACCOUNTMANAGERID" ;;
  }

  dimension: accountname {
    type: string
    sql: ${TABLE}."ACCOUNTNAME" ;;
  }

  dimension: accounttype {
    type: string
    sql: ${TABLE}."ACCOUNTTYPE" ;;
  }

  dimension: acquisitioncode {
    type: string
    sql: ${TABLE}."ACQUISITIONCODE" ;;
  }

  dimension: acquisitionname {
    type: string
    sql: ${TABLE}."ACQUISITIONNAME" ;;
  }

  dimension: adpaccountlevel {
    type: string
    sql: ${TABLE}."ADPACCOUNTLEVEL" ;;
  }

  dimension: adpbudgettype {
    type: string
    sql: ${TABLE}."ADPBUDGETTYPE" ;;
  }

  dimension: adpid {
    type: string
    sql: ${TABLE}."ADPID" ;;
  }

  dimension: adpname {
    type: string
    sql: ${TABLE}."ADPNAME" ;;
  }

  dimension: archive {
    type: string
    sql: ${TABLE}."ARCHIVE" ;;
  }

  dimension: clientcardclientcode {
    type: string
    sql: ${TABLE}."CLIENTCARDCLIENTCODE" ;;
  }

  dimension: clientcardclientname {
    type: string
    sql: ${TABLE}."CLIENTCARDCLIENTNAME" ;;
  }

  dimension: clientcardconsol {
    type: string
    sql: ${TABLE}."CLIENTCARDCONSOL" ;;
  }

  dimension: clientcode {
    type: string
    sql: ${TABLE}."CLIENTCODE" ;;
  }

  dimension: clientindustry {
    type: string
    sql: ${TABLE}."CLIENTINDUSTRY" ;;
  }

  dimension: clientname {
    type: string
    sql: ${TABLE}."CLIENTNAME" ;;
  }

  dimension: consolcardclientcode {
    type: string
    sql: ${TABLE}."CONSOLCARDCLIENTCODE" ;;
  }

  dimension: consolcardclientname {
    type: string
    sql: ${TABLE}."CONSOLCARDCLIENTNAME" ;;
  }

  dimension: consolcardconsol {
    type: string
    sql: ${TABLE}."CONSOLCARDCONSOL" ;;
  }

  dimension: consolcardconsolname {
    type: string
    sql: ${TABLE}."CONSOLCARDCONSOLNAME" ;;
  }

  dimension: consolcode {
    type: string
    sql: ${TABLE}."CONSOLCODE" ;;
  }

  dimension: consolindustry {
    type: string
    sql: ${TABLE}."CONSOLINDUSTRY" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: grandparentid {
    type: string
    sql: ${TABLE}."GRANDPARENTID" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  dimension: opptype {
    type: string
    sql: ${TABLE}."OPPTYPE" ;;
  }

  dimension: parentid {
    type: string
    sql: ${TABLE}."PARENTID" ;;
  }

  dimension_group: startdate {
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
    sql: ${TABLE}."STARTDATE" ;;
  }

  dimension: subdivision {
    type: string
    sql: ${TABLE}."SUBDIVISION" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      adpname,
      clientname,
      clientcardclientname,
      consolcardclientname,
      consolcardconsolname,
      acquisitionname,
      accountname
    ]
  }
}
