-- Create or replace the view
CREATE OR REPLACE VIEW SiblingCounts AS
SELECT
    s.student_id,
    COUNT(DISTINCT ss.student_id_0) AS num_siblings
FROM
    student s
LEFT JOIN
    student_sibling ss ON s.student_id = ss.student_id_1
GROUP BY
    s.student_id;

-- Use the view
SELECT
    num_siblings AS "No of Siblings",
    COUNT(student_id) AS "No of Students"
FROM
    SiblingCounts
GROUP BY
    num_siblings
ORDER BY
    num_siblings;
