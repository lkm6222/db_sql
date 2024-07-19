SELECT * FROM tb_school_info;
SELECT * FROM tb_score;
SELECT * FROM tb_student_info;

/* 학교별 졸업생들의 정보를 출력하시오. */
SELECT  school.school_name,
		school.school_area,
        student.student_name
FROM tb_school_info school 
LEFT JOIN tb_student_info student
ON student.school_id = school.school_id
AND student.student_graduate_yn = 'Y';

SELECT  school.school_name,
		school.school_area,
        student.student_name
FROM tb_student_info student
RIGHT JOIN tb_school_info school  
ON student.school_id = school.school_id
AND student.student_graduate_yn = 'Y';


/* . 2024년 수능 성적 상위 5명의 학생정보를 출력하시오. */
SELECT student.student_name,
		student.student_graduate_yn,
        school.school_name,
        sum(score.score_point)
FROM tb_student_info student
LEFT JOIN tb_score score
ON student.student_id = score.student_id
AND score.score_season = '2024'
LEFT JOIN tb_school_info school
ON student.school_id = school.school_id
GROUP BY student.student_id
ORDER BY sum(score.score_point) desc
LIMIT 5;
