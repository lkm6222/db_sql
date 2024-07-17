SELECT * FROM tb_school_info;
SELECT * FROM tb_student_info;
SELECT * FROM tb_score;
SELECT * FROM tb_student_info_test;

/*-------------------서브쿼리 실습-------------------*/
/* tb_student_info 테이블의 데이터를 조회하면서, 서브쿼리를 이용하여 국어, 영어, 수학 점수를 같이 조회하시오. */
SELECT  student.student_name, 
		student.student_grade,
        (SELECT score.score_point
         FROM tb_score score
         WHERE score.score_subject='국어'
         AND score.student_id = student.student_id) AS '국어',
		(SELECT score.score_point
         FROM tb_score score
         WHERE score.score_subject='영어'
         AND score.student_id = student.student_id) AS '영어',
		(SELECT score.score_point
         FROM tb_score score
         WHERE score.score_subject='수학'
         AND score.student_id = student.student_id) AS '수학'
FROM tb_student_info student;


/* 서구에 있는 고등학교 1학년 학생들의 평균점수를 조회하시오.(tb_student_info 테이블 사용) */
SELECT  student.student_name, 
		student.student_grade, 
		student.student_school_area, 
        student.student_school,
	   (SELECT avg(score.score_point)
		FROM tb_score score
		WHERE score.student_id = student.student_id) AS '평균점수'
FROM tb_student_info student
WHERE student.student_school_area = '서구'
ANd student.student_grade ='1';



/* 1학년 학생들의 학교 정보를 조회하시오.(tb_student_info_test 테이블 사용) */
SELECT  student.student_name,
		student.student_grade,
        (SELECT school.school_area
		 FROM tb_school_info school
         WHERE school_idx = student.school_idx) AS school_area,
        (SELECT school.school_name
		 FROM tb_school_info school
         WHERE school_idx = student.school_idx) AS school_name,
		(SELECT school.school_addr
		 FROM tb_school_info school
         WHERE school_idx = student.school_idx) AS school_addr,
		(SELECT school.school_phone
		 FROM tb_school_info school
         WHERE school_idx = student.school_idx) AS school_phone
FROM tb_student_info_test student
WHERE student.student_grade = 1;



/* 중구에 있는 고등학교 학생들의 정보를 조회하시오.
(출력 내용 : 학생이름, 학년, 학교명, 우편번호, 학생주소) */
SELECT  student.student_name,
		student.student_grade,
	   (SELECT school_name
        FROM tb_school_info
        WHERE school_idx = student.school_idx) AS school_name,
        student.student_zipcode AS zipcode,
        student.addr
FROM tb_student_info_test student
WHERE student.school_idx in (
		SELECT school_idx
        FROM tb_school_info
        WHERE school_area = '중구');



/* 중구에 있는 고등학교 학생들 중 평균성적이 80점 미만인 학생 정보를 출력하시오. */
SELECT  student.student_name,
		(SELECT school_name 
         FROM tb_school_info
         WHERE school_idx = student.school_idx ) AS '학교 명',
		student.student_grade,
        (SELECT avg(score_point)
		 FROM tb_score
		 WHERE student_id = student.student_id) AS '평균성적'
FROM tb_student_info_test student
WHERE student.school_idx in (
		SELECT school_idx
        FROM tb_school_info
        WHERE school_area = '중구')
AND student.student_id in(
		SELECT student_id
		FROM tb_score
		GROUP BY student_id
        HAVING AVG(score_point) < 80);





/* 성적테이블의 국어성적을 내림차순으로 정렬하여 순번을 매긴 후, 순번을 오름차순으로 다시 정렬하시오.
    (상위 10명의 데이터만 출력) */
SELECT *
FROM (SELECT (@ROWNUM:=@ROWNUM+1) AS rnum, score.*
FROM tb_score score, (SELECT @ROWNUM:=0 FROM DUAL) R
WHERE score.score_subject = '국어'
ORDER BY score.score_point asc
) T
ORDER BY T.rnum DESC
LIMIT 10 OFFSET 0;


