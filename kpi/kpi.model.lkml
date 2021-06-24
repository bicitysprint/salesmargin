connection: "db"

include: "*.view.lkml"
include: "/Datamart/**/dimops.view"

#include: "views/*.view.lkml" #all views in the views/ folder in this project
#include: "/**/view.lkml"                   # include all views in this project
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

datagroup: vwkpisummary_datagroup {
  sql_trigger: SELECT count(*) FROM datamart.vwkpisummary;;
  max_cache_age: "24 hour"
}

datagroup: noanswer_datagroup {
  sql_trigger: SELECT count(*) FROM datamart.vwnoanswercalls;;
  max_cache_age: "24 hour"
}


explore: kpi {
  group_label: "CitySprint"
  description: "KPI"
  persist_with: kpi_datagroup

  access_filter: {
    field: allocatedsc
    user_attribute: ops_kpi_service_centre_filter
  }

  join: service {
    view_label: "Kpi"
    type: left_outer
    sql_on: ${kpi.servicecode} = ${service.code} and ${kpi.archive} = ${service.archive} ;;
    relationship: many_to_one
    fields: [service.description]
  }
  join: salesforce_account_hierarchy {
    view_label: "Kpi"
    type: left_outer
    relationship: many_to_one
    sql_on: ${kpi.accountcode} = ${salesforce_account_hierarchy.account_number} ;;
    fields: [salesforce_account_hierarchy.fields_for_explore*]
  }

  join: vw_customers {
    view_label: "Kpi"
    type: left_outer
    relationship: many_to_one
    sql_on: ${kpi.accountcode} = ${vw_customers.accountcode} ;;
    fields: [vw_customers.explore_set*]
  }

  join: ut_regions_table {
    view_label: "Kpi"
    type: left_outer
    relationship: many_to_one
    sql_on: ${vw_customers.office_code} = ${ut_regions_table.sales_code_d} ;;
    fields: [ut_regions_table.explore_set*]
  }

  join: postcodelatlng {
    view_label: "Destination Longs and Lats"
    type: left_outer
    relationship: many_to_one
    sql_on: ${kpi.topostocde} = ${postcodelatlng.postcode} ;;
  }

  join: dt_ifleetdriver_userrole {
    view_label: "Kpi"
    type: left_outer
    relationship: many_to_one
    sql_on: ${kpi.driverkey}= ${dt_ifleetdriver_userrole.callsign} ;;
    fields: [dt_ifleetdriver_userrole.user_role]
  }

  join: dimops {
    view_label: "Kpi"
    type: left_outer
    relationship: one_to_one
    sql_on: ${kpi.jobno} = ${dimops.jobno} and ${kpi.archive} = ${dimops.archive} ;;
    fields: [dimops.bookingtype]
  }

}

explore: sla {
  view_name: kpi
  hidden: yes
  group_label: "CitySprint"
  description: "SLA"
  persist_with: kpi_datagroup
  fields: [kpi.sla_explore*]

  join: service {
    view_label: "Kpi"
    type: left_outer
    sql_on: ${kpi.servicecode} = ${service.code} and ${kpi.archive} = ${service.archive} ;;
    relationship: many_to_one
    fields: [service.description]
  }

  sql_always_where: ${kpi.sla_flag} = 'Y' ;;
}

explore: courierutilisation {
  group_label: "CitySprint"
  label: "Courier Utilisation"
  view_label: "Courier Utilisation"
  description: "KPI"
  persist_with: courier_uti_datagroup

  access_filter: {
    field: courier_sc
    user_attribute: ops_kpi_service_centre_filter
  }

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

  access_filter: {
    field: sc
    user_attribute: ops_kpi_service_centre_filter
  }

  join: dt_regions_table {
    view_label: "Telephony Data"
    type: left_outer
    sql_on: ${vwnvmcalldata.sc} = ${dt_regions_table.grouped_name} ;;
    relationship: one_to_one
    fields: [dt_regions_table.region]
  }


}

explore: vwnoanswercalls {
  group_label: "CitySprint"
  view_label: "Calls Not Answered Summary"
  description: "KPI"
  persist_with: noanswer_datagroup

  access_filter: {
    field: sc
    user_attribute: ops_kpi_service_centre_filter
  }

  join: dt_regions_table {
    view_label: "Calls Not Answered Summary"
    type: left_outer
    sql_on: ${vwnoanswercalls.sc} = ${dt_regions_table.grouped_name} ;;
    relationship: many_to_one
    fields: [dt_regions_table.region]
  }

}

explore: vwkpisummary {
  group_label: "CitySprint"
  label: "KPI Summary"
  view_label: "KPI Summary"
  description: "KPI Summary"
  persist_with: vwkpisummary_datagroup
  access_filter: {
    field: servicecentre
    user_attribute: ops_kpi_service_centre_filter
  }

  join: kpi {
    view_label: "SLA KPI"
    type: left_outer
    sql_on: ${vwkpisummary.servicecentre} = ${kpi.allocatedsc} and
            ${vwkpisummary.bookingdate_date} = ${kpi.bookingdatetime_date} ;;
    relationship: one_to_many

  }

  join: vwnvmcalldata {
    view_label: "Call Stats KPI"
    type: left_outer
    sql_on: ${vwkpisummary.servicecentre} = ${vwnvmcalldata.sc} and
      ${vwkpisummary.bookingdate_date} = ${vwnvmcalldata.date_date} ;;
    relationship: one_to_many
  }

  join: courierutilisation {
    view_label: "Courier Utilisation KPI"
    type: left_outer
    sql_on: ${vwkpisummary.servicecentre} = ${courierutilisation.courier_sc} and
      ${vwkpisummary.bookingdate_date} = ${courierutilisation.report_date} ;;
    relationship: one_to_many
  }


  }

explore: dt_wickes_windowchange {
  hidden: yes
  label: "Wickes Time Window Change"
  view_label: "Wickes Time Window Change"
  group_label: "CitySprint"
}
