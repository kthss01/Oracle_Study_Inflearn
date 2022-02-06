-- 그룹함수

-- 사원들의 급여 총합을 구한다.
SELECT SUM(SAL)
FROM EMP;

-- 사원들의 커미션 총합을 구한다.
-- NULL 무시하고 합함
SELECT SUM(COMM)
FROM EMP;

-- 급여가 1500이상인 사원들의 급여 총합을 구한다.
SELECT SUM(SAL)
FROM EMP
WHERE SAL >= 1500;

-- 20번 부서에 근무하고 있는 사원들의 급여 총합을 구한다.
SELECT SUM(SAL)
FROM EMP
WHERE DEPTNO = 20;

-- 직무가 SALESMAN인 사원들의 급여 총합을 구한다.
SELECT SUM(SAL)
FROM EMP
WHERE JOB = 'SALESMAN';

-- 직무가 SALESMAN인 사원들의 이름과 급여총합을 가져온다
SELECT ENAME, SUM(SAL)
FROM EMP
WHERE JOB = 'SALESMAN';
-- 오류 발생 

-- 전 사원의 급여 평균을 구한다.
SELECT AVG(SAL), TRUNC(AVG(SAL))
FROM EMP;

-- 커미션을 받는 사원들의 커미션 평균을 구한다.
SELECT TRUNC(AVG(COMM))
FROM EMP;
-- 그룹함수 구할 때 NULL 빼버림

-- 전 사원의 커미션의 평균을 구한다.
SELECT TRUNC(AVG(NVL(COMM, 0)))
FROM EMP;

-- 커미션을 받는 사원들의 급여 평균을 구한다.
SELECT TRUNC(AVG(SAL))
FROM EMP
WHERE COMM IS NOT NULL;

-- 30번 부서에 근무하고 있는 사원들의 급여 평균을 구한다.
SELECT TRUNC(AVG(SAL))
FROM EMP
WHERE DEPTNO = 30;

-- 직무가 SALESMAN인 사원들의 급여 + 커미션 평균을 구한다.
SELECT SAL, COMM, TRUNC(AVG(SAL + COMM))
FROM EMP
WHERE JOB = 'SALESMAN'

-- 사원들의 총 수를 가져온다.
SELECT COUNT(EMPNO)
FROM EMP;

SELECT COUNT(*)
FROM EMP;

-- 커미션을 받는 사원들의 총 수
SELECT COUNT(COMM)
FROM EMP;
-- 그룹함수 NULL 제외해서 그런거

-- 사원들의 급여 최대, 최소값을 가져온다.
SELECT MAX(SAL), MIN(SAL)
FROM EMP;

-- Group By

-- 각 부서별 사원들의 급여 평균을 구한다.
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;
-- group by 에 조건이 되는 컬럼도 조회 가능

-- 각 직무별 사원들의 급여 총합을 구한다.
SELECT JOB, SUM(SAL)
FROM EMP
GROUP BY JOB;

-- 1500 이상 급여를 받는 사원들의 부서별 급여 평균을 구한다.
SELECT DEPTNO, AVG(SAL)
FROM EMP
WHERE SAL >= 1500
GROUP BY DEPTNO;

-- Having

-- 부서별 평균 급여가 2000 이상인 부서의 급여 평균을 가져온다
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;

-- 부서별 최대 급여액이 3000 이하인 부서의 급여 총합을 가져온다.
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) <= 3000;

-- 부서별 최소 급여액이 1000 이하인 부서에서 직무가 CLERK인 사원들의 급여 총합을 구한다.
SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE JOB = 'CLERK'
GROUP BY DEPTNO
HAVING MIN(SAL) <= 1000;

-- 각 부서가 급여 최소가 900 이상 최대가 10000 이하인 부서의 사원들 중 1500 이상의 급여를 받는 사원들의 평균 급여액을 가져온다.
SELECT DEPTNO, AVG(SAL)
FROM EMP
WHERE SAL >= 1500
GROUP BY DEPTNO
HAVING MIN(SAL) >= 900 AND MAX(SAL) <= 10000;