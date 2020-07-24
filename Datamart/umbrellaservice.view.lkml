view: umbrellaservice {
  sql_table_name: "DATAMART"."UMBRELLASERVICE"
    ;;

  dimension: archive {
    type: number
    sql: ${TABLE}."ARCHIVE" ;;
  }

  dimension: citytrak_service_group {
    type: string
    sql: ${TABLE}."CITYTRAK_SERVICE_GROUP" ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}."CODE" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: sales_gl_code {
    type: string
    sql: ${TABLE}."SALES_GL_CODE" ;;
  }

  dimension: service_group {
    type: string
    sql: ${TABLE}."SERVICE_GROUP" ;;
  }

  dimension: umbrella_service {
    type: string
    sql: ${TABLE}."UMBRELLA_SERVICE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
