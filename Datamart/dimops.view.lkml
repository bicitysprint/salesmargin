view: dimops {
  sql_table_name: "DATAMART"."DIMOPS"
    ;;

  dimension: accountcode {
    type: string
    sql: ${TABLE}."ACCOUNTCODE" ;;
  }

  dimension: agent {
    type: string
    sql: ${TABLE}."AGENT" ;;
  }

  dimension: agenttrackno {
    type: string
    sql: ${TABLE}."AGENTTRACKNO" ;;
  }

  dimension: archive {
    hidden: yes
    type: number
    sql: ${TABLE}."ARCHIVE" ;;
  }

  dimension: bookcaller {
    type: string
    sql: ${TABLE}."BOOKCALLER" ;;
  }

  dimension_group: bookingdatetime {
    group_label: "Booking Date"
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      day_of_week,
      week,
      month,
      month_num,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."BOOKINGDATETIME" ;;
  }

  dimension: bookingtype {
    type: string
    sql: ${TABLE}."BOOKINGTYPE" ;;
  }

  dimension: couriermilage {
    type: number
    sql: ${TABLE}."COURIERMILAGE" ;;
  }

  dimension: custcoreamt {
    type: number
    sql: ${TABLE}."CUSTCOREAMT" ;;
    value_format_name: gbp
  }

  dimension: datasource {
    type: number
    sql: ${TABLE}."DATASOURCE" ;;
  }

  dimension_group: deliverybydatetime {
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
    sql: ${TABLE}."DELIVERYBYDATETIME" ;;
  }

  dimension_group: deliverydatetime {
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
    sql: ${TABLE}."DELIVERYDATETIME" ;;
  }

  dimension: departmentname {
    type: string
    sql: ${TABLE}."DEPARTMENTNAME" ;;
  }

  dimension: drivercoreamt {
    type: number
    sql: ${TABLE}."DRIVERCOREAMT" ;;
  }

  dimension: driverkey {
    type: string
    sql: ${TABLE}."DRIVERKEY" ;;
  }

  dimension: driverstatus {
    type: string
    sql: ${TABLE}."DRIVERSTATUS" ;;
  }

  dimension: fromcomment {
    type: string
    sql: ${TABLE}."FROMCOMMENT" ;;
  }

  dimension: fromcontact {
    type: string
    sql: ${TABLE}."FROMCONTACT" ;;
  }

  dimension: hawb {
    type: string
    sql: ${TABLE}."HAWB" ;;
  }

  dimension: invoiceno {
    type: string
    sql: ${TABLE}."INVOICENO" ;;
  }

  dimension: itemsweight {
    type: number
    sql: ${TABLE}."ITEMSWEIGHT" ;;
  }

  dimension: jobcount {
    type: number
    sql: ${TABLE}."JOBCOUNT" ;;
  }

  dimension: jobno {
    hidden: yes
    type: number
    sql: ${TABLE}."JOBNO" ;;
  }

  dimension: jobno_archive {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${jobno}||'-'||${archive} ;;
  }

  dimension: jobstatus {
    type: string
    sql: ${TABLE}."JOBSTATUS" ;;
  }

  dimension: localworking {
    type: number
    sql: ${TABLE}."LOCALWORKING" ;;
  }

  dimension: mmessage {
    type: string
    sql: ${TABLE}."MMESSAGE" ;;
  }

  dimension: noofitems {
    type: number
    sql: ${TABLE}."NOOFITEMS" ;;
  }

  dimension: oohflag {
    type: string
    sql: ${TABLE}."OOHFLAG" ;;
  }

  dimension: operator {
    type: string
    sql: ${TABLE}."OPERATOR" ;;
  }

  dimension: permflag {
    type: string
    sql: ${TABLE}."PERMFLAG" ;;
  }

  dimension_group: pickupdatetime {
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
    sql: ${TABLE}."PICKUPDATETIME" ;;
  }

  dimension: pod {
    type: string
    sql: ${TABLE}."POD" ;;
  }

  dimension: proworking {
    type: number
    sql: ${TABLE}."PROWORKING" ;;
  }

  dimension: qasvalidation {
    type: string
    sql: ${TABLE}."QASVALIDATION" ;;
  }

  dimension: reference2 {
    type: string
    sql: ${TABLE}."REFERENCE2" ;;
  }

  dimension: reference3 {
    type: string
    sql: ${TABLE}."REFERENCE3" ;;
  }

  dimension: referenceno {
    type: string
    sql: ${TABLE}."REFERENCENO" ;;
  }

  dimension: rejecteddriver {
    type: string
    sql: ${TABLE}."REJECTEDDRIVER" ;;
  }

  dimension: servicecode {
    type: string
    sql: ${TABLE}."SERVICECODE" ;;
  }

  dimension: serviceoption {
    type: string
    sql: ${TABLE}."SERVICEOPTION" ;;
  }

  dimension: split {
    type: string
    sql: ${TABLE}."SPLIT" ;;
  }

  dimension_group: systemdatetime {
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
    sql: ${TABLE}."SYSTEMDATETIME" ;;
  }

  dimension: tocomment {
    type: string
    sql: ${TABLE}."TOCOMMENT" ;;
  }

  dimension: tocontact {
    type: string
    sql: ${TABLE}."TOCONTACT" ;;
  }

  dimension: ukointflag {
    type: string
    sql: ${TABLE}."UKOINTFLAG" ;;
  }

  dimension: umessage {
    type: string
    sql: ${TABLE}."UMESSAGE" ;;
  }

  dimension: unitsdistance {
    type: number
    sql: ${TABLE}."UNITSDISTANCE" ;;
  }

  dimension: vehicletype {
    type: string
    sql: ${TABLE}."VEHICLETYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [departmentname]
  }
}
