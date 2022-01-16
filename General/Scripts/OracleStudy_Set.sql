-- SET
-- 10번 부서에 근무하고 있는 사원의 사원번호, 이름, 직무, 근무부서 번호
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

-- 직무가 CLERK인 사원의 사원번호, 이름, 직무, 근무부서 번호
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB = 'CLERK';

-- UNION
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB = 'CLERK';

-- UNION ALL
-- 중복된것도 가져옴
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 10;
UNION ALL
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB = 'CLERK';

-- INTERSECT
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 10;
INTERSECT
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB = 'CLERK';

-- MINUS
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 10;
MINUS
SELECT EMPNO, ENAME, JOB, DEPTNO
FROM EMP
WHERE JOB = 'CLERK';