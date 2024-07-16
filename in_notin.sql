DESC tb_student_info;
DESC tb_school_info;
DESC tb_score;


/*학생정보에서 3학년을 제외한 1,2학년 학생들의 정보를 출력하시오.*/
SELECT * 
FROM tb_student_info
WHERE student_grade
NOT IN(3);


SELECT *
FROM tb_student_info;

/*대전고등학교와 대전여자고등학교의 학생 수를 출력하시오.*/
SELECT student_school, COUNT(student_id)
FROM tb_student_info
WHERE student_school LIKE '대전%'
GROUP BY student_school;


SELECT * FROM tb_score;

/*수학점수가 70점 이상 80점 미만이 아닌 학생수를 구하시오.
SELECT COUNT(student_id)
FROM tb_score
WHERE score_subject = '수학'
AND score_point < 70
AND score_point >= 80;

*/
