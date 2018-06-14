view: fielding {
  sql_table_name: mlb.fielding ;;

  dimension: a {
    type: number
    sql: ${TABLE}.A ;;
  }

  dimension: cs {
    type: string
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
    type: string
    sql: ${TABLE}.GS ;;
  }

  dimension: inn_outs {
    type: string
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

  dimension: sb {
    type: string
    sql: ${TABLE}.SB ;;
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

  dimension: wp {
    type: string
    sql: ${TABLE}.WP ;;
  }

  dimension: year_id {
    type: number
    sql: ${TABLE}.yearID ;;
  }

  dimension: zr {
    type: string
    sql: ${TABLE}.ZR ;;
  }

  measure: count {
    type: count
    drill_fields: [teams.team_idretro, teams.name]
  }

  measure: Position_list {
    type: list
    list_field: pos
  }

  measure: Team_list {
    type: list
    list_field: team_id
  }

  parameter: measure_type {
    suggestions: ["sum","average","count","min","max"]
  }

  parameter: dimension_to_aggregate {
    type: unquoted
    allowed_value: {
      label: "Assists"
      value: "a"
    }
    allowed_value: {
      label: "Caught Stealing"
      value: "cs"
    }
    allowed_value: {
      label: "Double Plays"
      value: "dp"
    }
    allowed_value: {
      label: "Errors"
      value: "e"
    }
    allowed_value: {
      label: "Games"
      value: "g"
    }
    allowed_value: {
      label: "Games Started"
      value: "gs"
    }
    allowed_value: {
      label: "Inning Outs"
      value: "inn_outs"
    }
    allowed_value: {
      label: "Passed Ball"
      value: "pb"
    }
    allowed_value: {
      label: "Putout"
      value: "po"
    }
    allowed_value: {
      label: "Stolen Bases"
      value: "sb"
    }
    allowed_value: {
      label: "Wild Pitch"
      value: "wp"
    }
    allowed_value: {
      label: "Zone Rating"
      value: "zr"
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
