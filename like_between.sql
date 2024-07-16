SELECT *
FROM tb_student_info
WHERE student_name LIKE '김__';
/* WHERE student_name LIKE '김%' */

/* 관평고등학교와 관평여자고등학교의 학생 정보를 LIKE를 사용하여 출력하시오 */
SELECT *
FROM tb_student_info
WHERE student_school LIKE '%관평%';

SELECT *
FROM tb_student_info
WHERE addr LIKE '%중구%'
AND student_school LIKE '%여자%';


SELECT *
FROM tb_score
WHERE score_subject = '수학';

/* 국어점수가 80점 이상 90점이하인 학생수를 구하시오. */
SELECT COUNT(student_id)
FROM tb_score
WHERE score_point
BETWEEN 80 AND 90
AND score_subject = '국어' ;
