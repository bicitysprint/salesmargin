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

datagroup: kpi_datagroup {
  sql_trigger: SELECT sum(revenue) FROM datamart.kpi;;
  max_cache_age: "24 hour"
}

datagroup: courier_uti_datagroup {
  sql_trigger: SELECT count(*) FROM datamart.courierutilisation;;
  max_cache_age: "24 hour"
}


explore: kpi {
  group_label: "CitySprint"
  description: "KPI"
  persist_with: kpi_datagroup

}

explore: courierutilisation {
  group_label: "CitySprint"
  view_label: "Courier Utilisation"
  description: "KPI"
  persist_with: courier_uti_datagroup
}
