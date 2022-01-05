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