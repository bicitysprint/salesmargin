view: postcodelatlng {
  sql_table_name: "CC"."POSTCODELATLNG"
    ;;

  dimension: latitude {
    type: number
    sql: cast(${TABLE}."LATITUDE" as decimal (8,6)) ;;
  }

  dimension: longitude {
    type: number
    sql: cast(${TABLE}."LONGITUDE" as decimal (9,6)) ;;
  }

  dimension: longlat {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude}  ;;
  }

  dimension: postcode {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}."POSTCODE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
