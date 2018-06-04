view: salaries {
  sql_table_name: mlb.salaries ;;

  dimension: lg_id {
    type: string
    sql: ${TABLE}.lgID ;;
  }

  dimension: player_id {
    type: string
    sql: ${TABLE}.playerID ;;
  }

  dimension: salary {
    type: number
    sql: ${TABLE}.salary ;;
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

  measure: average_salary {
    type: average
    sql: ${salary} ;;
    value_format: "$#,##0.00"
  }

  measure: total_salary {
    type: sum
    sql: ${salary};;
    value_format: "$#,##0.00"
  }

  measure: max_salary {
    type: max
    sql: ${salary} ;;
    value_format: "$#,##0.00"
  }
}
