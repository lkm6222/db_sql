SELECT score_subject
FROM tb_score
GROUP BY score_subject;

SELECT COUNT(*)
FROM tb_score;

SELECT score_subject, 
COUNT(score_subject)
FROM tb_score
GROUP BY score_subject;

SELECT score_subject, 
SUM(score_point)
FROM tb_score
GROUP BY score_subject;

SELECT score_subject, 
SUM(score_point)/12,
AVG(score_point)
FROM tb_score
GROUP BY score_subject;