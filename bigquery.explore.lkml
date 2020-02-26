include: "bigquery.*.view.lkml"

access_grant: wip {
  user_attribute: wip
  allowed_values: ["Yes"]
}

explore: geo {
  from: bq_logrecno_bg_map

  required_access_grants: [wip]

  join: block_group_facts {
    from: bq_block_group_facts
    view_label: "Demographics"
    sql_on: ${geo.block_group} = ${block_group_facts.logrecno_bg_map_block_group};;
    relationship: one_to_one
  }

  join: tract_zcta_map {
    from: bq_tract_zcta_map
    sql_on: ${geo.geoid11} = ${tract_zcta_map.geoid11};;
    relationship: many_to_one
  }

  join: zcta_distances {
    from: bq_zcta_distances
    sql_on: ${tract_zcta_map.ZCTA5} = ${zcta_distances.zip2} ;;
    relationship: one_to_one
    required_joins: [tract_zcta_map]
  }
}
