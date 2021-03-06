DROP TABLE EMP01;

CREATE TABLE EMP01
AS
SELECT * FROM EMP;

SELECT * FROM EMP01;

DELETE FROM EMP01;

DROP TABLE EMP01;

CREATE TABLE EMP01
AS 
SELECT * FROM EMP;

-- 사원번호가 7459인 사원의 정보를 삭제
DELETE FROM EMP01 
WHERE EMPNO = 7499;

SELECT * FROM EMP01;

-- 사원의 급여가 평균 급여 이하인 사원의 정보 삭제
DELETE FROM EMP01
WHERE SAL <= (SELECT AVG(SAL)
				FROM EMP01);

SELECT AVG(SAL)
FROM EMP01;

-- 커미션을 받지 않는 사원들의 정보를 삭제
DROP TABLE EMP01;
CREATE TABLE EMP01
AS
SELECT * FROM EMP;

DELETE FROM EMP01
WHERE COMM IS NULL;

