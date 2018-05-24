view: plays {
  sql_table_name: mlb.plays ;;

  dimension: _1_b_runner {
    type: string
    sql: ${TABLE}._1B_runner ;;
  }

  dimension: _2_b_runner {
    type: string
    sql: ${TABLE}._2B_runner ;;
  }

  dimension: _3_b_runner {
    type: string
    sql: ${TABLE}._3B_runner ;;
  }

  dimension: batter {
    type: string
    sql: ${TABLE}.batter ;;
  }

  dimension: count {
    type: string
    sql: ${TABLE}.count ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: game_id {
    type: string
    sql: ${TABLE}.game_id ;;
  }

  dimension: inning {
    type: number
    sql: ${TABLE}.inning ;;
  }

  dimension: modifiers {
    type: string
    sql: ${TABLE}.modifiers ;;
  }

  dimension: outs {
    type: number
    sql: ${TABLE}.outs ;;
  }

  dimension: pitch_seq {
    type: string
    sql: ${TABLE}.pitch_seq ;;
  }

  dimension: play_number {
    type: number
    sql: ${TABLE}.play_number ;;
  }

  dimension: play_scoring {
    type: string
    sql: ${TABLE}.play_scoring ;;
  }

  dimension: runner_advances {
    type: string
    sql: ${TABLE}.runner_advances ;;
  }

  dimension: top_bottom {
    type: number
    sql: ${TABLE}.top_bottom ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
