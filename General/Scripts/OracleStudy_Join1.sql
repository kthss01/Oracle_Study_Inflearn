-- 사원테이블(emp)과 부서테이블(dept) join
SELECT * FROM EMP; -- 14
SELECT * FROM DEPT; -- 4
SELECT * FROM EMP, DEPT; -- 56 = 14 * 4

SELECT * 
FROM EMP A1, DEPT A2 
WHERE A1.DEPTNO = A2.DEPTNO;

-- 사원의 사원번호, 이름, 근무부서 이름을 가져온다.
SELECT A1.EMPNO, A1.ENAME, A2.DNAME
FROM EMP A1, DEPT A2
WHERE A1.DEPTNO = A2.DEPTNO

-- 사원의 사원번호, 이름, 근무지역을 가져온다.
SELECT A1.EMPNO, A1.ENAME, A2.LOC
FROM EMP A1, DEPT A2
WHERE A1.DEPTNO = A2.DEPTNO

-- DALLAS에 근무하고 있는 사원들의 사원번호, 이름, 직무를 가져온다.
SELECT A1.EMPNO, A1.ENAME, A1.JOB
FROM EMP A1, DEPT A2
WHERE A1.DEPTNO = A2.DEPTNO
AND A2.LOC = 'DALLAS';

-- SALES 부서에 근무하고 있는 사원들의 급여 평균을 가져온다.
SELECT AVG(SAL)
FROM EMP A1, DEPT A2
WHERE A1.DEPTNO = A2.DEPTNO
AND A2.DNAME = 'SALES';

-- 1982년에 입사한 사원들의 사원번호, 이름, 입사일, 근무부서이름을 가져온다.
SELECT A1.EMPNO, A1.ENAME, A1.HIREDATE, A2.DNMAE 
FROM EMP A1, DEPT A2
WHERE A1.DEPTNO = A2.DEPTNO
AND A1.HIREDATE BETWEEN '1982/01/01' AND '1982/12/31';

-- 각 사원들의 사원번호, 이름, 급여, 급여등급을 가져온다.
SELECT A1.EMPNO, A1.ENAME, A1.SAL, A2.GRADE
FROM EMP A1, SALGRADE A2
WHERE A1.SAL BETWEEN A2.LOSAL AND A2.HISAL;

-- SALES 부서에 근무하고 있는 사원의 사원번호, 이름, 급여등급을 가져온다.
SELECT A1.EMPNO, A1.ENAME, A2.GRADE
FROM EMP A1, SALGRADE A2, DEPT A3
WHERE A1.SAL BETWEEN A2.LOSAL AND A2.HISAL
AND A1.DEPTNO = A3.DEPTNO
AND A3.DNAME = 'SALES';

-- 각 급여 등급별 급여의 총합과 평균, 사원의 수, 최대급여, 최소급여를 가져온다.
SELECT SUM(A1.SAL), TRUNC(AVG(A1.SAL), COUNT(A1.SAL), MAX(A1.SAL), MIN(A1.SAL)
FROM EMP A1, SALGRADE A2 
WHERE A1.SAL BETWEEN A2.LOSAL AND A2.HISAL
GROUP BY A2.GRADE;

-- 급여 등급이 4등급인 사원들의 사원번호, 이름, 급여, 근무부서이름, 근무지역을 가져온다.
SELECT A1.EMPNO, A1.ENAME, A1.SAL, A3.DNAME, A3.LOC
FROM EMP A1, SALGRADE A2, DEPT A3
WHERE A1.SAL BETWEEN A2.LOSAL AND A2.HISAL
AND A1.DEPTNO = A3.DEPTNO
AND A2.GRADE = 4;


