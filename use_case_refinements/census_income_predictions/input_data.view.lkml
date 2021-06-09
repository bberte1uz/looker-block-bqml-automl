include: "/views/input_data.view"

view: +input_data {
  derived_table: {
    sql:  SELECT ROW_NUMBER() OVER() AS row_number, *
          FROM `bigquery-public-data.ml_datasets.census_adult_income`
    ;;
  }

  dimension: row_number {
    primary_key: yes
    type: number
    sql: ${TABLE}.row_number ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: workclass {
    type: string
    sql: ${TABLE}.workclass ;;
  }

  dimension: functional_weight {
    type: number
    sql: ${TABLE}.functional_weight ;;
  }

  dimension: education {
    type: string
    sql: ${TABLE}.education ;;
  }

  dimension: education_num {
    type: number
    sql: ${TABLE}.education_num ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.marital_status ;;
  }

  dimension: occupation {
    type: string
    sql: ${TABLE}.occupation ;;
  }

  dimension: relationship {
    type: string
    sql: ${TABLE}.relationship ;;
  }

  dimension: race {
    type: string
    sql: ${TABLE}.race ;;
  }

  dimension: sex {
    type: string
    sql: ${TABLE}.sex ;;
  }

  dimension: capital_gain {
    type: number
    sql: ${TABLE}.capital_gain ;;
  }

  dimension: capital_loss {
    type: number
    sql: ${TABLE}.capital_loss ;;
  }

  dimension: hours_per_week {
    type: number
    sql: ${TABLE}.hours_per_week ;;
  }

  dimension: native_country {
    type: string
    sql: ${TABLE}.native_country ;;
  }

  dimension: income_bracket {
    type: string
    sql: ${TABLE}.income_bracket ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      row_number,
      age,
      workclass,
      functional_weight,
      education,
      education_num,
      marital_status,
      occupation,
      relationship,
      race,
      sex,
      capital_gain,
      capital_loss,
      hours_per_week,
      native_country,
      income_bracket
    ]
  }
}
