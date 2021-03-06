-- 결과가 하나 이상인 서브쿼리
-- 3000 이상의 급여를 받는 사원들과 같은 부서에 근무하고 있는 사원의 사원번호, 이름, 급여를 가져온다.
SELECT EMPNO, ENMAE, SAL
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
				FROM EMP
				WHERE SAL >= 3000);

SELECT DEPTNO
FROM EMP
WHERE SAL >= 3000;

-- 직무가 CLERK인 사원과 동일한 부서에 근무하고 있는 사원들의 사원번호, 이름, 입사일 가져온다.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
				FROM EMP
				WHERE JOB = 'CLERK');

SELECT DEPTNO
FROM EMP
WHERE JOB = 'CLERK';

-- KING을 직속상관으로 가지고 있는 사원들이 근무하고 있는 근무 부서명, 지역을 가지고 온다.
SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
				FROM EMP
				WHERE MGR = (SELECT EMPNO
							FROM EMP
							WHERE ENAME = 'KING'));

SELECT DEPTNO
FROM EMP
WHERE MGR = (SELECT EMPNO
			FROM EMP
			WHERE ENAME = 'KING');

SELECT EMPNO
FROM EMP
WHERE ENAME = 'KING';

-- CLERK들의 직속상관의 사원번호, 이름, 급여를 가져온다.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE EMPNO IN (SELECT MGR
				FROM EMP
				WHERE JOB = 'CLERK');

SELECT MGR
FROM EMP
WHERE JOB = 'CLERK';

-- 각 부서별 급여 평균보다 더 많이 받는 사원의 사원번호, 이름, 급여를 가져온다.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > ALL (SELECT AVG(SAL)
				FROM EMP
				GROUP BY DEPTNO);

SELECT AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT MAX((SAL))
				FROM EMP
				GROUP BY DEPTNO);
-- all 같은 경우 max로 한걸로 처리 가능하다고 함

-- 각 부서별 급여 최저치보다 더 많이 받는 사원들의 사원번호, 이름, 급여를 가져온다.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > ALL (SELECT MIN(SAL)
				FROM EMP
				GROUP BY DEPTNO);

SELECT MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT MAX(MIN(SAL))
				FROM EMP
				GROUP BY DEPTNO);

-- SALESMAN 보다 급여를 적게 받는 사원들의 사원번호, 이름, 급여를 가져온다.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < ALL (SELECT SAL
				FROM EMP
				WHERE JOB = 'SALESMAN');

SELECT SAL
FROM EMP
WHERE JOB = 'SALESMAN';

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < (SELECT MIN(SAL)
				FROM EMP
				WHERE JOB = 'SALESMAN');
				
-- 각 부서별 최저 급여 액수보다 많이 받는 사원들의 사원번호, 이름, 급여를 가져온다.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT MIN(SAL)
				FROM EMP
				GROUP BY DEPTNO);

SELECT MIN(SAL)
FROM EMP
GROUP BY DEPTNO;
			
-- DALLAS에 근무하고 있는 사원들 중 가장 나중에 입사한 사원의 입사 날짜보다
-- 더 먼저 입사한 사원들의 사원번호, 이름, 입사일을 가져온다.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE HIRDEATE < ANY (SELECT HIREDATE
						FROM EMP
						WHERE DEPTNO = (SELECT DEPTNO
										FROM DEPT
										WHERE LOC = 'DALLAS'));

SELECT HIREDATE
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
				FROM DEPT
				WHERE LOC = 'DALLAS');

SELECT DEPTNO
FROM DEPT
WHERE LOC = 'DALLAS';