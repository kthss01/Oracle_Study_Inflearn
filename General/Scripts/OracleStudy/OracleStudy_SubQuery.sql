-- 서브쿼리
-- SCOTT 사원이 근무하고 있는 부서의 이름을 가져온다.
SELECT DNAME
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
				FROM EMP
				WHERE NAME = 'SCOTT');

SELECT DEPTNO
FROM EMP
WHERE NAME = 'SCOTT';

--- 조인으로도 해결 가능함
SELECT A2.DEPTNAME
FROM EMP A1, DEPT A2
WHERE A1.DEPTNO = A2.DEPTNO AND A1.ENAME = 'SCOTT';

-- SMITH와 같은 부서에 근무하고 있는 사원들의 사원번호, 이름, 급여액, 부서이름을 가져온다.
SELECT A1.EMPNO, A1.ENAME, A1.SAL, A2.DNAME
FROM EMP A1, DEPT A2
WHERE A1.DEPTNO = A2.DEPTNO AND A1.DEPTNO = (	SELECT DEPTNO
												FROM EMP
												WHERE ENAME = 'SMITH');

SELECT DEPTNO
FROM EMP
WHERE ENAME = 'SMITH';

-- MARTIN과 같은 직무를 가지고 있는 사원들의 사원번호, 이름, 직무를 가져온다.
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB = (	SELECT JOB
				FROM EMP
				WHERE ENAME = 'MARTIN');

SELECT JOB
FROM EMP
WHERE ENAME = 'MARTIN';

-- ALLEN과 같은 직속상관을 가진 사원들의 사원번호, 이름, 직속상관이름을 가져온다.
-- a1 : 사원의 정보
-- a2 : 직속상관 정보
SELECT A1.EMPNO, A1.ENAME, A2.ENAME
FROM EMP A1, EMP A2
WHERE A1.MGR = A2.EMPNO AND A1.MGR = (	SELECT MGR
										FROM EMP
										WHERE ENAME = 'ALLEN');

SELECT MGR
FROM EMP
WHERE ENAME = 'ALLEN';

-- WARD와 같은 부서에 근무하고 있는 사원들의 사원번호, 이름, 부서번호를 가져온다.
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
				FROM EMP
				WHERE ENAME='WARD');

SELECT DEPTNO
FROM EMP
WHERE ENAME='WARD';

-- SALESMAN의 평균 급여보다 많이 받는 사원들의 사원번호, 이름, 급여를 가져온다.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (	SELECT AVG(SAL)
				FROM EMP 
				WHERE JOB = 'SALESMAN');

SELECT AVG(SAL)
FROM EMP 
WHERE JOB = 'SALESMAN';

-- DALLAS 지역에 근무하는 사원들의 평균 급여를 가져온다.
SELECT TRUNC(AVG(SAL))
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
				FROM DEPT
				WHERE LOC = 'DALLAS');

SELECT DEPTNO
FROM DEPT
WHERE LOC = 'DALLAS';

-- SALES 부서에 근무하는 사원들의 사원번호, 이름, 근무지역을 가져온다.
SELECT A1.EMPNO, A1.ENAME, A2.LOC
FROM EMP A1, DEPT A2
WHERE A1.DEPTNO = A2.DEPTNO AND A1.DEPTNO = (	SELECT DEPTNO
												FROM DEPT
												WHERE DNAME='SALES');

SELECT DEPTNO
FROM DEPT
WHERE DNAME='SALES';

-- CHICAGO 지역에 근무하는 사원들 중 BLAKE이 직속상관인 사원들의 사원번호, 이름, 직무를 가져온다.
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
				FROM DEPT
				WHERE LOC='CHICAGO') 
AND MGR = (	SELECT EMPNO
			FROM EMP
			WHERE ENAME='BLAKE');

SELECT DEPTNO
FROM DEPT
WHERE LOC='CHICAGO';

SELECT EMPNO
FROM EMP
WHERE ENAME='BLAKE';