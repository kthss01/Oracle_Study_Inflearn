-- 숫자 함수 ------------------------------------------------------------

-- dual 가상의 테이블
SELECT 10 + 10 FROM DUAL;

-- 절대값 구하기
SELECT -10 FROM DUAL;
SELECT -10, ABS(-10) FROM DUAL;

-- 전직원의 급여를 2000 삭감하고 삭감한 급여액의 절대값을 구한다.
SELECT SAL, SAL - 2000, ABS(SAL - 2000) FROM EMP;

-- 소수점 이하 버림
SELECT 12.3456, FLOOR(12.3456) FROM DUAL;

-- 급여가 1500 이상인 사원의 급여를 15% 삭감한다. 단 소수점 이하는 버린다.
SELECT SAL, SAL * 0.85, FLOOR(SAL * 0.85)
FROM EMP
WHERE SAL >= 1500;

-- 반올림

SELECT 12.3456, ROUND(12.3456) FROM DUAL; -- 12
SELECT 12.8888, ROUND(12.8888) FROM DUAL; -- 13

SELECT 888.8888, ROUND(888.8888), ROUND(888.8888, 2), ROUND(888.8888, -2) FROM DUAL;
-- 0 소수점 1번쨰 자리

-- 급여가 2천 이하인 사원들의 급여를 20%씩 인상한다. 단 10의 자리를 기준으로 반올림한다.
SELECT SAL, ROUND(SAL * 1.2, -2)
FROM EMP
WHERE SAL <= 2000;

-- 소수점 이하 버림 (자릿수 정함)
SELECT 1112.3456, TRUNC(1112.3456), TRUNC(1112.3456, 2), TRUNC(1112.3456, -2) FROM DUAL;

-- 전 직원의 급여를 10자리 이하를 삭감한다.
SELECT SAL, TRUNC(SAL, -2)
FROM EMP;

-- 나머지 구하기
SELECT MOD(10, 3), MOD(10, 4) FROM DUAL;

-- 문자열 함수 --------------------------------------------------------------
-- 대문자 -> 소문자
SELECT 'ABcdEF', LOWER('ABcdEF') FROM DUAL;

-- 사원들의 이름을 소문자로 가져온다.
SELECT ENAME, LOWER(ENAME) FROM EMP;

-- 소문자 -> 대문자
SELECT 'ABcdEF', UPPER('ABcdEF') FROM DUAL;

-- 사원들의 이름 가져오기 대문자 -> 소문자 -> 대문자
SELECT ENAME, LOWER(name), UPPER(LOWER(ENAME)) FROM DUAL;

-- 첫 글자만 대문자로, 나머지는 소문자로
SELECT 'aBCDEF', INITCAP('aBCDEF') FROM DUAL;

-- 사원의 이름을 첫 글자는 대문자로 나머지는 소문자로 가져온다.
SELECT ENAME, INITCAP(ENAME) FROM EMP;

-- 문자열 연결
SELECT CONCAT('kkk', CONCAT('abc', 'def')) FROM DUAL;

-- 사원들의 이름과 직무를 다음과 같이 가져온다.
-- 사원의 이름은 000 이고, 직무는 000입니다.
SELECT CONCAT(CONAT(CONCAT(CONCAT('사원의 이름은 ', ENAME), ' 이고, 직무는 '), JOB), '입니다') 
FROM EMP;

SELECT '사원들의 이름은 ' || ENAM<E || '이고 직무는 ' || JOB || '입니다.' FROM EMP;

-- 문자열의 길이
SELECT LENGTH('abcd'), LENGTHB('abcd') FROM DUAL; -- 4 4 
SELECT LENGTH('안녕하세요'), LENGTHB('안녕하세요') FROM DUAL; -- 5 10

-- 문자열 잘라내기
SELECT SUBSTR('abcd', 3), SUBSTRB('abcd', 3) FROM DUAL; -- cd cd

SELECT SUBSTR('안녕하세요', 3), SUBSTRB('안녕하세요', 3) FROM DUAL; 
-- 하세요 녕하세요

SELECT SUBSTR('abcdefghi', 3, 4), SUBSTR('동해물과 백두산이', 3, 4) FROM DUAL;
-- cdef 물과 백

-- 문자열 찾기
SELECT INSTR('abcdabcdabcd', 'bc'), INSTR('abcdabcdabcd', 'bc', 3) FROM DUAL;
-- 2 6 (3번째 bc)
SELECT INSTR('abcdabcdabcd', 'bc', 3, 2) FROM DUAL;
-- 10 (2번째 bc)

SELECT INSTR('abcdefg', 'aaa') FROM DUAL; -- 0 없는거 0

-- 사원의 이름 중에 A라는 글자가 두번째 이후에 나타나는 사원의 이름을 가져온다.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_A%'; -- 2번째 글자가 A

SELECT ENAME
FROM EMP
WHERE INSTR(ENAME, 'A') > 1; -- 2번째 이후에

-- 특정 문자열로 채우기
SELECT '문자열', LPAD('문자열', 20) FROM DUAL;
SELECT '문자열', LPAD('문자열', 20, '_') FROM DUAL;
-- 왼쪽에 20 빈칸 확보하고 채워짐
SELECT RPAD('문자열', 20) FROM DUAL;
SELECT RPAD('문자열', 20, '_') FROM DUAL;

-- 공백 제거
SELECT '     문자열     ' FROM DUAL;

SELECT LTRIM('     문자열     ') FROM DUAL; -- 좌측 공백 제거
SELECT RTRIM('     문자열     ') FROM DUAL; -- 우측 공백 제거
SELECT TRIM('     문자열     ') FROM DUAL; -- 좌우 공백 제거

-- 문자열 변경
SELECT 'abcdefg', REPLACE('abcdefg', 'abc', 'kkkkkkk') FROM DUAL;
