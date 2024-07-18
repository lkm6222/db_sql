SELECT * FROM tb_student_info;
SELECT * FROM tb_score;


/* Inner Join */
SELECT  T1.student_id,
		T1.student_name,
        T2.score_subject,
        T2.score_point
FROM tb_student_info T1
INNER JOIN tb_score T2
ON T1.student_id = T2.student_id;


/* Left JOin */
SELECT *
FROM tb_student_info T1
LEFT JOIN tb_score T2
ON T1.student_id = T2.student_id
WHERE T1.student_id IN ('12', '13');


/* Right Join */
SELECT *
FROM tb_student_info T1
RIGHT JOIN tb_school T2
ON T1.student_school = T2.student_school;

SELECT *
FROM tb_student_info T1
RIGHT JOIN tb_school_info T2
ON T1.student_school = T2.school_name;


