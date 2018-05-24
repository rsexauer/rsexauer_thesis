view: home_games {
  sql_table_name: mlb.home_games ;;

  dimension: attendance {
    type: number
    sql: ${TABLE}.attendance ;;
  }

  dimension: games {
    type: number
    sql: ${TABLE}.games ;;
  }

  dimension: league_key {
    type: string
    sql: ${TABLE}.league_key ;;
  }

  dimension: openings {
    type: number
    sql: ${TABLE}.openings ;;
  }

  dimension: park_key {
    type: string
    sql: ${TABLE}.park_key ;;
  }

  dimension_group: span_first {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.span_first ;;
  }

  dimension_group: span_last {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.span_last ;;
  }

  dimension: team_key {
    type: string
    sql: ${TABLE}.team_key ;;
  }

  dimension: year_key {
    type: number
    sql: ${TABLE}.year_key ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
