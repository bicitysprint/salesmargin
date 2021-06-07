view: dt_ifleetdriver_userrole {
  derived_table: {
    persist_for: "24 hour"
    sql: select distinct
      d.callsign,
      d.user_role
      from cc.ifleet_drivers d
      where lower(d.callsign) != 'term'
       ;;
  }

#  measure: count {
#    type: count
#    drill_fields: [detail*]
#  }

  dimension: callsign {
    primary_key: yes
    type: string
    sql: ${TABLE}."CALLSIGN" ;;
  }

  dimension: user_role {
    type: string
    sql: ${TABLE}."USER_ROLE" ;;
  }

  set: detail {
    fields: [callsign, user_role]
  }
}
