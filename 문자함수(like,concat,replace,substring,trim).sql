SELECT *
FROM tb_student_info
WHERE addr LIKE concat('%', student_school_area, '%')
AND student_school_area = '중구';

SELECT REPLACE('HELLO WORLD', 'WORLD', 'MYSQL') AS RESULT;

SELECT SUBSTRING('문자열내에서 지정한 시작부분부터 길이 값 만큼 반환', 8, 3);

SELECT TRIM('   HELLO    ');

SELECT IF(trim('    hello   ') = 'hello', '참', '거짓');
SELECT IF(rtrim('    hello   ') = '    hello', '참', '거짓');
SELECT IF(ltrim('    hello   ') = 'hello   ', '참', '거짓');

SELECT LEFT('가나다라마바사아자차카타파하', 5);
SELECT RIGHT('가나다라마바사아자차카타파하', 5);

SELECT UPPER('asdf');
SELECT LOWER('ASDF');

/*-----------------실습 예제-----------------*/
/* tb_student_info 테이블의 학생정보를 OO고등학교_O학년_OOO의 형태로 출력하시오.*/
SELECT CONCAT(student_school, "_", student_grade, "학년_", student_name) 
FROM tb_student_info;


/*본인 휴대전화번호를 010-0000-000 에서 –을 공백으로 변환하여 출력하시오.*/
SELECT REPLACE('010-6750-7748', "-", " ");


/*본인 휴대전화번호의 가운데 4자리만 출력하시오.*/
SELECT SUBSTRING('010-6750-7748', 5, 4);


/*본인 휴대전화번호에서 010- 을 제외한 나머지 번호를 출력하시오*/
SELECT SUBSTRING('010-6750-7748', 5);
SELECT REPLACE('010-6750-7748', '010-', '');


/*본인 휴대전화번호에서 앞 3자리, 중간 4자리, 마지막 4자리를 추출한 후 문자열을 합쳐서(CONCAT사용) 
          010-0000-0000의 형태로 출력하시오.*/
SELECT 
CONCAT(
	LEFT('010-6750-7748', 3), "-", 
	SUBSTRING('010-6750-7748', 5, 4),"-", 
	RIGHT('010-6750-7748', 4)) AS RESULT;