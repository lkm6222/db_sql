
INSERT INTO tb_student_info_test(
	student_name,
    student_grade,
    school_idx,
    student_zipcode,
    addr
)
SELECT student_name,
		student_grade,
		CASE
			WHEN student_school = '대전고등학교' then 1
			WHEN student_school = '대전여자고등학교' then 2
			WHEN student_school = '관평고등학교' then 3
            WHEN student_school = '관평여자고등학교' then 4
		END,
        student_zipcode,
        addr
FROM tb_student_info;

SELECT * FROM  tb_student_info_test;