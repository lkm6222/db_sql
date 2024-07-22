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


/* 2024년 졸업생과 재학생의 수능 성적 평균을 출력하시오. */
SELECT  IF(T.student_graduate_yn = 'Y', '졸업생', '재학생') AS '학생구분',
		AVG(T.sumPoint) AS '평균수능성적'
FROM 
		(SELECT  student.student_id,
				 student.student_name,
				 student.student_graduate_yn,
				 SUM(score.score_point) AS sumPoint
		FROM tb_student_info student
		INNER JOIN tb_score score
		ON student.student_id = score.student_id
		AND score.score_season = '2024'
		GROUP BY student.student_id) T
GROUP BY T.student_graduate_yn;


SELECT  IF(student.student_graduate_yn = 'Y', '졸업생', '재학생') AS '학생구분',
		AVG(score.score_point) AS '평균수능성적'
FROM tb_student_info student
INNER JOIN (SELECT  student_id, 
					score_season, 
                    sum(score_point) AS score_point
			FROM tb_score
			WHERE score_season = '2024'
            GROUP BY student_id) score
ON student.student_id = score.student_id
GROUP BY student.student_graduate_yn;

