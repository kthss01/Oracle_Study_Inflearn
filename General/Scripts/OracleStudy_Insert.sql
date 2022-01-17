DROP TABLE EMP01;

-- 테이블 구조만 가져와 테이블 만드는거
CREATE TABLE EMP01
AS
SELECT EMPNO, ENAME, JOB, FROM EMP WHERE 1 = 0;

SELECT * FROM EMP01;

-- 다음과 같은 사원 정보 추가
-- 1111 홍길동 인사
-- 2222 김길동 개발
-- 3333 최길동 인사
-- 4444 박길동 생산

INSERT INTO EMP01 (EMPNO, ENAME, JOB)
VALUES (1111, '홍길동', '인사');

INSERT INTO EMP01 (EMPNO, ENAME, JOB)
VALUES (2222, '김길동', '개발');

INSERT INTO EMP01 (EMPNO, ENAME, JOB)
VALUES (3333, '최길동', '인사');

INSERT INTO EMP01 (EMPNO, ENAME, JOB)
VALUES (4444, '박길동', '생산');

SELECT * FROM EMP01;

-- 컬럼 목록을 생략하는 경우
INSERT INTO EMP01
VALUES (5555, '황길동', '개발');

-- 컬럼 목록에 모든 컬럼이 있지 않은 경우
INSERT INTO EMP01 (EMPNO, ENAME)
VALUES (6666, '이길동');
-- job null 값으로 들어감

-- null 명시적으로 저장
INSERT INTO EMP01 (EMPNO, ENAME, JOB)
VALUES (7777, '박보검', null);

DROP TABLE EMP02;

CREATE TABLE EMP02
AS
SELECT EMPNO, ENAME, JOB FROM EMP WHENE 1 = 0;


INSERT INTO EMP02 (EMPNO, ENAME, JOB)
SELECT EMPNO, ENAME, JOB FROM EMP;

SELECT * FROM EMP02;

INSERT INTO EMP02
SELECT EMPNO, ENAME, JOB FROM EMP01;

DROP TABLE EMP03;
DROP TABLE EMP04;

CREATE TABLE EMP03
AS
SELECT EMPNO, ENAME, JOB FROM EMP WHERE 1 = 0;

CREATE TABLE EMP04
AS
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE 1 = 0;

INSERT ALL
INTO EMP03 (EMPNO, ENAME, JOB) VALUES (EMPNO, ENAME, JOB)
INTO EMP04 (EMPNO, ENAME, HIREDATE) VALUES (EMPNO, ENAME, HIREDATE)
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP;

SELECT * FROM EMP03;
SELECT * FROM EMP04;


-- 사원번호 이름 급여를 저장할 수 있는 빈 테이블을 만들고
-- 급여가 1500 이상인 사원들의 사원번호, 이름, 급여를 저장
DROP TABLE EMP05;

CREATE TABLE EMP05
AS
SELECT EMPNO, ENAME, SAL FROM EMP WHERE 1 = 0;

INSERT INTO EMP05 (EMPNO, ENAME, SAL)
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >= 1500;

SELECT * FROM EMP05;

-- 사원번호, 이름, 부서명을 저장할 수 있는 빈 테이블을 만들고
-- DALLAS 지역에 근무하고 있는 사원들의 사원번호, 이름, 부서명을 저장
DROP TABLE EMP06;

CREATE TABLE EMP06
AS
SELECT A1.EMPNO, A1.ENAME, A2.DNAME
FROM EMP A1, DEPT A2
WHERE A1.DEPTNO = A2.DEPTNO;

INSERT INTO EMP06 (EMPNO, ENAME, DNAME)
SELECT A1.EMPNO, A1.ENAME, A2.DNAME
FROM EMP A1, DEPT A2
WHERE A1.DEPTNO = A2.DEPTNO;

SELECT * FROM EMP06;

