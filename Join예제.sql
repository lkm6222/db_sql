SELECT * FROM tb_student_info;
SELECT * FROM tb_student_info_test;
SELECT * FROM tb_school_info;
SELECT * FROM tb_score;

/* 유성구에 있는 고등학교  1학년 학생들의 평균점수를 조회하시오.
    (tb_student_info_test 테이블 사용)*/
/*----------서브쿼리 이용------------------*/
SELECT student.*, school.* ,
		(SELECT AVG(score.score_point)
         FROM tb_score score 
         WHERE score.student_id = student.student_id) AS '평균성적'
FROM tb_student_info_test student
INNER JOIN tb_school_info school
ON student.school_idx = school.school_idx
WHERE school.school_area = '유성구'
AND student.student_grade = 1;

/*----------Inner Join 2번사용------------------*/
SELECT student.student_name,
		school.school_area,
        school.school_name,
        AVG(score.score_point) AS '평균성적'
FROM tb_student_info_test student
INNER JOIN tb_school_info school
ON student.school_idx = school.school_idx
INNER JOIN tb_score score
ON student.student_id = score.student_id
WHERE school.school_area = '유성구'
AND student.student_grade = 1
GROUP BY student.student_id;


/* 1학년 학생들의 학교정보를 조회하시오. */
SELECT student.*, school.*
FROM tb_student_info_test student
INNER JOIN tb_school_info school
ON student.school_idx = school.school_idx
WHERE student.student_grade = 1;


/* 중구에 있는 고등학교 학생들의 정보를 조회하시오.
    (출력 내용 : 학생이름, 학년, 학교명, 우편번호, 학생주소) */
SELECT  student.student_name, 
		student.student_grade, 
		school.school_name, 
        student.student_zipcode,
        student.addr
FROM tb_student_info_test student
INNER JOIN tb_school_info school
ON student.school_idx = school.school_idx
WHERE school.school_area = '중구';


/* 중구에 있는 고등학교 학생들 중 평균성적이 80점 미만인 학생 정보를 출력하시오. */
SELECT student.student_name,
		student.student_grade,
        school.school_name,
        (SELECT score.score_point
         FROM tb_score score
         WHERE score.score_subject = '국어'
         AND score.student_id = student.student_id) AS '국어',
		(SELECT score.score_point
         FROM tb_score score
         WHERE score.score_subject = '영어'
         AND score.student_id = student.student_id) AS '영어',
		(SELECT score.score_point
         FROM tb_score score
         WHERE score.score_subject = '수학'
         AND score.student_id = student.student_id) AS '수학',
        AVG(score.score_point) AS '평균점수'
FROM tb_student_info_test student
INNER JOIN tb_score score
ON student.student_id = score.student_id
INNER JOIN tb_school_info school
ON student.school_idx = school.school_idx
WHERE school.school_area = '중구'
GROUP BY student.student_id
HAVING AVG(score.score_point) < 90;

