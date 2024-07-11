WITH all_combinations AS (
    SELECT st.student_id AS student_id,
        st.student_name AS student_name,
        sb.subject_name AS subject_name
    FROM Students st
    CROSS JOIN Subjects sb
)

SELECT ac.student_id,
    ac.student_name,
    ac.subject_name,
    COALESCE(COUNT(ex.student_id), 0) AS attended_exams
FROM all_combinations ac
LEFT JOIN Examinations ex
    ON ac.student_id = ex.student_id
    AND ac.subject_name = ex.subject_name
GROUP BY 1, 3
ORDER BY 1, 3