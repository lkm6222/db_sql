SELECT * 
FROM tb_student_info;

/*학생들 중 서구에 있는 고등학교에 재학중이고, 2학년인 학생 정보를 출력하시오.*/
SELECT * 
FROM tb_student_info
WHERE student_school_area = '서구'
AND student_grade = 2;


/*관평고등학교와 관평여자고등학교의 학생 정보를 출력하시오.*/
SELECT *
FROM tb_student_info
WHERE student_school = '관평고등학교'
OR student_school = '관평여자고등학교';
