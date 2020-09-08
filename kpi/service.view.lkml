view: service {
  sql_table_name: "DATAMART"."SERVICE"
    ;;

  dimension: archive {
    type: number
    sql: ${TABLE}."ARCHIVE" ;;
  }

  dimension: archive_service {
    primary_key: yes
    hidden: yes
    sql: ${archive}||'-'||${code} ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}."CODE" ;;
  }

  dimension: cubingfactor {
    type: number
    sql: ${TABLE}."CUBINGFACTOR" ;;
  }

  dimension: datasource {
    type: number
    sql: ${TABLE}."DATASOURCE" ;;
  }

  dimension: description {
    label: "Servicecode Description "
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: salesglcode {
    type: string
    sql: ${TABLE}."SALESGLCODE" ;;
  }

  dimension: servicegroup {
    type: string
    sql: ${TABLE}."SERVICEGROUP" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
