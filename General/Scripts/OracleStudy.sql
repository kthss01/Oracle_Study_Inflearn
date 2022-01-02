SELECT * FROM tab;

CREATE TABLE BONUS (
	ENAME VARCHAR2(10),
	JOB VARCHAR2(10),
	SAL NUMBER,
	COMM NUMBER
);

COMMENT ON COLUMN BONUS.ENAME IS '이름';
COMMENT ON COLUMN BONUS.JOB IS '직무';
COMMENT ON COLUMN BONUS.SAL IS '급여';
COMMENT ON COLUMN BONUS.COMM IS '커미션';

CREATE TABLE DEPT (
	DEPTNO NUMBER,
	DNAME VARCHAR2(14),
	LOC VARCHAR2(13)
);

COMMENT ON COLUMN DEPT.DEPTNO IS '부서번호';
COMMENT ON COLUMN DEPT.DNAME IS '이름';
COMMENT ON COLUMN DEPT.LOC IS '지역';

CREATE TABLE EMP (
	EMPNO NUMBER,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER,
	HIREDATE DATE,
	SAL NUMBER,
	COMM NUMBER,
	DEPTNO NUMBER
);

COMMENT ON COLUMN EMP.EMPNO IS '사원번호';
COMMENT ON COLUMN EMP.ENAME IS '사원이름';
COMMENT ON COLUMN EMP.JOB IS '직무';
COMMENT ON COLUMN EMP.MGR IS '상관 사원번호';
COMMENT ON COLUMN EMP.HIREDATE IS '입사일';
COMMENT ON COLUMN EMP.SAL IS '급여';
COMMENT ON COLUMN EMP.COMM IS '커미션';
COMMENT ON COLUMN EMP.DEPTNO IS '근무 부서번호';

CREATE TABLE SALGRADE (
	GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER
);

COMMENT ON COLUMN SALGRADE.GRADE IS '등급';
COMMENT ON COLUMN SALGRADE.LOSAL IS '최저 급여액';
COMMENT ON COLUMN SALGRADE.HISAL IS '최고 급여액';

-------------------------------------------------------------------------------

-- DML Select -----------------------------------------------------------------
-- 부서의 모든 정보를 가져온다 
SELECT * FROM DEPT;

-- 사원의 모든 정보를 가져온다
SELECT * FROM EMP;

-- 사원의 이름과 사원 번호를 가져온다
SELECT ENAME, EMPNO FROM EMP;

-- 사원의 이름과 사원 번호, 직무, 급여를 가져온다
SELECT ENAME, EMPNO, JOB, SAL FROM EMP;

-- 부서 번호와 부서 이름을 가져온다.
SELECT DEPTNO, DNAME FROM DEPT;

-- DML 연산자 사용하기 --------------------------------------------------------

-- 산술 연산자
-- 각 사원들의 급여액과 급여액에서 
-- 1000을 더한 값, 200을 뺀 값, 2를 곱한 값,
-- 2로 나눈 값을 가져온다
SELECT SAL, SAL + 1000, SAL - 200, SAL * 2, SAL / 2
FROM EMP;

-- 각 사원의 급여액, 커미션, 급여 + 커미션 액수를 가져온다.
SELECT SAL, NVL(COMM, 0), SAL + NVL(COMM, 0)
FROM EMP;

-- concat 연산자
-- 사원들의 이름과 직무를 다음 양식으로 가져온다.
-- 000 사원의 담당 직무는 XXX 입니다.
SELECT ENAME || '사원의 담당 직무는 ' || JOB || '입니다'
FROM EMP;

-- Distinct
-- 사원들이 근무하고 있는 근무 부서의 번호를 가져온다.
SELECT DISTINCT DEPTNO FROM EMP;

-- 조건절 ---------------------------------------------------------------------

-- 근무 부서가 10번인 사원들의 사원번호, 이름, 근무 부서 번호를 가져온다.
SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE DEPTNO = 10;

-- 근무 부서가 10번이 아닌 사원들의 사원번호, 이름, 근무 부서 번호를 가져온다.
SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE DEPTNO != 10;

-- 급여가 1500이상인 사원들의 사원번호, 이름, 급여를 가져온다.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL >= 1500;

-- 이름이 SCOTT 사원의 사원번호, 이름, 직무, 급여를 가져온다.
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE ENAME = 'SCOTT';

-- 직무가 SALESMAN인 사원의 사원번호, 이름, 직무를 가져온다.
SELECT EMPNO, ENAME, JOB FROM EMP WHERE JOB = 'SALESMAN';

-- 직무가 CLERK이 아닌 사원의 사원번호, 이름, 직무를 가져온다.
SELECT EMPNO, ENAME, JOB FROM EMP WHERE JOB != 'CLERK';

-- 1982년 1월 1일 이후에 입사한 사원의 사원번호, 이름, 입사일을 가져온다.
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE HIREDATE >= '1982/01/01';

-- 논리 연산자 사용하기 -------------------------------------------------------

-- 10번 부서에서 근무하고 있는 직무가 MANAGER인 사원의 사원번호, 이름, 근무부서, 직무를 가져온다.
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE 1=1
AND DEPTNO = 10
AND JOB = 'MANAGER';

-- 입사년도가 1981년인 사원 중에 급여가 1500 이상인 사원의 사원번호, 이름, 급여, 입사일을 가져온다.
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE 1=1
--AND HIREDATE >= '1981/01/01' 
--AND HIREDATE <= '1981/12/31'
AND HIREDATE BETWEEN '1981/01/01' AND '1981/12/31'
AND SAL >= 1500;

-- 20번 부서에 근무하고 있는 사원 중에 급여가 1500 이상인 사원의 사원번호, 이름, 부서번호, 급여를 가져온다.
SELECT EMPNO, ENAME, DEPTNO, SAL
FROM EMP
WHERE 1=1
AND DEPTNO = 20
AND SAL >= 1500;

-- 직속상관 사원 번호가 7698번인 사원 중에 직무가 CLERK인 사원의 사원번호, 이름, 직속상관번호, 직무를 가져온다.
SELECT EMPNO, ENAME, MGR, JOB
FROM EMP
WHERE 1=1
AND MGR = 7698
AND JOB = 'CLERK';

-- 급여가 2000보다 크거나 1000보다 작은 사원의 사원번호, 이름, 급여를 가져온다
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE 1=1
AND (SAL >= 2000 OR SAL <= 1000);
--AND NOT(SAL >= 1000 AND SAL <= 2000);
--AND NOT(SAL BETWEEN 1000 AND 2000); 

-- 부서번호가 20이거나 30인 상원의 사원번호, 이름, 부서번호를 가져온다.
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30;

-- 직무가 CLERK, SALESMAN, ANALYST인 사원의 사원번호. 이름, 직무를 가져온다.
SELECT EMPNO, ENAME, JOB
FROM EMP
--WHERE JOB = 'CLERK' OR JOB = 'SALESMAN' OR JOB = 'ANALYST';
WHERE JOB IN ('CLERK', 'SALESMAN', 'ANALYST');

-- 사원 번호가 7499, 7566, 7839가 아닌 사원들의 사원번호, 이름을 가져온다.
SELECT EMPNO, ENAME
FROM EMP
--WHERE EMPNO != 7499 AND EMPNO != 7566 AND EMPNO != 7839;
WHERE EMPNO NOT IN (7499, 7566, 7839);

-- like 연산자 ----------------------------------------------------------------

-- 이름이 F로 시작하는 사원의 이름과 사원 번호를 가져온다.
SELECT ENAME, EMPNO FROM EMP WHERE ENAME LIKE 'F%';

-- 이름이 S로 끝나는 사원의 이름과 사원 번호를 가져온다.
SELECT ENAME, EMPNO FROM EMP WHERE ENAME LIKE '%S';

-- 이름에 A가 포함되어 있는 사원의 이름과 사원 번호를 가져온다.
SELECT ENAME, EMPNO FROM EMP WHERE ENAME LIKE '%A%';

-- 이름의 두번째 글자가 A인 사원의 사원 이름, 사원 번호를 가져온다.
SELECT ENAME, EMPNO FROM EMP WHERE ENAME LIKE '_A';

-- 이름이 4글자인 사원의 사원 이름, 사원 번호를 가져온다.
SELECT ENAME, EMPNO FROM EMP WHERE ENAME LIKE '____';

-- null 비교 ------------------------------------------------------------------

-- 사원 중에 커미션을 받지 않는 사원의 사원번호, 이름, 커미션을 가져온다.
SELECT EMPNO, ENAME, COMM FROM EMP WHERE COMM IS NULL;

-- 회사 대표(직속상관이 없는 사람)의 이름과 사원번호를 가져온다.
SELECT ENAME, EMPNO FROM EMP WHERE MGR IS NULL;