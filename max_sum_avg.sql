SELECT score_subject, score_point
FROM tb_score
WHERE score_subject = '국어';

SELECT score_subject, max(score_point)
FROM tb_score
WHERE score_subject = '국어';

/*tb_score 테이블에서 student_id = 1의 국어,영어, 수학의 총점과 평균 점수 구하기*/
SELECT sum(score_point),
		avg(score_point)
FROM tb_score
WHERE student_id = '1';

/*학생별 과목 총점과 평균점수*/
SELECT student_id,
		sum(score_point),
		avg(score_point)
FROM tb_score
GROUP BY student_id;