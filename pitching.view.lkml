view: pitching {
  sql_table_name: mlb.pitching ;;

  dimension: baopp {
    type: number
    sql: ${TABLE}.BAOpp ;;
  }

  dimension: bb {
    type: number
    sql: ${TABLE}.BB ;;
  }

  dimension: bfp {
    type: number
    sql: ${TABLE}.BFP ;;
  }

  dimension: bk {
    type: number
    sql: ${TABLE}.BK ;;
  }

  dimension: cg {
    type: number
    sql: ${TABLE}.CG ;;
  }

  dimension: er {
    type: number
    sql: ${TABLE}.ER ;;
  }

  dimension: era_per_team {
    type: number
    sql: ${TABLE}.ERA ;;
  }

  dimension: g {
    type: number
    sql: ${TABLE}.G ;;
  }

  dimension: gf {
    type: number
    sql: ${TABLE}.GF ;;
  }

  dimension: gidp {
    type: string
    sql: ${TABLE}.GIDP ;;
  }

  dimension: gs {
    type: number
    sql: ${TABLE}.GS ;;
  }

  dimension: h {
    type: number
    sql: ${TABLE}.H ;;
  }

  dimension: hbp {
    type: number
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

  dimension: ipouts {
    type: number
    sql: ${TABLE}.IPouts ;;
  }

  dimension: l {
    type: number
    sql: ${TABLE}.L ;;
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

  dimension: sf {
    type: string
    sql: ${TABLE}.SF ;;
  }

  dimension: sh {
    type: string
    sql: ${TABLE}.SH ;;
  }

  dimension: sho {
    type: number
    sql: ${TABLE}.SHO ;;
  }

  dimension: so {
    type: number
    sql: ${TABLE}.SO ;;
  }

  dimension: stint {
    type: number
    sql: ${TABLE}.stint ;;
  }

  dimension: sv {
    type: number
    sql: ${TABLE}.SV ;;
  }

  dimension: team_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.teamID ;;
  }

  dimension: w {
    type: number
    sql: ${TABLE}.W ;;
  }

  dimension: wp {
    type: number
    sql: ${TABLE}.WP ;;
  }

  dimension: year_id {
    type: number
    sql: ${TABLE}.yearID ;;
  }

# Qualified minimum = 162 iP
  dimension: innings_pitched_per_team{
    type: number
    sql: ${ipouts}/3 ;;
    value_format: "#.0;"
  }

  measure: count {
    type: count
    drill_fields: [teams.team_idretro, teams.name]
  }

  measure: Team_list {
    type: list
    list_field: team_id
  }

  measure: Earned_Runs {
    type: sum
    sql: ${er} ;;
  }

  measure: innings_pitched{
    type: sum
    sql: ${ipouts}/3 ;;
    value_format: "#.0;"
 }

  measure: Earned_Run_Average {
    type: number
    sql: ${Earned_Runs}/${innings_pitched}*9 ;;
    value_format:"#.00"
 }

#   measure: Team_Earned_Run_Average {
#     type: number
#     sql: ${Earned_Runs}/${innings_pitched}*9 ;;
#     value_format:"#.00"
#   }

# ###################
# ###################
# Dimensional Aggs

  parameter: measure_type {
    suggestions: ["sum","average","count","min","max"]
  }

  parameter: dimension_to_aggregate {
    type: unquoted
    allowed_value: {
      label: "Batting Average Against"
      value: "baopp"
    }
    allowed_value: {
      label: "Walks"
      value: "bb"
    }
    allowed_value: {
      label: "Batters Faced"
      value: "bfp"
    }
    allowed_value: {
      label: "Balk"
      value: "bk"
    }
    allowed_value: {
      label: "Complete Games"
      value: "cg"
    }
    allowed_value: {
      label: "Earned Runs"
      value: "er"
    }
    allowed_value: {
      label: "Earned Run Average"
      value: "era"
    }
    allowed_value: {
      label: "Games"
      value: "g"
    }
    allowed_value: {
      label: "Games Finished"
      value: "gf"
    }
    allowed_value: {
      label: "Ground Into Double Play"
      value: "gipd"
    }
    allowed_value: {
      label: "Games Started"
      value: "gs"
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
    allowed_value: {
      label: "Innings Pitched Outs"
      value: "ipouts"
    }
    allowed_value: {
      label: "Losses"
      value: "l"
    }
    allowed_value: {
      label: "Runs"
      value: "r"
    }
    allowed_value: {
      label: "Sacrifice Flies"
      value: "sf"
    }
    allowed_value: {
      label: "Sacrifice Hits"
      value: "sh"
    }
    allowed_value: {
      label: "Shutouts"
      value: "sho"
    }
    allowed_value: {
      label: "Strikeouts"
      value: "so"
    }
    allowed_value: {
      label: "Saves"
      value: "sv"
    }
    allowed_value: {
      label: "Wins"
      value: "w"
    }
    allowed_value: {
      label: "Wild Pitches"
      value: "wp"
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
