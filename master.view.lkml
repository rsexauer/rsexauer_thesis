view: master {
  sql_table_name: mlb.master ;;

  dimension: bats {
    type: string
    sql: ${TABLE}.bats ;;
  }

  dimension: bbref_id {
    type: string
    sql: ${TABLE}.bbrefID ;;
  }

  dimension: birth_city {
    type: string
    sql: ${TABLE}.birthCity ;;
  }

  dimension: birth_country {
    type: string
    sql: ${TABLE}.birthCountry ;;
  }

  dimension:  birth_place {
    type: string
    sql: CONCAT(${birth_city}, ', ', ${birth_state}, ', ', ${birth_country}) ;;
  }

# Birth Date
  dimension_group:  birth {
    timeframes: [date, year, month, day_of_month]
    type: time
    datatype: date
    sql: DATE(${year}, ${month}, ${birth_day}) ;;
  }

  dimension: birth_day {
    type: number
    sql: ${TABLE}.birthDay ;;
  }

# Birth Month
  dimension: month {
    type: number
    sql: ${TABLE}.birthMonth ;;
  }

  dimension: birth_state {
    type: string
    sql: ${TABLE}.birthState ;;
  }

# Year
  dimension: year {
    type: number
    sql: ${TABLE}.birthYear ;;
  }

  dimension: death_city {
    type: string
    sql: ${TABLE}.deathCity ;;
  }

  dimension: death_country {
    type: string
    sql: ${TABLE}.deathCountry ;;
  }

  dimension: death_day {
    type: number
    sql: ${TABLE}.deathDay ;;
  }

  dimension: death_month {
    type: number
    sql: ${TABLE}.deathMonth ;;
  }

  dimension: death_state {
    type: string
    sql: ${TABLE}.deathState ;;
  }

  dimension: death_year {
    type: number
    sql: ${TABLE}.deathYear ;;
  }

  dimension_group: debut {
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
    sql: ${TABLE}.debut ;;
  }

  dimension_group: final_game {
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
    sql: ${TABLE}.finalGame ;;
  }

  dimension: height_inches {
    type: number
    sql: ${TABLE}.height ;;
  }

  dimension: height {
    type: string
    sql: CONCAT((${height_inches}/12), '-', MOD(${height_inches}, 12)) ;;
  }

  dimension: name_first {
    type: string
    sql: ${TABLE}.nameFirst ;;
  }

  dimension: name_given {
    type: string
    sql: ${TABLE}.nameGiven ;;
  }

  dimension: name_last {
    type: string
    sql: ${TABLE}.nameLast ;;
  }

  dimension:  full_name {
    type: string
    sql: CONCAT(${name_first}, ' ', ${name_last}) ;;
  }

  dimension: player_id {
    type: string
    sql: ${TABLE}.playerID ;;
    primary_key: yes
  }

  dimension: retro_id {
    type: string
    sql: ${TABLE}.retroID ;;
  }

  dimension: throws {
    type: string
    sql: ${TABLE}.throws ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
