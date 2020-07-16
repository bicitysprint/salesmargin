connection: "db"

include: "*.view.lkml"
# include all views in the views/ folder in this project
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

datagroup: vwnvmcalldata_datagroup {
  sql_trigger: SELECT count(*) FROM datamart.vwnvmcalldata;;
  max_cache_age: "24 hour"
}

explore: kpi {
  group_label: "CitySprint"
  description: "KPI"
  persist_with: kpi_datagroup

}

explore: courierutilisation {
  group_label: "CitySprint"
  label: "Courier Utilisation"
  view_label: "Courier Utilisation"
  description: "KPI"
  persist_with: courier_uti_datagroup

  join: dt_regions_table {
    view_label: "Courier Utilisation"
    type: left_outer
    sql_on: ${courierutilisation.courier_sc} = ${dt_regions_table.grouped_name} ;;
    relationship: many_to_one
    fields: [dt_regions_table.region]
  }

}

explore: vwnvmcalldata {
  group_label: "CitySprint"
  label: "Telephony Data"
  view_label: "Telephony Data"
  description: "KPI"
  persist_with: vwnvmcalldata_datagroup

  join: dt_regions_table {
    view_label: "Telephony Data"
    type: left_outer
    sql_on: ${vwnvmcalldata.sc} = ${dt_regions_table.grouped_name} ;;
    relationship: many_to_one
    fields: [dt_regions_table.region]
  }


}
