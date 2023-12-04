SELECT
  instructor.instructor_id,
  person.name AS "Instructor Name",
  COUNT(lesson.lesson_id) AS "Number of Lessons"
FROM
  instructor
JOIN
  lesson ON instructor.instructor_id = lesson.instructor_id
JOIN
  person ON instructor.person_id = person.person_id
WHERE
  DATE_TRUNC('month', lesson.start_time) = DATE_TRUNC('month', CURRENT_DATE) -- insert month instead of CURRENT_DATE
GROUP BY
  instructor.instructor_id, person.name
HAVING
  COUNT(lesson.lesson_id) > 2; -- (2) Number of Lessons for the month
