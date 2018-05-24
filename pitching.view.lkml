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

  dimension: era {
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

  measure: count {
    type: count
    drill_fields: [teams.team_idretro, teams.name]
  }
}
