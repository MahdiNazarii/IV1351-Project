-- Create a view
CREATE OR REPLACE VIEW MonthlyLessonCounts AS
SELECT
    DATE_TRUNC('month', l.start_time) AS month,
    COUNT(*) AS total_lessons,
    COUNT(il.lesson_id) AS individual_lessons,
    COUNT(gl.lesson_id) AS group_lessons,
    COUNT(el.lesson_id) AS ensemble_lessons
FROM
    lesson l
LEFT JOIN
    individual_lesson il ON l.lesson_id = il.lesson_id
LEFT JOIN
    group_lesson gl ON l.lesson_id = gl.lesson_id
LEFT JOIN
    ensemble_lesson el ON l.lesson_id = el.lesson_id
WHERE
    EXTRACT(YEAR FROM l.start_time) = 2023 -- Specify the desired year
GROUP BY
    DATE_TRUNC('month', l.start_time);

-- Use the view in the second part
SELECT
    TO_CHAR(month, 'month') AS month,
    total_lessons,
    individual_lessons,
    group_lessons,
    ensemble_lessons
FROM
    MonthlyLessonCounts;