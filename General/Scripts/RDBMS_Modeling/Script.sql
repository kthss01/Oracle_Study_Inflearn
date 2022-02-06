-- 학생 수강신청 관리
--- 각 학생들은 수학, 영어, 과학, 국사 중 최소한 세 과목을 수강
--- 학생 세 명의 예제를 만들고 이들이 수강 신청한 과목들을 관리

-- 실습
CREATE TABLE TEST_STUDENT (
	STD_NO NUMBER CONSTRAINT TEST_STUDENT_PK PRIMARY KEY,
	MATH NUMBER,
	ENGLISH NUMBER,
	SCIENCE NUMBER,
	KOREAN NUMBER,
	HISTORY NUMBER
);

CREATE SEQUENCE STUDENT_SEQ
START WITH 0
MINVALUE 0;

SELECT STUDENT_SEQ.NEXTVAL FROM DUAL;
SELECT STUDENT_SEQ.CURRVAL FROM DUAL;

INSERT INTO TEST_STUDENT (STD_NO, MATH, ENGLISH, KOREAN)
VALUES (STUDENT_SEQ.NEXTVAL, 80, 70, 60);

INSERT INTO TEST_STUDENT (STD_NO, MATH, ENGLISH, HISTORY)
VALUES (STUDENT_SEQ.NEXTVAL, 100, 50, 40);

INSERT INTO TEST_STUDENT (STD_NO, ENGLISH, SCIENCE, KOREAN)
VALUES (STUDENT_SEQ.NEXTVAL, 100, 90, 100);

SELECT * FROM TEST_STUDENT;

COMMIT;