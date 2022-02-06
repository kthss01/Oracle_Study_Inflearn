-- 날짜 함수

-- 현재 날짜 구하기
SELECT SYSDATE FROM DUAL; -- 년월일 시분초 다나옴

-- 날짜 데이터 연산
SELECT SYSDATE
	, SYSDATE - 10000 -- 현재 시간 기준 10000일 빼는거
	, SYSDATE + 10000 -- 현재 시간 기준 10000일 더하는거
FROM DUAL;

-- 각 사원이 입사한 날짜로부터 1000일 후가 되는 날짜를 가져온다.
SELECT HIREDATE, HIREDATE + 1000
FROM EMP;

-- 직무가 SALESMAN인 사원의 입사일 100일전 날짜를 가져온다.
SELECT HIREDATE, HIREDATE - 100
FROM EMP;
WHERE JOB = 'SALESMAN';

-- 전 사원의 근무일 가져온다.
-- 현재 날짜에서 입사일 빼면 됨
SELECT TRUNC(SYSDATE - HIREDATE)
FROM EMP; -- 소수점까지 나옴

-- 반올림
SELECT SYSDATE AS "ABC"
	, ROUND(SYSDATE, 'CC') AS "년도두자리" -- 년도 두자리 기준 반올림
	, ROUND(SYSDATE, 'YYYY') AS "월기준" -- 현재 월기준으로 반올림 년도 다음자리인 월 기준
	, ROUND(SYSDATE, 'DDDD') AS "시기준" -- 현재 시기준 반올림
	, ROUND(SYSDATE, 'HH') AS "분기준" -- 현재 분기준 반올림
	, ROUND(SYSDATE, 'MM') AS "일기준" -- 일기준 반올림
	, ROUND(SYSDATE, 'DAY') AS "주기준"
	, ROUND(SYSDATE, 'MI') AS "초기준"
FROM DUAL;

-- 각 사원의 입사일을 월 기준으로 반올림
SELECT HIREDATE, ROUND(HIREDATE, 'YYYY')
FROM EMP;

-- 버림
SELECT SYSDATE 
	, TRUNC(SYSDATE, 'CC') AS "년도두자리",
	, TRUNC(SYSDATE, 'YYYY') AS "월"
	, TRUNC(SYSDATE, 'DDDD') AS "시"
	, TRUNC(SYSDATE, 'HH') AS "분"
	, TRUNC(SYSDATE, 'MM') AS "일"
	, TRUNC(SYSDATE, 'DAY') AS "주"
	, TRUNC(SYSDATE, 'MI') AS "초"
FROM DUAL;

-- 1981년에 입사한 사원들의 사원번호, 급여, 입사일을 가져온다.
SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE HIREDATE >= '1981/01/01' AND HIREDATE <= '1981/12/31';

SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1981/01/01' AND '1981/12/31';

SELECT EMPNO, ENAME, SAL, HIREDATE
FROM EMP
WHERE TRUNC(HIREDATE, 'YYYY') = '1981/01/01';

-- 두 날짜 사이의 일수를 구한다.
SELECT SYSDATE - HIREDATE
FROM EMP;

-- 모든 사원이 근무한 개월 수 구하기
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))
FROM EMP; -- 일월일 다 계산 소수점 나옴

-- 개월수를 더한다.
SELECT SYSDATE + 100, ADD_MONTHS(SYSDATE, 100) FROM DUAL;

-- 각 사원들의 입사일 후 100개월 되는 날짜를 구한다.
SELECT HIREDATE, ADD_MONTHS(HIREDATE, 100)
FROM EMP;

-- 지정된 날짜를 기준으로 지정된 요일이 몇일인지...
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일') FROM DUAL; -- 다음 월요일이 몇일인지

-- 지정된 날짜의 월의 마지막 날짜 구하기
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

-- TO_CHAR : 오라클 -> 프로그램 날짜 문자열로 변경
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS AM') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY년 MM월 DD일 HH시 MI분 SS초 AM') FROM DUAL;
-- 오류 남 한글은 안먹힌다고 함

-- TO_DATE : 프로그램 -> 오라클
SELECT TO_DATE('2018-03-20 01:58:20 오후', 'YYYY-MM-DD HH:MI:SS AM') FROM DUAL;

-- 사원들의 입사일을 다음과 같은 양식으로 가져온다
-- 1900-10-10

SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY-MM-DD') FROM EMP;

-- DECODE
-- 각 사원의 부서 이름을 가져온다.
-- 10 : 인사과, 20 : 개발부, 30 : 경원지원팀, 40 : 생산부
SELECT EMPNO, ENAME
	, DECODE(DEPTNO, 10, '인사과', 
					20, '개발부', 
					30, '경원지원팀', 
					40, '생산부')
FROM EMP;

-- 직급에 따라 인상된 급여액을 가져온다.
-- CLERK : 10%
-- SALESMAN : 15%
-- PRESIDENT : 200%
-- MANAGER : 5%
-- ANALYST : 20%

SELECT EMPNO, ENAME, JOB
	, DECODE(JOB, 'CLERK', SAL * 1.1,
					'SALSEMAN', SAL * 1.15,
					'PRESIDENT', SAL * 3,
					'MANAGER', SAL * 1.05,
					'ANALYST', SAL * 1.2)
FROM EMP;

-- CASE

-- 급여액 별 등급을 가져온다.
-- 1000 미만 : C등급
-- 1000 이상 2000미만 : B등급
-- 2000 이상 : A등급
SELECT EMPNO, ENAME,
	CASE WHEN SAL < 1000 THEN 'C등급'
		WHEN SAL >= 1000 AND SAL < 2000 THEN 'B등급'
		WHEN SAL >= 2000 THEN 'A등급'
	END
FROM EMP;

-- 직원들의 급여를 다음과 같이 인상한다.
-- 1000 이하 : 100%
-- 1000 초과 2000 미만 : 50%
-- 2000 이상 : 200%
SELECT EMPNO, ENAME,
	CASE WHEN SAL <= 1000 THEN SAL * 2;
		WHEN SAL >= 1000 AND SAL < 2000 THEN SAL * 0.5
		WHEN SAL >= 2000 THEN SAL * 3
	END
FROM EMP;