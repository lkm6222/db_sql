SELECT * FROM tb_score;
SELECT * FROM tb_student_info;
SELECT * FROM tb_school_info;


/* 대전지역 학생들의 2024년 수능성적 중 국어 과목의 최고점을 얻은 학생의 정보를 구하시오 */
SELECT  student.student_name,
		if(student.student_graduate_yn = 'Y', '졸업생', '재학생') AS '재학여부',
        score.score_season,
        score.score_subject,
        score.score_point
FROM tb_student_info student
INNER JOIN tb_score score
ON student.student_id = score.student_id
AND score.score_season = '2024'
AND score.score_subject = '언어'
WHERE score.score_point = (
	  SELECT MAX(sc.score_point)
      FROM tb_score sc
      WHERE sc.score_season = '2024'
      AND sc.score_subject = '언어'
);



/* 대전지역 학생들의 2024년 수능성적 중 수학 과목의 최저점을 얻은 학생의 정보를 구하시오 */
SELECT  student.student_name,
		if(student.student_graduate_yn = 'Y', '졸업생', '재학생') AS '재학여부',
        score.score_season,
        score.score_subject,
        score.score_point
FROM tb_student_info student
INNER JOIN tb_score score
ON student.student_id = score.student_id
AND score.score_season = '2024'
AND score.score_subject = '수학'
WHERE score.score_point = (
	  SELECT MIN(sc.score_point)
      FROM tb_score sc
      WHERE sc.score_season = '2024'
      AND sc.score_subject = '수학'
);



/* 2024년 수능에 응시한 학생들의 성적표를 출력하시오 */
/***********************
SELECT	T.school_name,
		T.student_name
FROM 
	(SELECT school.school_name,
			student.student_name,
			if(student.student_graduate_yn = 'Y', '졸업생', '재학생') AS '재학여부'			
	FROM tb_student_info student
	INNER JOIN tb_school_info school
	ON student.school_id = school.school_id
	INNER JOIN tb_score score
	ON student.student_id = score.student_id
    AND score.score_season = '2024'
	GROUP BY student.student_id) T
    ;
***************************/

/*학생별 수능성적표*/
SELECT  school.school_name AS '학교명',
        student.student_name AS '학생이름',
        IF(student.student_graduate_yn = 'Y', ('졸업생'), ('재학생')) AS '재학여부',
        fn_getScore('2024', '언어', student.student_id) AS '언어',
		fn_getScore('2024', '영어', student.student_id) AS '영어',
		fn_getScore('2024', '수학', student.student_id) AS '수학',
		fn_getScore('2024', '사회탐구1', student.student_id) AS '사회탐구1',
        fn_getScore('2024', '사회탐구2', student.student_id) AS '사회탐구2'
FROM tb_student_info student
INNER JOIN tb_school_info school 
ON student.school_id = school.school_id 
GROUP BY student.student_id;



/* view 사용 조회 */
SELECT * 
FROM v_student_info v
INNER JOIN tb_score score
ON v.student_id = score.student_id;
