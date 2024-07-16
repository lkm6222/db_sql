SELECT *
FROM tb_student_info
WHERE student_school_area = '서구';

SELECT student_school, student_grade, COUNT(student_id)
FROM tb_student_info
GROUP BY student_school, student_grade;