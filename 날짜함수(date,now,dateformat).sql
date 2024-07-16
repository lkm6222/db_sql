SELECT NOW();

SELECT current_timestamp();

SELECT * FROM data_insert_history;
INSERT INTO data_insert_history(table_name) VALUES('test');

SELECT curdate();
SELECT curtime();

SELECT DATE('2024-07-16');
SELECT YEAR('2024-07-16'), MONTH('2024-07-16');

SELECT MONTHNAME('2024-07-16');

SELECT DAYOFMONTH('2024-07-16'), DAY('2024-07-16');

SELECT HOUR(NOW());
SELECT MINUTE(NOW());
SELECT SECOND(NOW());

SELECT DATEDIFF(NOW(), '2024-07-15'), DATEDIFF('2024-07-15', NOW());
SELECT DATEDIFF('2024-07-18', NOW());
SELECT TIMEDIFF('2024-07-18 11::30:00', NOW());

SELECT DATE_ADD(NOW(), INTERVAL 30 DAY);
SELECT DATE_SUB(NOW(), INTERVAL 30 MONTH);

SELECT DATE_FORMAT(NOW(), '%y-%m-%d');
SELECT DATE_FORMAT(NOW(), '%Y-%M-%D %H:%i:%s');

/*-----------------실습 예제--------------------*/
/* 살아온 일수를 구하시오. */
SELECT DATEDIFF(NOW(), '1984-06-02');

/*오늘 날짜를 년도월일 시간:분:초 형태로 출력하시오.
	ex) 20240715 12:00:00 */
SELECT DATE_FORMAT(NOW(), '%Y%m%d %h:%i:%s');

