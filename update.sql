update tb_score
set score_point = 90
where student_id = 1;

select * from tb_score;

/*tb_score 테이블의 student_name이 김희선인 학생의 database 과목의 점수를 등록하시오*/
select *
from tb_student_info
where student_name='김희선';

select *
from tb_score
where student_id = 13;

INSERT INTO tb_score
(	
student_id,
score_season,
score_subject,
score_point
)
VALUES
(
'13',
'202401',
'database',
100
);
select * from tb_score;

delete from tb_score where score_subject ='database'
and student_id =13;

