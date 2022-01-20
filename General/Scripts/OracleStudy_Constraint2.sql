-- 컬럼 레벨
DROP TABLE TEST_TABLE10;

CREATE TABLE TEST_TABLE10(
	DATA1 NUMBER CONSTRAINT TEST_TABLE10_DATA1_PK PRIMARY KEY,
	DATA2 NUMBER NOT NULL CONSTRAINT TEST_TABLE10_DATA2_UK UNIQUE,
	DATA3 NUMBER NOT NULL CONSTRAINT TEST_TABLE10_DATA3_FK
						REFERENCES EMP(EMPNO),
	DATA4 NUMBER NOT NULL CONSTRAINT TEST_TABLE10_DATA4_CK
						CHECK(DATA4 BETWEEN 1 AND 10),
	DATA5 NUMBER NOT NULL CONSTRAINT TEST_TABLE10_DATA5_CK
						CHECK(DATA5 IN(10, 20, 30))
);

-- 테이블 레벨
DROP TABLE TEST_TABLE11;

CREATE TABLE TEST_TABLE11(
	DATA1 NUMBER,
	DATA2 NUMBER NOT NULL,
	DATA3 NUMBER NOT NULL,
	DATA4 NUMBER NOT NULL,
	DATA5 NUMBER NOT NULL,
	
	CONSTRAINT TEST_TABLE11_DATA1_PK PRIMARY KEY(DATA1),
	CONSTRAINT TEST_TABLE11_DATA2_UK UNIQUE(DATA2),
	CONSTRAINT TEST_TABLE11_DATA3_FK FOREIGN KEY(DATA3)
									REFERENCES EMP(EMPNO),
	CONSTRAINT TEST_TABLE11_DATA4_CK CHECK(DATA4 BETWEEN 1 AND 10),
	CONSTRAINT TEST_TABLE11_DATA5_CK CHECK(DATA5 IN(10, 20, 30)
);


-- 복합키
-- 테이블 레벨로만 세팅 가능
DROP TABLE TEST_TABLE12;

CREATE TABLE TEST_TABLE12(
	DATA1 NUMBER,
	DATA2 NUMBER,
	
	CONSTRAINT TEST_TABLE12_COMBO_PK PRIMARY KEY(DATA1, DATA2)
);

INSERT INTO TEST_TABLE12 (DATA1, DATA2)
VALUES (100, 200);

INSERT INTO TEST_TABLE12 (DATA1, DATA2)
VALUES (100, 300);

INSERT INTO TEST_TABLE12 (DATA1, DATA2)
VALUES (400, 200);

SELECT * FROM TEST_TABLE12;

INSERT INTO TEST_TABLE12 (DATA1, DATA2)
VALUES (100, 200); -- 제약조건 위배

INSERT INTO TEST_TABLE12 (DATA1, DATA2)
VALUES (NULL, NULL); -- 제약조건 위배 NULL 허용 x