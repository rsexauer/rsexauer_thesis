connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: rsexauer_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rsexauer_thesis_default_datagroup

explore: allstarfull {
  join: teams {
    type: left_outer
    sql_on: ${allstarfull.team_id} = ${teams.team_idretro} ;;
    relationship: many_to_one
  }
}

explore: appearances {
  join: teams {
    type: left_outer
    sql_on: ${appearances.team_id} = ${teams.team_idretro} ;;
    relationship: many_to_one
  }
}

explore: batting {
  join: teams {
    type: left_outer
    sql_on: ${batting.team_id} = ${teams.team_idretro} ;;
    relationship: many_to_one
  }
}

explore: battingpost {
  join: teams {
    type: left_outer
    sql_on: ${battingpost.team_id} = ${teams.team_idretro} ;;
    relationship: many_to_one
  }
}

explore: fielding {
  join: teams {
    type: left_outer
    sql_on: ${fielding.team_id} = ${teams.team_idretro} ;;
    relationship: many_to_one
  }
}

explore: fielding_of {}

explore: fielding_ofsplit {
  join: teams {
    type: left_outer
    sql_on: ${fielding_ofsplit.team_id} = ${teams.team_idretro} ;;
    relationship: many_to_one
  }
}

explore: fielding_post {
  join: teams {
    type: left_outer
    sql_on: ${fielding_post.team_id} = ${teams.team_idretro} ;;
    relationship: many_to_one
  }
}

explore: home_games {}

explore: master{
  join: salaries {
    type: left_outer
    sql_on: ${master.player_id} = ${salaries.player_id} ;;
    relationship: one_to_many
  }
  join: batting {
    type: left_outer
    sql_on: ${master.player_id} = ${batting.player_id};;
    relationship: one_to_many
  }
}

explore: parks {}

explore: pitching {
  join: teams {
    type: left_outer
    sql_on: ${pitching.team_id} = ${teams.team_idretro} ;;
    relationship: many_to_one
  }
}

explore: pitching_post {
  join: teams {
    type: left_outer
    sql_on: ${pitching_post.team_id} = ${teams.team_idretro} ;;
    relationship: many_to_one
  }
}

explore: plays {}

explore: salaries {
  join: teams {
    type: left_outer
    sql_on: ${salaries.team_id} = ${teams.team_idretro} ;;
    relationship: many_to_one
  }
}

explore: teams {}
