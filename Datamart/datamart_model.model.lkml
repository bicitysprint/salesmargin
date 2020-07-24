connection: "db"

include: "*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

named_value_format: gbp_format {
  value_format: "#,##0.00"
}

named_value_format: gbp_format_dp {
  value_format: "\"£\"#,##0.00"
}

datagroup: jobspivoted_datagroup {
  sql_trigger: SELECT sum(totalrevenue) FROM datamart.jobspivoted ;;
  max_cache_age: "24 hour"
}

explore: jobspivoted {
         hidden: yes
         group_label: "Datamart"
         label: "Jobs"
         view_label: "Jobs"

        join: dimops {
          view_label: "Jobs"
          sql_on: ${jobspivoted.jobno_archive} = ${dimops.jobno_archive} ;;
          relationship: one_to_one
        }

        join: service {
          view_label: "Jobs"
          sql_on: ${dimops.servicecode} = ${service.code} and
                  ${dimops.archive} = ${service.archive}   ;;
          relationship: one_to_one
          fields: [service.description]
        }

}
