view: appearances {
  sql_table_name: mlb.appearances ;;

  dimension: g_1b {
    type: number
    sql: ${TABLE}.G_1b ;;
  }

  dimension: g_2b {
    type: number
    sql: ${TABLE}.G_2b ;;
  }

  dimension: g_3b {
    type: number
    sql: ${TABLE}.G_3b ;;
  }

  dimension: g_all {
    type: number
    sql: ${TABLE}.G_all ;;
  }

  dimension: g_batting {
    type: number
    sql: ${TABLE}.G_batting ;;
  }

  dimension: g_c {
    type: number
    sql: ${TABLE}.G_c ;;
  }

  dimension: g_cf {
    type: number
    sql: ${TABLE}.G_cf ;;
  }

  dimension: g_defense {
    type: number
    sql: ${TABLE}.G_defense ;;
  }

  dimension: g_dh {
    type: string
    sql: ${TABLE}.G_dh ;;
  }

  dimension: g_lf {
    type: number
    sql: ${TABLE}.G_lf ;;
  }

  dimension: g_of {
    type: number
    sql: ${TABLE}.G_of ;;
  }

  dimension: g_p {
    type: number
    sql: ${TABLE}.G_p ;;
  }

  dimension: g_ph {
    type: string
    sql: ${TABLE}.G_ph ;;
  }

  dimension: g_pr {
    type: string
    sql: ${TABLE}.G_pr ;;
  }

  dimension: g_rf {
    type: number
    sql: ${TABLE}.G_rf ;;
  }

  dimension: g_ss {
    type: number
    sql: ${TABLE}.G_ss ;;
  }

  dimension: gs {
    type: string
    sql: ${TABLE}.GS ;;
  }

  dimension: lg_id {
    type: string
    sql: ${TABLE}.lgID ;;
  }

  dimension: player_id {
    type: string
    sql: ${TABLE}.playerID ;;
  }

  dimension: team_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.teamID ;;
  }

  dimension: year_id {
    type: number
    sql: ${TABLE}.yearID ;;
  }

  measure: count {
    type: count
    drill_fields: [teams.team_idretro, teams.name]
  }
}
