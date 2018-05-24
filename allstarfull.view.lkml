view: allstarfull {
  sql_table_name: mlb.allstarfull ;;

  dimension: game_id {
    type: string
    sql: ${TABLE}.gameID ;;
  }

  dimension: game_num {
    type: number
    sql: ${TABLE}.gameNum ;;
  }

  dimension: gp {
    type: number
    sql: ${TABLE}.GP ;;
  }

  dimension: lg_id {
    type: string
    sql: ${TABLE}.lgID ;;
  }

  dimension: player_id {
    type: string
    sql: ${TABLE}.playerID ;;
  }

  dimension: starting_pos {
    type: number
    sql: ${TABLE}.startingPos ;;
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
