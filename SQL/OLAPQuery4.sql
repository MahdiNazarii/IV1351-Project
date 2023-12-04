-- Create or replace a view 
CREATE OR REPLACE VIEW EnsembleAvailabilityView AS
SELECT
    e.genre,
    l.start_time::date AS day,
    COUNT(sl.student_id) AS enrolled_students,
    e.maximum_of_students AS max_students,
    CASE
        WHEN COUNT(sl.student_id) = e.maximum_of_students THEN 'No Seats'
        WHEN COUNT(sl.student_id) < e.maximum_of_students - 2 THEN 'Many Seats'
        ELSE '1 or 2 Seats'
    END AS availability_status
FROM
    ensemble_lesson e
JOIN
    lesson l ON e.lesson_id = l.lesson_id
LEFT JOIN
    student_lesson sl ON e.lesson_id = sl.lesson_id
WHERE
    date_trunc('week', l.start_time) = date_trunc('week', CURRENT_DATE + INTERVAL '1 week')
GROUP BY
    e.genre, l.start_time, e.maximum_of_students;

-- Using view in the query nr 4
SELECT
    TO_CHAR(day, 'Dy') AS "Day",
    genre,
    availability_status AS "No of Free Seats"
FROM
    EnsembleAvailabilityView
ORDER BY
    EXTRACT(DOW FROM day), genre;