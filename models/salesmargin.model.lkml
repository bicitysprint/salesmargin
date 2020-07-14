connection: "db"

include: "*.view.lkml"

# include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

named_value_format: gbp_format {
  value_format: "#,##0.00"
}

named_value_format: gbp_format_dp {
  value_format: "\"£\"#,##0.00"
}

datagroup: salesmargin_default_datagroup {
   sql_trigger: SELECT COUNT(*) FROM datamart.vwsalesmargin;;
  max_cache_age: "24 hour"
}


persist_with: salesmargin_default_datagroup


explore: salesmargin{
  view_name: vwsalesmargin
  description: "Sales & Margin Info"
  group_label: "CitySprint"
  }
