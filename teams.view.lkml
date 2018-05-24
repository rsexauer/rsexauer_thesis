view: teams {
  sql_table_name: mlb.teams ;;

  dimension: team_idretro {
    primary_key: yes
    type: string
    sql: ${TABLE}.teamIDretro ;;
  }

  dimension: _2_b {
    type: number
    sql: ${TABLE}._2B ;;
  }

  dimension: _3_b {
    type: number
    sql: ${TABLE}._3B ;;
  }

  dimension: ab {
    type: number
    sql: ${TABLE}.AB ;;
  }

  dimension: attendance {
    type: number
    sql: ${TABLE}.attendance ;;
  }

  dimension: bb {
    type: number
    sql: ${TABLE}.BB ;;
  }

  dimension: bba {
    type: number
    sql: ${TABLE}.BBA ;;
  }

  dimension: bpf {
    type: number
    sql: ${TABLE}.BPF ;;
  }

  dimension: cg {
    type: number
    sql: ${TABLE}.CG ;;
  }

  dimension: cs {
    type: number
    sql: ${TABLE}.CS ;;
  }

  dimension: div_id {
    type: string
    sql: ${TABLE}.divID ;;
  }

  dimension: div_win {
    type: string
    sql: ${TABLE}.DivWin ;;
  }

  dimension: dp {
    type: number
    sql: ${TABLE}.DP ;;
  }

  dimension: e {
    type: number
    sql: ${TABLE}.E ;;
  }

  dimension: er {
    type: number
    sql: ${TABLE}.ER ;;
  }

  dimension: era {
    type: number
    sql: ${TABLE}.ERA ;;
  }

  dimension: fp {
    type: number
    sql: ${TABLE}.FP ;;
  }

  dimension: franch_id {
    type: string
    sql: ${TABLE}.franchID ;;
  }

  dimension: g {
    type: number
    sql: ${TABLE}.G ;;
  }

  dimension: ghome {
    type: number
    sql: ${TABLE}.Ghome ;;
  }

  dimension: h {
    type: number
    sql: ${TABLE}.H ;;
  }

  dimension: ha {
    type: number
    sql: ${TABLE}.HA ;;
  }

  dimension: hbp {
    type: string
    sql: ${TABLE}.HBP ;;
  }

  dimension: hr {
    type: number
    sql: ${TABLE}.HR ;;
  }

  dimension: hra {
    type: number
    sql: ${TABLE}.HRA ;;
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

  dimension: lg_win {
    type: yesno
    sql: ${TABLE}.LgWin ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: park {
    type: string
    sql: ${TABLE}.park ;;
  }

  dimension: ppf {
    type: number
    sql: ${TABLE}.PPF ;;
  }

  dimension: r {
    type: number
    sql: ${TABLE}.R ;;
  }

  dimension: ra {
    type: number
    sql: ${TABLE}.RA ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.Rank ;;
  }

  dimension: sb {
    type: number
    sql: ${TABLE}.SB ;;
  }

  dimension: sf {
    type: string
    sql: ${TABLE}.SF ;;
  }

  dimension: sho {
    type: number
    sql: ${TABLE}.SHO ;;
  }

  dimension: so {
    type: number
    sql: ${TABLE}.SO ;;
  }

  dimension: soa {
    type: number
    sql: ${TABLE}.SOA ;;
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

  dimension: team_idbr {
    type: string
    sql: ${TABLE}.teamIDBR ;;
  }

  dimension: team_idlahman45 {
    type: string
    sql: ${TABLE}.teamIDlahman45 ;;
  }

  dimension: w {
    type: number
    sql: ${TABLE}.W ;;
  }

  dimension: wcwin {
    type: string
    sql: ${TABLE}.WCWin ;;
  }

  dimension: wswin {
    type: yesno
    sql: ${TABLE}.WSWin ;;
  }

  dimension: year_id {
    type: number
    sql: ${TABLE}.yearID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      team_idretro,
      name,
      teams.team_idretro,
      teams.name,
      allstarfull.count,
      appearances.count,
      batting.count,
      battingpost.count,
      fielding.count,
      fielding_ofsplit.count,
      fielding_post.count,
      pitching.count,
      pitching_post.count,
      salaries.count,
      teams.count
    ]
  }
}
