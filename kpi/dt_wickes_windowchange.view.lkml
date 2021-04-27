view: dt_wickes_windowchange {
  derived_table: {
    persist_for: "24 hour"
    sql: with cte1 as
      (
      select
      ja.archive,
      ja.job_number,
      to_date(ja.entry_date) as entry_date,
      to_time(ja.entry_time) as entry_time,
      ja.user_id,
      ja.flag_2,
      right(ja.flag_1,62) as deliverywindow_change,

      row_number() over (partition by ja.job_number order by to_date(ja.entry_date) desc, to_time(ja.entry_time) desc) as rn

      from cc.jobaudit ja
      where ja.flag_1 ilike '%delivery stop time window%' and ja.archive >= 210000 and lower(ja.user_id) != 'api'
      order by 2
      )

      select
      k.archive,
      k.jobno,
      to_date(k.bookingdatetime) as bookingdate,
      to_time(k.bookingdatetime) as bookingtime,
      k.accountcode,
      k.accountname,
      to_time(k.delivery_earliest) ||' - '||to_time(k.delivery_latest) as window,
      cte1.deliverywindow_change,
      cte1.user_id,
      cte1.flag_2,
      cte1.entry_date,
      cte1.entry_time,
      k.delivery_arrival_time,
      k.delivery_datetime,
      iff(k.finaldbtsla = 1,'Pass','Fail') as finaldbt,
      k.allocatedsc,
      k.servicecode

      from datamart.kpi k
      inner join cte1 on k.jobno = cte1.job_number and k.archive = cte1.archive and cte1.rn = 1
      where k.consolno = 'CS024301' and k.archive >= 210000 and cte1.entry_date >= to_date(k.bookingdatetime) and k.servicecode in ('1P','2P')
      order by 3,1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: archive {
    type: number
    sql: ${TABLE}."ARCHIVE" ;;
    value_format_name: id
  }

  dimension: jobno {
    type: number
    sql: ${TABLE}."JOBNO" ;;
    value_format_name: id
  }

  dimension: archivejobno {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."ARCHIVE" || '-' || ${TABLE}."JOBNO"  ;;
  }

  dimension: bookingdate {
    type: date
    sql: ${TABLE}."BOOKINGDATE" ;;
  }

  dimension_group: bookingtime {
    type: time
    sql: ${TABLE}."BOOKINGTIME" ;;
  }

  dimension: accountcode {
    type: string
    sql: ${TABLE}."ACCOUNTCODE" ;;
  }

  dimension: accountname {
    type: string
    sql: ${TABLE}."ACCOUNTNAME" ;;
  }

  dimension: window {
    type: string
    sql: ${TABLE}."WINDOW" ;;
  }

  dimension: deliverywindow_change {
    type: string
    sql: ${TABLE}."DELIVERYWINDOW_CHANGE" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: flag_2 {
    type: string
    sql: ${TABLE}."FLAG_2" ;;
  }

  dimension: entry_date {
    type: date
    sql: ${TABLE}."ENTRY_DATE" ;;
  }

  dimension_group: entry_time {
    type: time
    sql: ${TABLE}."ENTRY_TIME" ;;
  }

  dimension_group: delivery_arrival_time {
    type: time
    sql: ${TABLE}."DELIVERY_ARRIVAL_TIME" ;;
  }

  dimension_group: delivery_datetime {
    type: time
    sql: ${TABLE}."DELIVERY_DATETIME" ;;
  }

  dimension: finaldbt {
    type: string
    sql: ${TABLE}."FINALDBT" ;;
  }

  dimension: allocatedsc {
    type: string
    sql: ${TABLE}."ALLOCATEDSC" ;;
  }

  dimension: servicecode {
    type: string
    sql: ${TABLE}."SERVICECODE" ;;
  }

  set: detail {
    fields: [
      archive,
      jobno,
      bookingdate,
      bookingtime_time,
      accountcode,
      accountname,
      window,
      deliverywindow_change,
      user_id,
      flag_2,
      entry_date,
      entry_time_time,
      delivery_arrival_time_time,
      delivery_datetime_time,
      finaldbt,
      allocatedsc
    ]
  }
}
