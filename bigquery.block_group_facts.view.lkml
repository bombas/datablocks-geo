view: bq_block_group_facts {
  sql_table_name: `bigquery-public-data.census_bureau_acs.blockgroup_2017_5yr` ;;

  dimension: logrecno_bg_map_block_group {
    hidden: yes
    type: string
    sql: ${TABLE}.geo_id ;;
    primary_key: yes
  }

  dimension: population {
    type: number
    hidden: yes
    sql: ${TABLE}.total_pop ;;
  }

  measure: total_population {
    description: "Total Population"
    type: sum
    sql: ${population} ;;
  }
  # Household Measures
  measure: housing_units {
    type: sum
    group_label: "Households"
    sql: ${TABLE}.housing_units ;;
  }
  measure: avg_persons_house {
    type: number
    group_label: "Households"
    label: "Average Persons per Household"
    sql: ${total_population}/NULLIF(${housing_units}, 0) ;;
    value_format_name: decimal_2
  }

  # Income Measure
  dimension: income_per_capita {
    type: number
    hidden: yes
    group_label: "Households"
    sql: ${TABLE}.income_per_capita ;;
    value_format_name: usd_0
  }
  measure: aggregate_income {
    hidden: yes
    type: number
    group_label: "Households"
    sql: sum(${income_per_capita}*${population}) ;;
  }
  measure: avg_income_house {
    type: number
    group_label: "Households"
    label: "Average Income per Household"
    sql: ${aggregate_income}/NULLIF(${housing_units}, 0) ;;
    value_format_name: usd_0
  }

  # Sex Measures
  measure: female_population {
    type: sum
    sql: ${TABLE}.female_pop ;;
    group_label: "Sex"
  }
  measure: male_population {
    type: sum
    sql: ${TABLE}.male_pop ;;
    group_label: "Sex"
  }
  measure:  pct_male{
    type: number
    label: "Male % of Population"
    group_label: "Sex"
    sql: ${male_population}/NULLIF(${total_population}, 0) ;;
    value_format_name: percent_2
  }
  measure:  pct_female{
    type: number
    label: "Female % of Population"
    group_label: "Sex"
    sql: ${female_population}/NULLIF(${total_population}, 0) ;;
    value_format_name: percent_2
  }

  # Racial Measures

  measure: white_population {
    group_label: "Race"
    type: sum
    sql: ${TABLE}.white_pop ;;
  }
  measure: black_population {
    group_label: "Race"
    type: sum
    sql: ${TABLE}.black_pop ;;
  }
  measure: asian_population {
    group_label: "Race"
    type: sum
    sql: ${TABLE}.asian_pop ;;
  }
  measure: hispanic_population {
    group_label: "Race"
    type: sum
    sql: ${TABLE}.hispanic_pop ;;
  }
  measure: american_indian_population {
    group_label: "Race"
    type: sum
    sql: ${TABLE}.amerindian_pop ;;
  }
  measure: other_race_population {
    group_label: "Race"
    type: sum
    sql: ${TABLE}.other_race_pop ;;
  }
  measure: two_or_more_races_population {
    group_label: "Race"
    type: sum
    sql: ${TABLE}.white_pop ;;
  }
  measure: not_hispanic_population {
    label: "Non-Hispanic Population"
    group_label: "Race"
    type: sum
    sql: ${TABLE}.not_hispanic_pop ;;
  }
  measure: pct_white {
    label: "White % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${white_population}/NULLIF(${total_population}, 0) ;;
  }
  measure: pct_black {
    label: "Black % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${black_population}/NULLIF(${total_population}, 0) ;;
  }
  measure: pct_asian {
    label: "Asian % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${asian_population}/NULLIF(${total_population}, 0) ;;
  }
  measure: pct_amind {
    label: "American Indian % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${american_indian_population}/NULLIF(${total_population}, 0) ;;
  }
  measure: pct_hisp {
    label: "Hispanic % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${hispanic_population}/NULLIF(${total_population}, 0) ;;
  }
  measure: pct_other {
    label: "Other Race % of Population"
    group_label: "Race"
    type: number
    value_format_name: percent_2
    sql: ${other_race_population}/NULLIF(${total_population}, 0) ;;
  }

  measure: pct_two_or_more {
    label: "Two or More Races % of Population"
    type: number
    sql: ${two_or_more_races_population}/NULLIF(${total_population}, 0) ;;
    group_label: "Race"
    value_format_name: percent_2
  }
  measure: pct_non_hispanic {
    label: "Non-Hispanic % of Population"
    type: number
    sql: ${not_hispanic_population}/NULLIF(${total_population}, 0)) ;;
    group_label: "Race"
    value_format_name: percent_2
  }

# Age Measures

  measure: male_under_5 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_under_5 ;;
  }
  measure: male_5_to_9 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_5_to_9 ;;
  }
  measure: male_10_to_14 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_10_to_14 ;;
  }
  measure: male_15_to_17 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_15_to_17 ;;
  }
  measure: male_18_to_19 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_18_to_19 ;;
  }
  measure: male_20 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_20 ;;
  }
  measure: male_21 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_21 ;;
  }
  measure: male_22_to_24 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_22_to_24 ;;
  }
  measure: male_25_to_29 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_25_to_29 ;;
  }
  measure: male_30_to_34 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_30_to_34 ;;
  }
  measure: male_35_to_39 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_35_to_39 ;;
  }
  measure: male_40_to_44 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_40_to_44 ;;
  }
  measure: male_45_to_49 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_45_to_49 ;;
  }
  measure: male_50_to_54 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_50_to_54 ;;
  }
  measure: male_55_to_59 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_55_to_59 ;;
  }
  measure: male_60_to_61 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_60_61 ;;
  }
  measure: male_62_to_64 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_62_64 ;;
  }
  measure: male_65_to_66 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_65_to_66 ;;
  }
  measure: male_67_to_69 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_67_to_69 ;;
  }
  measure: male_70_to_74 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_70_to_74 ;;
  }
  measure: male_75_to_79 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_75_to_79 ;;
  }
  measure: male_80_to_84 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_80_to_84 ;;
  }
  measure: male_85_and_over {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.male_85_and_over ;;
  }

  measure: female_under_5 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_under_5 ;;
  }
  measure: female_5_to_9 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_5_to_9 ;;
  }
  measure: female_10_to_14 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_10_to_14 ;;
  }
  measure: female_15_to_17 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_15_to_17 ;;
  }
  measure: female_18_to_19 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_18_to_19 ;;
  }
  measure: female_20 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_20 ;;
  }
  measure: female_21 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_21 ;;
  }
  measure: female_22_to_24 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_22_to_24 ;;
  }
  measure: female_25_to_29 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_25_to_29 ;;
  }
  measure: female_30_to_34 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_30_to_34 ;;
  }
  measure: female_35_to_39 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_35_to_39 ;;
  }
  measure: female_40_to_44 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_40_to_44 ;;
  }
  measure: female_45_to_49 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_45_to_49 ;;
  }
  measure: female_50_to_54 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_50_to_54 ;;
  }
  measure: female_55_to_59 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_55_to_59 ;;
  }
  measure: female_60_to_61 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_60_61 ;;
  }
  measure: female_62_to_64 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_62_64 ;;
  }
  measure: female_65_to_66 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_65_to_66 ;;
  }
  measure: female_67_to_69 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_67_to_69 ;;
  }
  measure: female_70_to_74 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_70_to_74 ;;
  }
  measure: female_75_to_79 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_75_to_79 ;;
  }
  measure: female_80_to_84 {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_80_to_84 ;;
  }
  measure: female_85_and_over {
    hidden: yes
    type: sum
    group_label: "Age"
    sql: ${TABLE}.female_85_and_over ;;
  }

  measure: pop_under_5 {
    type: number
    group_label: "Age"
    sql: ${male_under_5} + ${female_under_5} ;;
  }
  measure: pop_5_to_9 {
    type: number
    group_label: "Age"
    sql: ${male_5_to_9} + ${female_5_to_9} ;;
  }
  measure: pop_10_to_14 {
    type: number
    group_label: "Age"
    sql: ${male_10_to_14} + ${female_10_to_14} ;;
  }
  measure: pop_15_to_17 {
    type: number
    group_label: "Age"
    sql: ${male_15_to_17} + ${female_15_to_17} ;;
  }
  measure: pop_18_to_19 {
    type: number
    group_label: "Age"
    sql: ${male_18_to_19} + ${female_18_to_19} ;;
  }
  measure: pop_20 {
    type: number
    group_label: "Age"
    sql: ${male_20} + ${female_20} ;;
  }
  measure: pop_21 {
    type: number
    group_label: "Age"
    sql: ${male_21} + ${female_21} ;;
  }
  measure: pop_22_to_24 {
    type: number
    group_label: "Age"
    sql: ${male_22_to_24} + ${female_22_to_24} ;;
  }
  measure: pop_25_to_29 {
    type: number
    group_label: "Age"
    sql: ${male_25_to_29} + ${female_25_to_29} ;;
  }
  measure: pop_30_to_34 {
    type: number
    group_label: "Age"
    sql: ${male_30_to_34} + ${female_30_to_34} ;;
  }
  measure: pop_35_to_39 {
    type: number
    group_label: "Age"
    sql: ${male_35_to_39} + ${female_35_to_39} ;;
  }
  measure: pop_40_to_44 {
    type: number
    group_label: "Age"
    sql: ${male_40_to_44} + ${female_40_to_44} ;;
  }
  measure: pop_45_to_49 {
    type: number
    group_label: "Age"
    sql: ${male_45_to_49} + ${female_45_to_49} ;;
  }
  measure: pop_50_to_54 {
    type: number
    group_label: "Age"
    sql: ${male_50_to_54} + ${female_50_to_54} ;;
  }
  measure: pop_55_to_59 {
    type: number
    group_label: "Age"
    sql: ${male_55_to_59} + ${female_55_to_59} ;;
  }
  measure: pop_60_to_61 {
    type: number
    group_label: "Age"
    sql: ${male_60_to_61} + ${female_60_to_61} ;;
  }
  measure: pop_62_to_64 {
    type: number
    group_label: "Age"
    sql: ${male_62_to_64} + ${female_62_to_64} ;;
  }
  measure: pop_65_to_66 {
    type: number
    group_label: "Age"
    sql: ${male_65_to_66} + ${female_65_to_66} ;;
  }
  measure: pop_67_to_69 {
    type: number
    group_label: "Age"
    sql: ${male_67_to_69} + ${female_67_to_69} ;;
  }
  measure: pop_70_to_74 {
    type: number
    group_label: "Age"
    sql: ${male_70_to_74} + ${female_70_to_74} ;;
  }
  measure: pop_75_to_79 {
    type: number
    group_label: "Age"
    sql: ${male_75_to_79} + ${female_75_to_79} ;;
  }
  measure: pop_80_to_84 {
    type: number
    group_label: "Age"
    sql: ${male_80_to_84} + ${female_80_to_84} ;;
  }
  measure: pop_85_and_over {
    type: number
    group_label: "Age"
    sql: ${male_85_and_over} + ${female_85_and_over} ;;
  }

}
