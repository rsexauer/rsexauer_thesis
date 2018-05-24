view: fielding_post {
  sql_table_name: mlb.fielding_post ;;

  dimension: a {
    type: number
    sql: ${TABLE}.A ;;
  }

  dimension: cs {
    type: number
    sql: ${TABLE}.CS ;;
  }

  dimension: dp {
    type: number
    sql: ${TABLE}.DP ;;
  }

  dimension: e {
    type: number
    sql: ${TABLE}.E ;;
  }

  dimension: g {
    type: number
    sql: ${TABLE}.G ;;
  }

  dimension: gs {
    type: number
    sql: ${TABLE}.GS ;;
  }

  dimension: inn_outs {
    type: number
    sql: ${TABLE}.InnOuts ;;
  }

  dimension: lg_id {
    type: string
    sql: ${TABLE}.lgID ;;
  }

  dimension: pb {
    type: number
    sql: ${TABLE}.PB ;;
  }

  dimension: player_id {
    type: string
    sql: ${TABLE}.playerID ;;
  }

  dimension: po {
    type: number
    sql: ${TABLE}.PO ;;
  }

  dimension: pos {
    type: string
    sql: ${TABLE}.POS ;;
  }

  dimension: round {
    type: string
    sql: ${TABLE}.round ;;
  }

  dimension: sb {
    type: number
    sql: ${TABLE}.SB ;;
  }

  dimension: team_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.teamID ;;
  }

  dimension: tp {
    type: number
    sql: ${TABLE}.TP ;;
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
