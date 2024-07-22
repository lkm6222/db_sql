SELECT * FROM tb_score;
SELECT * FROM tb_school_info;


/* 1. 2024년 동구 소재 학교 소속 학생들의 수능 성적을 조회하시오. */
SELECT  school.school_area,
		school.school_name,
        student.student_id,
        student.student_name,
        if(student_graduate_yn = 'Y', '졸업생', '재학생') AS '학생구분',
        SUM(score.score_point) AS '성적'
FROM tb_student_info student
INNER JOIN tb_school_info school
ON student.school_id = school.school_id
AND school.school_area = '동구'
INNER JOIN tb_score score
ON score.student_id = student.student_id
AND score.score_season = '2024'
GROUP BY student.student_id;


SELECT  school.school_area,
		school.school_name,
        student.student_id,
        student.student_name,
        if(student_graduate_yn = 'Y', '졸업생', '재학생') AS '학생구분',
        (SELECT SUM(score.score_point)
         FROM tb_score score
         WHERE score.student_id = student.student_id
         AND score.score_season = '2024') AS '수능성적'
FROM tb_student_info student
INNER JOIN tb_school_info school
ON student.school_id = school.school_id
AND school.school_area = '동구'
GROUP BY student.student_id;



/* 2. 2024년 남자 고등학교를 재학중인 학생들의 수능성적을 조회하시오. */
SELECT  school.school_area,
		school.school_name,
        student.student_id,
        student.student_name,
        if(student_graduate_yn = 'Y', '졸업생', '재학생') AS '학생구분',
        SUM(score.score_point) AS '성적'
FROM tb_student_info student
INNER JOIN tb_school_info school
ON student.school_id = school.school_id
AND school.school_name NOT LIKE '%여자%'
INNER JOIN tb_score score
ON score.student_id = student.student_id
AND score.score_season = '2024'
GROUP BY student.student_id;


/* 3. 2024년 학교별 수능성적의 평균성적을 조회하시오. */
SELECT  T.school_name,
		ifnull(AVG(T.score_point), 0) AS '평균성적'
FROM    (SELECT school.school_name,
				school.school_id,
				school.school_area,
				student_name,
				sum(score_point) AS score_point
		FROM tb_student_info student
		RIGHT JOIN tb_school_info school
		ON student.school_id = school.school_id
		LEFT JOIN tb_score score
		ON student.student_id = score.student_id
		AND score.score_season = '2024'
		GROUP BY school.school_id, student.student_id) T
GROUP BY T.school_id;
