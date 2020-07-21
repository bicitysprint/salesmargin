  view: dt_regions_table {
    derived_table: {
      persist_for: "24 hour"
      sql: select
              r.grouped_name,
              r.region

              from cc.ut_regions_table r group by 1,2
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: grouped_name {
      primary_key: yes
      type: string
      sql: ${TABLE}."GROUPED_NAME" ;;
    }

    dimension: region {
      type: string
      sql:  REPLACE( ${TABLE}."REGION" , '&','and')  ;;
    }

    set: detail {
      fields: [grouped_name, region]
    }
  }
