SELECT IF(1>0, 'TRUE', 'FALSE');
SELECT IF(student_grade = 1, '신입생', '재학생')
FROM  tb_student_info;

/*
SELECT 
	CASE WHEN 조건 THEN 반환값
		 WHEN 조건 THEN 반환값
		 ELSE 반환값 END
FROM 테이블명;
*/
SELECT 
	CASE WHEN student_grade = 1 THEN '신입생'
		 WHEN student_grade = 2 THEN '재학생'
		 ELSE '수험생' END
FROM tb_student_info;

SELECT IFNULL(NULL, 'Hello World');


/*-----------------실습 예제----------------------*/
/* tb_score테이블에서 성적이 90점 이상이면 ‘우수’ , 아니라면 ‘보통’이 출력되도록 하시오. */
SELECT *, 
IF(score_point >= 90, '우수', '보통') AS '우수여부'
FROM tb_score;


/* tb_score 테이블에서 성적이 70~79점 '노력필요', 80~89점 '보통', 90~100점 '우수'로 보이도록 출력하시오.*/
SELECT student_id, score_season, score_subject, score_point,
	CASE WHEN score_point <= 79 THEN '노력필요'
		 WHEN score_point <= 89 THEN '보통'
         WHEN score_point <= 100 THEN '우수'
         ELSE '' END AS '우수여부'
FROM tb_score;


