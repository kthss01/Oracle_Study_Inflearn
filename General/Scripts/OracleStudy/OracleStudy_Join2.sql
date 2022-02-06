-- self join
-- SMITH 사원의 사원번호, 이름, 직속상관 이름을 가져온다.
-- a1 : SMITH 사원의 정보
-- a2 : 직속상관의 정보
SELECT A1.EMPNO, A1.ENAME, A2.ENAME
FROM EMP A1, EMP A2
WHERE A1.MGR = A2.EMPNO;

-- FORD 사원 밑에서 일하는 사원들의 사원번호, 이름, 직무를 가져온다.
-- a1 : FORD 정보
-- a2 : 부하 직원의 정보
SELECT A2.EMPNO, A2.ENAME, A2.JOB
FROM EMP A1, EMP A2
WHERE A1.EMPNO = A2.MGR 
AND A1.ENAME = 'FORD';

-- SMITH 사원의 직속상관과 동일한 직무를 가지고 있는 사원들의 사원번호, 이름, 직무를 가져온다
-- a1 : SMITH 정보
-- a2 : SMITH의 직속상관의 정보
-- a3 : 직송상관과 동일한 직무를 가지고 있는 사원들의 정보
SELECT A3.EMPNO, A3.ENAME, A3.JOB
FROM EMP A1, EMP A2, EMP A3
WHERE A1.MGr = A2.EMPNO
AND A2.JOB = A3.JOB
AND A1.ENAME = 'SMITH';

-- outer join
-- 각 사원의 이름, 사원번호, 직장상사 이름을 가져온다. 단 직속상관이 없는 사원도 가져온다.
-- a1 : 각 사원의 정보
-- a2 : 직속상관의 정보
SELECT A1.ENAME, A1.EMPNO, A2.ENAME
FROM EMP A1, EMP A2 
WHERE A1.MGR = A2.EMPNO(+); -- 부족한 쪽에 (+) 추가 

-- 모든 부서의 소속 사원의 근무부서명, 사원번호, 사원이름, 급여를 가져온다.
SELECT DISTINCT DEPTNO FROM DEPT;

SELECT A2.DNAME, A1.EMPNO, A1.ENAME, A1.SAL
FROM EMP A1, DEPT A2
WHERE A1.DEPTNO(+) = A2.DEPTNO; -- 없는 쪽에 (+) 추가