view: service {
  sql_table_name: "DATAMART"."SERVICE"
    ;;

  dimension: accepted_status {
    type: string
    sql: ${TABLE}."ACCEPTED_STATUS" ;;
  }

  dimension: after_hour_avail {
    type: string
    sql: ${TABLE}."AFTER_HOUR_AVAIL" ;;
  }

  dimension: alert_colour {
    type: string
    sql: ${TABLE}."ALERT_COLOUR" ;;
  }

  dimension_group: alloc_overdue {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ALLOC_OVERDUE" ;;
  }

  dimension: amt_1 {
    type: number
    sql: ${TABLE}."AMT_1" ;;
  }

  dimension: amt_2 {
    type: number
    sql: ${TABLE}."AMT_2" ;;
  }

  dimension: archive {
    type: number
    sql: ${TABLE}."ARCHIVE" ;;
  }

  dimension: atpickup_timer {
    type: number
    sql: ${TABLE}."ATPICKUP_TIMER" ;;
  }

  dimension_group: becoming_overdue {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."BECOMING_OVERDUE" ;;
  }

  dimension: bidding_delay {
    type: number
    sql: ${TABLE}."BIDDING_DELAY" ;;
  }

  dimension: bin_code {
    type: string
    sql: ${TABLE}."BIN_CODE" ;;
  }

  dimension: budget_flag {
    type: string
    sql: ${TABLE}."BUDGET_FLAG" ;;
  }

  dimension: change_over {
    type: string
    sql: ${TABLE}."CHANGE_OVER" ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}."CODE" ;;
  }

  dimension: code_archive {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${code}||'-'||${archive} ;;
  }

  dimension: commodity_code {
    type: number
    sql: ${TABLE}."COMMODITY_CODE" ;;
  }

  dimension: cost_del_leg_flg {
    type: string
    sql: ${TABLE}."COST_DEL_LEG_FLG" ;;
  }

  dimension: credit_card_flag {
    type: string
    sql: ${TABLE}."CREDIT_CARD_FLAG" ;;
  }

  dimension: cubing_factor {
    type: number
    sql: ${TABLE}."CUBING_FACTOR" ;;
  }

  dimension: damage_exchange {
    type: string
    sql: ${TABLE}."DAMAGE_EXCHANGE" ;;
  }

  dimension: data_source {
    type: number
    sql: ${TABLE}."DATA_SOURCE" ;;
  }

  dimension: default_size {
    type: number
    sql: ${TABLE}."DEFAULT_SIZE" ;;
  }

  dimension: default_vehicle {
    type: string
    sql: ${TABLE}."DEFAULT_VEHICLE" ;;
  }

  dimension: default_weight {
    type: number
    sql: ${TABLE}."DEFAULT_WEIGHT" ;;
  }

  dimension: del_over_col {
    type: string
    sql: ${TABLE}."DEL_OVER_COL" ;;
  }

  dimension: del_time_flag {
    type: string
    sql: ${TABLE}."DEL_TIME_FLAG" ;;
  }

  dimension: delay_factor {
    type: number
    sql: ${TABLE}."DELAY_FACTOR" ;;
  }

  dimension_group: deliver_overdue {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVER_OVERDUE" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: despatch_flag {
    type: string
    sql: ${TABLE}."DESPATCH_FLAG" ;;
  }

  dimension: dimensions_flag {
    type: string
    sql: ${TABLE}."DIMENSIONS_FLAG" ;;
  }

  dimension: dtm_auto_desp {
    type: string
    sql: ${TABLE}."DTM_AUTO_DESP" ;;
  }

  dimension_group: dtm_deliver_odue {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DTM_DELIVER_ODUE" ;;
  }

  dimension: dtm_description {
    type: string
    sql: ${TABLE}."DTM_DESCRIPTION" ;;
  }

  dimension_group: dtm_pickup_odue {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DTM_PICKUP_ODUE" ;;
  }

  dimension_group: dtm_prebook_disp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DTM_PREBOOK_DISP" ;;
  }

  dimension: dtm_serv_type {
    type: number
    sql: ${TABLE}."DTM_SERV_TYPE" ;;
  }

  dimension: dtm_weave {
    type: string
    sql: ${TABLE}."DTM_WEAVE" ;;
  }

  dimension: email_track_flag {
    type: string
    sql: ${TABLE}."EMAIL_TRACK_FLAG" ;;
  }

  dimension: end_number {
    type: number
    sql: ${TABLE}."END_NUMBER" ;;
  }

  dimension: fax_flag {
    type: string
    sql: ${TABLE}."FAX_FLAG" ;;
  }

  dimension: flag_1 {
    type: string
    sql: ${TABLE}."FLAG_1" ;;
  }

  dimension: flag_2 {
    type: string
    sql: ${TABLE}."FLAG_2" ;;
  }

  dimension: flag_3 {
    type: string
    sql: ${TABLE}."FLAG_3" ;;
  }

  dimension: flag_4 {
    type: string
    sql: ${TABLE}."FLAG_4" ;;
  }

  dimension: flag_5 {
    type: string
    sql: ${TABLE}."FLAG_5" ;;
  }

  dimension: flag_6 {
    type: string
    sql: ${TABLE}."FLAG_6" ;;
  }

  dimension: flat_rate_hire {
    type: string
    sql: ${TABLE}."FLAT_RATE_HIRE" ;;
  }

  dimension: float_1 {
    type: number
    sql: ${TABLE}."FLOAT_1" ;;
  }

  dimension: float_2 {
    type: number
    sql: ${TABLE}."FLOAT_2" ;;
  }

  dimension: force_driv_jcode {
    type: string
    sql: ${TABLE}."FORCE_DRIV_JCODE" ;;
  }

  dimension: frequency {
    type: string
    sql: ${TABLE}."FREQUENCY" ;;
  }

  dimension: friday_avail {
    type: string
    sql: ${TABLE}."FRIDAY_AVAIL" ;;
  }

  dimension: future_loc {
    type: number
    sql: ${TABLE}."FUTURE_LOC" ;;
  }

  dimension_group: future_prebook {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."FUTURE_PREBOOK" ;;
  }

  dimension: hire_type {
    type: string
    sql: ${TABLE}."HIRE_TYPE" ;;
  }

  dimension: inflate_percent {
    type: number
    sql: ${TABLE}."INFLATE_PERCENT" ;;
  }

  dimension: invoice_format {
    type: string
    sql: ${TABLE}."INVOICE_FORMAT" ;;
  }

  dimension: invoice_type {
    type: string
    sql: ${TABLE}."INVOICE_TYPE" ;;
  }

  dimension: item_job_code {
    type: string
    sql: ${TABLE}."ITEM_JOB_CODE" ;;
  }

  dimension: items_flag {
    type: string
    sql: ${TABLE}."ITEMS_FLAG" ;;
  }

  dimension: job_accepted {
    type: string
    sql: ${TABLE}."JOB_ACCEPTED" ;;
  }

  dimension: job_colour {
    type: string
    sql: ${TABLE}."JOB_COLOUR" ;;
  }

  dimension: job_delay {
    type: number
    sql: ${TABLE}."JOB_DELAY" ;;
  }

  dimension_group: job_overdue {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."JOB_OVERDUE" ;;
  }

  dimension: job_screen {
    type: string
    sql: ${TABLE}."JOB_SCREEN" ;;
  }

  dimension: kilometre_flag {
    type: string
    sql: ${TABLE}."KILOMETRE_FLAG" ;;
  }

  dimension: kms_job_code {
    type: string
    sql: ${TABLE}."KMS_JOB_CODE" ;;
  }

  dimension: last_day_avail {
    type: string
    sql: ${TABLE}."LAST_DAY_AVAIL" ;;
  }

  dimension: late_factor {
    type: number
    sql: ${TABLE}."LATE_FACTOR" ;;
  }

  dimension: lhaul_man_flag {
    type: string
    sql: ${TABLE}."LHAUL_MAN_FLAG" ;;
  }

  dimension: membership_flag {
    type: string
    sql: ${TABLE}."MEMBERSHIP_FLAG" ;;
  }

  dimension: min_job_code {
    type: string
    sql: ${TABLE}."MIN_JOB_CODE" ;;
  }

  dimension: multiple_pickups {
    type: string
    sql: ${TABLE}."MULTIPLE_PICKUPS" ;;
  }

  dimension: nearest_cent {
    type: number
    sql: ${TABLE}."NEAREST_CENT" ;;
  }

  dimension: network_timer {
    type: number
    sql: ${TABLE}."NETWORK_TIMER" ;;
  }

  dimension: next_future_loc {
    type: number
    sql: ${TABLE}."NEXT_FUTURE_LOC" ;;
  }

  dimension: non_sms_colour {
    type: string
    sql: ${TABLE}."NON_SMS_COLOUR" ;;
  }

  dimension: notify {
    type: string
    sql: ${TABLE}."NOTIFY" ;;
  }

  dimension: num_4 {
    type: number
    sql: ${TABLE}."NUM_4" ;;
  }

  dimension: num_5 {
    type: number
    sql: ${TABLE}."NUM_5" ;;
  }

  dimension: off_hire {
    type: string
    sql: ${TABLE}."OFF_HIRE" ;;
  }

  dimension: on_hire {
    type: string
    sql: ${TABLE}."ON_HIRE" ;;
  }

  dimension: override_colour {
    type: string
    sql: ${TABLE}."OVERRIDE_COLOUR" ;;
  }

  dimension: parstat_flag {
    type: string
    sql: ${TABLE}."PARSTAT_FLAG" ;;
  }

  dimension_group: past_overdue {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."PAST_OVERDUE" ;;
  }

  dimension: pb_override_col {
    type: string
    sql: ${TABLE}."PB_OVERRIDE_COL" ;;
  }

  dimension: pick_over_col {
    type: string
    sql: ${TABLE}."PICK_OVER_COL" ;;
  }

  dimension: pickup_limit_flg {
    type: string
    sql: ${TABLE}."PICKUP_LIMIT_FLG" ;;
  }

  dimension_group: pickup_overdue {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."PICKUP_OVERDUE" ;;
  }

  dimension_group: pickup {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."PICKUP_TIME" ;;
  }

  dimension: points_direction {
    type: number
    sql: ${TABLE}."POINTS_DIRECTION" ;;
  }

  dimension: points_for_clear {
    type: number
    sql: ${TABLE}."POINTS_FOR_CLEAR" ;;
  }

  dimension: points_location {
    type: number
    sql: ${TABLE}."POINTS_LOCATION" ;;
  }

  dimension: points_over_lim {
    type: number
    sql: ${TABLE}."POINTS_OVER_LIM" ;;
  }

  dimension: points_per_doll {
    type: number
    sql: ${TABLE}."POINTS_PER_DOLL" ;;
  }

  dimension: points_per_km {
    type: number
    sql: ${TABLE}."POINTS_PER_KM" ;;
  }

  dimension: points_per_rate {
    type: number
    sql: ${TABLE}."POINTS_PER_RATE" ;;
  }

  dimension: points_per_vdiff {
    type: number
    sql: ${TABLE}."POINTS_PER_VDIFF" ;;
  }

  dimension: points_time_diff {
    type: number
    sql: ${TABLE}."POINTS_TIME_DIFF" ;;
  }

  dimension_group: prebook_display {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."PREBOOK_DISPLAY" ;;
  }

  dimension: prepaid_flag {
    type: string
    sql: ${TABLE}."PREPAID_FLAG" ;;
  }

  dimension: prepaid_service {
    type: string
    sql: ${TABLE}."PREPAID_SERVICE" ;;
  }

  dimension: priority_number {
    type: string
    sql: ${TABLE}."PRIORITY_NUMBER" ;;
  }

  dimension: process_colour {
    type: string
    sql: ${TABLE}."PROCESS_COLOUR" ;;
  }

  dimension: public_hol_avail {
    type: string
    sql: ${TABLE}."PUBLIC_HOL_AVAIL" ;;
  }

  dimension: quantity_type {
    type: string
    sql: ${TABLE}."QUANTITY_TYPE" ;;
  }

  dimension: re_hire {
    type: string
    sql: ${TABLE}."RE_HIRE" ;;
  }

  dimension: round_direction {
    type: string
    sql: ${TABLE}."ROUND_DIRECTION" ;;
  }

  dimension: round_off {
    type: string
    sql: ${TABLE}."ROUND_OFF" ;;
  }

  dimension: rounding_flag {
    type: string
    sql: ${TABLE}."ROUNDING_FLAG" ;;
  }

  dimension: run_man_flag {
    type: string
    sql: ${TABLE}."RUN_MAN_FLAG" ;;
  }

  dimension: run_type {
    type: string
    sql: ${TABLE}."RUN_TYPE" ;;
  }

  dimension: sales_gl_code {
    type: string
    sql: ${TABLE}."SALES_GL_CODE" ;;
  }

  dimension: satchels_flag {
    type: string
    sql: ${TABLE}."SATCHELS_FLAG" ;;
  }

  dimension: service_group {
    type: string
    sql: ${TABLE}."SERVICE_GROUP" ;;
  }

  dimension: sms_black_cab {
    type: string
    sql: ${TABLE}."SMS_BLACK_CAB" ;;
  }

  dimension: sms_current {
    type: string
    sql: ${TABLE}."SMS_CURRENT" ;;
  }

  dimension: sms_current_1 {
    type: string
    sql: ${TABLE}."SMS_CURRENT_1" ;;
  }

  dimension: sms_current_flag {
    type: string
    sql: ${TABLE}."SMS_CURRENT_FLAG" ;;
  }

  dimension: sms_flag {
    type: string
    sql: ${TABLE}."SMS_FLAG" ;;
  }

  dimension: sms_pickup {
    type: string
    sql: ${TABLE}."SMS_PICKUP" ;;
  }

  dimension: sms_pickup_1 {
    type: string
    sql: ${TABLE}."SMS_PICKUP_1" ;;
  }

  dimension: sms_pickup_flag {
    type: string
    sql: ${TABLE}."SMS_PICKUP_FLAG" ;;
  }

  dimension: sms_source_addr {
    type: string
    sql: ${TABLE}."SMS_SOURCE_ADDR" ;;
  }

  dimension: sms_third_party {
    type: string
    sql: ${TABLE}."SMS_THIRD_PARTY" ;;
  }

  dimension: start_number {
    type: number
    sql: ${TABLE}."START_NUMBER" ;;
  }

  dimension: stop_switch {
    type: string
    sql: ${TABLE}."STOP_SWITCH" ;;
  }

  dimension: stored_timer {
    type: number
    sql: ${TABLE}."STORED_TIMER" ;;
  }

  dimension: ticket_account {
    type: string
    sql: ${TABLE}."TICKET_ACCOUNT" ;;
  }

  dimension: ticket_type {
    type: string
    sql: ${TABLE}."TICKET_TYPE" ;;
  }

  dimension: time_flag {
    type: string
    sql: ${TABLE}."TIME_FLAG" ;;
  }

  dimension: time_job_code {
    type: string
    sql: ${TABLE}."TIME_JOB_CODE" ;;
  }

  dimension: unit_measure {
    type: string
    sql: ${TABLE}."UNIT_MEASURE" ;;
  }

  dimension: user_code {
    type: string
    sql: ${TABLE}."USER_CODE" ;;
  }

  dimension: viewed_timer {
    type: number
    sql: ${TABLE}."VIEWED_TIMER" ;;
  }

  dimension: warning_limit {
    type: number
    sql: ${TABLE}."WARNING_LIMIT" ;;
  }

  dimension: waste_type {
    type: string
    sql: ${TABLE}."WASTE_TYPE" ;;
  }

  dimension: weekend_avail {
    type: string
    sql: ${TABLE}."WEEKEND_AVAIL" ;;
  }

  dimension: weight_flag {
    type: string
    sql: ${TABLE}."WEIGHT_FLAG" ;;
  }

  dimension: weight_job_code {
    type: string
    sql: ${TABLE}."WEIGHT_JOB_CODE" ;;
  }

  dimension: xml_del_timer {
    type: number
    sql: ${TABLE}."XML_DEL_TIMER" ;;
  }

  dimension: xml_resp_timer {
    type: number
    sql: ${TABLE}."XML_RESP_TIMER" ;;
  }

  dimension: xml_retry_limit {
    type: number
    sql: ${TABLE}."XML_RETRY_LIMIT" ;;
  }

  dimension: xml_retry_timer {
    type: number
    sql: ${TABLE}."XML_RETRY_TIMER" ;;
  }

  dimension: xml_sdel_timer {
    type: number
    sql: ${TABLE}."XML_SDEL_TIMER" ;;
  }

  dimension: xml_sresp_timer {
    type: number
    sql: ${TABLE}."XML_SRESP_TIMER" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
