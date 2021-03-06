-- 다음과 같은 정보를 저장하기위한 테이블 생성
-- 학생번호, 학생이름, 학생나이, 학생국어점수, 영어점수, 수학점수
CREATE TABLE STU_TABLE (
	STU_IDX NUMBER,
	STU_NAME CHAR(10),
	STU_AGE NUMBER,
	STU_KOR NUMBER,
	STU_ENG NUMBER,
	STU_MATH NUMBER
);

INSERT INTO STU_TABLE 
	(STU_IDX, STU_NAME, STU_AGE, STU_KOR, STU_ENG, STU_MATH)
VALUES (1111, '홍길동', 30, 100, 80, 70);

SELECT * FROM STU_TABLE;

CREATE TABLE NUMBER_TABLE(
	NUMBER1 NUMBER, -- 40자리정도 가능
	NUMBER2 NUMBER(3),
	NUMBER3 NUMBER(5, 2)
);

INSERT INTO NUMBER_TABLE(NUMBER1)
VALUES (10000);

SELECT * FROM NUMBER_TABLE;

INSERT INTO NUMBER_TABLE(NUMBER2)
VALUES (10000); -- 오류남 3자리만 가능해서

INSERT INTO NUMBER_TABLE(NUMBER3)
VALUES (100.1111111); -- 데이터 INSERT 할 때 전체 5자리 소수점 2자리 까지만 저장됨

-- EMP 테이블을 복제한 EMP01 테이블을 만드시오
DROP TABLE EMP01;

CREATE TABLE EMP01
AS
SELECT * FROM EMP;

-- EMP 테이블에서 사원의 번호, 이름, 급여 정보를 가지고 있는 테이블을 생성
DROP TABLE EMP02;

CREATE TABLE EMP02
AS
SELECT EMPNO, ENAME, SAL
FROM EMP;

-- 30번 부서에 근무하고 있는 사원들의 사원번호, 이름, 근무부서 이름을 가지고 있는 테이블 생성
DROP TABLE EMP03;

CREATE TABLE EMP03
AS
SELECT A1.EMPNO, A1.ENAME, A2.DNAME
FROM EMP A1, DEPT A2
WHERE A1.DEPTNO = A2.DEPTNO AND A1.DEPTNO = 30;

-- 각 부서별 급여 총합, 평균, 최고액, 최저액, 사원수를 가지고 있는 테이블 생성
DROP TABLE EMP04;

CREATE TABLE EMP04
AS 
SELECT 
	SUM(SAL) AS SUM
	, TRUNC(AVG(SAL)) AS AVG
	, MAX(SAL) AS MAX
	, MIN(SAL) AS MIN
	, COUNT(SAL) AS COUNT
FROM EMP
GROUP BY DEPTNO;
-- 그룹 함수를 통해서 가져온건 이름이 없으면 테이블 만들때 오류남

SELECT * FROM EMP04;