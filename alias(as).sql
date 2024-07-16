SELECT tsi.student_id AS 'id',
		tsi.student_school AS 'school',
        tsi.student_name AS 'name',
        ts.score_subject AS 'subject',
        ts.score_point AS 'point'
FROM tb_student_info tsi
JOIN tb_score ts
ON tsi.student_id = ts.student_id;


/*tb_student_info 테이블에 있는 학생들 정보를 별칭을 주어 출력하시오.
(student_id : id, student_name : name, student_school : school, student_school_area : schoolArea)*/
SELECT student_id AS 'id',
	student_name AS 'name',
	student_school AS 'school',
	student_school_area AS 'schoolArea' 
FROM tb_student_info;