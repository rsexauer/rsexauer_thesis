view: batting {
  sql_table_name: mlb.batting ;;

  dimension: _2b {
    type: number
    sql: ${TABLE}._2B ;;
  }

  dimension: _3b {
    type: number
    sql: ${TABLE}._3B ;;
  }

  dimension: ab {
    type: number
    sql: ${TABLE}.AB ;;
  }

  dimension: bb {
    type: number
    sql: ${TABLE}.BB ;;
  }

  dimension: cs {
    type: number
    sql: ${TABLE}.CS ;;
  }

  dimension: g {
    type: number
    sql: ${TABLE}.G ;;
  }

  dimension: gidp {
    type: string
    sql: ${TABLE}.GIDP ;;
  }

  dimension: h {
    type: number
    sql: ${TABLE}.H ;;
  }

  dimension: hbp {
    type: string
    sql: ${TABLE}.HBP ;;
  }

  dimension: hr {
    type: number
    sql: ${TABLE}.HR ;;
  }

  dimension: ibb {
    type: string
    sql: ${TABLE}.IBB ;;
  }

  dimension: lg_id {
    type: string
    sql: ${TABLE}.lgID ;;
  }

  dimension: player_id {
    type: string
    sql: ${TABLE}.playerID ;;
  }

  dimension: r {
    type: number
    sql: ${TABLE}.R ;;
  }

  dimension: rbi {
    type: number
    sql: ${TABLE}.RBI ;;
  }

  dimension: sb {
    type: number
    sql: ${TABLE}.SB ;;
  }

  dimension: sf {
    type: string
    sql: ${TABLE}.SF ;;
  }

  dimension: sh {
    type: string
    sql: ${TABLE}.SH ;;
  }

  dimension: so {
    type: number
    sql: ${TABLE}.SO ;;
  }

  dimension: stint {
    type: number
    sql: ${TABLE}.stint ;;
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

  dimension: batting_average_by_team {
    type: number
      sql:CASE WHEN ab >= 1 THEN ${h}/${ab} ELSE NULL END ;;
     value_format:".#00"
  }

  measure: count {
    type: count
    drill_fields: [teams.team_idretro, teams.name]
  }

  measure: total_hr{
    type: sum
    sql: ${hr} ;;
    drill_fields: [teams.team_idretro, teams.name]
  }

  measure: total_hits {
    type: sum
    sql: ${h} ;;
  }

  measure: total_at_bats{
    type: sum
    sql: ${ab} ;;
  }

  measure: batting_average {
    type: number
    sql: ${total_hits}/${total_at_bats} ;;
    value_format:".#00"
  }

  measure: Team_list {
    type: list
    list_field: team_id
  }

# ####################
# ####################
# Dimensional Aggs
  parameter: measure_type {
    suggestions: ["sum","average","count","min","max"]
  }

  parameter: dimension_to_aggregate {
    type: unquoted
    allowed_value: {
      label: "Doubles"
      value: "_2b"
    }
    allowed_value: {
      label: "Triples"
      value: "_3b"
    }
    allowed_value: {
      label: "At Bats"
      value: "ab"
    }
    allowed_value: {
      label: "Walks"
      value: "bb"
    }
    allowed_value: {
      label: "Caught Stealing"
      value: "cs"
    }
    allowed_value: {
      label: "Games"
      value: "g"
    }
    allowed_value: {
      label: "Ground Into Double Play"
      value: "gidp"
    }
    allowed_value: {
      label: "Hits"
      value: "h"
    }
    allowed_value: {
      label: "Hit by Pitch"
      value: "hbp"
    }
    allowed_value: {
      label: "Home Runs"
      value: "hr"
    }
    allowed_value: {
      label: "Intentional Walks"
      value: "ibb"
    }

  }

  measure: dynamic_agg {
    type: number
    label_from_parameter: dimension_to_aggregate
    sql: case when  {% condition measure_type %} 'sum' {% endcondition %}  then sum( ${TABLE}.{% parameter dimension_to_aggregate %})
          when {% condition measure_type %} 'average' {% endcondition %}  then avg( ${TABLE}.{% parameter dimension_to_aggregate %})
          when {% condition measure_type %} 'count' {% endcondition %}  then count( ${TABLE}.{% parameter dimension_to_aggregate %})
          when {% condition measure_type %} 'min' {% endcondition %}  then min( ${TABLE}.{% parameter dimension_to_aggregate %})
          when {% condition measure_type %} 'max' {% endcondition %}  then max( ${TABLE}.{% parameter dimension_to_aggregate %})
          else null end;;
  }
}
