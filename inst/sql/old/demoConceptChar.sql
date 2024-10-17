-- Make Concept {x@domain} query
INSERT INTO @dataTable (cohort_id, subject_id, category_id, time_id, value_id, value)
SELECT
  t.cohort_definition_id AS cohort_id,
  t.subject_id,
  {x@orderId} AS category_id,
  -999 AS time_id,
  d.{demo_trans$concept_id} AS value_id,
  1 AS value
FROM @targetTable t
JOIN @cdmDatabaseSchema.person d
ON t.subject_id = d.person_id
;
