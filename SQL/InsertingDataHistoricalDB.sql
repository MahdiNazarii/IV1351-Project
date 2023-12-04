INSERT INTO lesson_history(lesson_type, genre, instrument, price, lesson_id)

SELECT
    CASE
        WHEN il.lesson_id IS NOT NULL THEN 'Individual'
        WHEN gl.lesson_id IS NOT NULL THEN 'Group'
        WHEN el.lesson_id IS NOT NULL THEN 'Ensemble'
    END AS lesson_type,
    el.genre,
    CASE
        WHEN il.lesson_id IS NOT NULL THEN it.name
		WHEN gl.lesson_id IS NOT NULL THEN it.name
    END AS instrument,
    ps.price AS lesson_price,
	l.lesson_id
FROM
    lesson l

JOIN student_lesson sl ON l.lesson_id = sl.lesson_id
JOIN student s ON s.student_id = sl.student_id
JOIN
    person p ON s.person_id = p.person_id
JOIN
    email e ON p.person_id = e.person_id
JOIN price_schema ps ON ps.price_schema_id = l.price_schema_id
LEFT JOIN
    individual_lesson il ON l.lesson_id = il.lesson_id
LEFT JOIN
    group_lesson gl ON l.lesson_id = gl.lesson_id
LEFT JOIN
    ensemble_lesson el ON l.lesson_id = el.lesson_id
LEFT JOIN
    instrument_type it ON il.instrument_type_id = it.instrument_type_id
    OR gl.instrument_type_id = it.instrument_type_id
WHERE
    l.start_time < CURRENT_TIMESTAMP
ORDER BY
    l.lesson_id
	
ON CONFLICT (lesson_id) DO NOTHING;

-- Copies student history into student_history
INSERT INTO student_history (student_id, name, email)

SELECT
    s.student_id,
    p.name AS student_name,
    e.email AS student_email
FROM
    lesson l
JOIN student_lesson sl ON l.lesson_id = sl.lesson_id
JOIN student s ON s.student_id = sl.student_id
JOIN person p ON s.person_id = p.person_id
JOIN email e ON p.person_id = e.person_id
WHERE
    l.start_time <= CURRENT_TIMESTAMP
ORDER BY
    l.lesson_id
	
ON CONFLICT(student_id) DO NOTHING;

--Copies student_lesson into history
INSERT INTO student_lesson_history (student_id, lesson_id)

SELECT
    s.student_id,
    l.lesson_id
FROM
    lesson l
JOIN student_lesson sl ON l.lesson_id = sl.lesson_id
JOIN student s ON s.student_id = sl.student_id
WHERE
    l.start_time <= CURRENT_TIMESTAMP
ORDER BY
    l.lesson_id
	
ON CONFLICT(student_id, lesson_id) DO NOTHING;