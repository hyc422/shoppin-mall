-- ANNOUNCEMENT TABLE
CREATE TABLE ANNOUNCEMENT
(
	IDX NUMBER(10) NOT NULL,				-- SEQ
	NICKNAME VARCHAR2(30) NOT NULL,			-- 작성자 (nickname)
	TITLE VARCHAR2(100) NOT NULL,			-- 글제목
	CONTENT VARCHAR2(3000) NOT NULL,		-- 글 내용
	READCOUNT NUMBER(10) DEFAULT '0',		-- 조회수
	CREATEDAT DATE DEFAULT SYSDATE,			-- 작성날짜와 시간 기본값
	IP VARCHAR2(15) DEFAULT '127.0.0.1',	-- 작성자 IP
	PRIMARY KEY(IDX)
);

CREATE SEQUENCE ANNOUNCEMENT_IDX_SEQ;

-- REVIEW TABLE
CREATE TABLE REVIEW
(
	IDX NUMBER(10) NOT NULL,				-- SEQ
	PRODUCTNUM NUMBER(30) NOT NULL,			-- product 번호, 링크용
	PRODUCTNAME VARCHAR2(2000) NOT NULL,	-- product 이름, 웹 표기용
	FILENAME VARCHAR2(2000) NOT NULL,		-- 섬네일 이름, 섬네일 용
	NICKNAME VARCHAR2(30) NOT NULL,			-- 작성자 (nickname)
	TITLE VARCHAR2(100) NOT NULL,			-- 글제목
	CONTENT VARCHAR2(3000) NOT NULL,		-- 글 내용
	READCOUNT NUMBER(10) DEFAULT '0',		-- 조회수
	POINT NUMBER(1) DEFAULT '3',			-- 별점
	CREATEDAT DATE DEFAULT SYSDATE,			-- 작성날짜와 시간 기본값
	IP VARCHAR2(15) DEFAULT '127.0.0.1',	-- 작성자 IP
	COMMENTCOUNT NUMBER(10) DEFAULT '0',	-- 댓글 갯수
	PRIMARY KEY(IDX)
);

CREATE SEQUENCE REVIEW_IDX_SEQ;

-- QNA TABLE
CREATE TABLE QNA
(
	IDX NUMBER(10) NOT NULL,				-- SEQ
	PRODUCTNUM NUMBER(30),					-- product 번호, 링크용
	PRODUCTNAME VARCHAR2(2000),				-- product 이름, 웹 표기용
	FILENAME VARCHAR2(2000),				-- 섬네일 이름, 섬네일 용
	NICKNAME VARCHAR2(30) NOT NULL,			-- 작성자 (nickname)
	TITLE VARCHAR2(100) NOT NULL,			-- 글 제목
	PASSWORD NUMBER(4),						-- 글 비밀번호 숫자 4자리
	CONTENT VARCHAR2(3000) NOT NULL,		-- 글 내용
	READCOUNT NUMBER(10) DEFAULT '0',		-- 조회수
	CREATEDAT DATE DEFAULT SYSDATE,			-- 작성날짜와 시간 기본값
	IP VARCHAR2(15) DEFAULT '127.0.0.1',	-- 작성자 IP
	COMMENTCOUNT NUMBER(10) DEFAULT '0',	-- 댓글 갯수
	PRIMARY KEY(IDX)
);

CREATE SEQUENCE QNA_IDX_SEQ;

INSERT INTO ANNOUNCEMENT (idx,nickname,title,content)
VALUES (ANNOUNCEMENT_idx_seq.nextval, '김모모','공지사항1','오늘 모임 변경안내입니다.');
INSERT INTO ANNOUNCEMENT (idx,nickname,title,content)
VALUES (ANNOUNCEMENT_idx_seq.nextval, '김모모','공지사항2.','오늘 모임 변경안내입니다.');
INSERT INTO ANNOUNCEMENT (idx,nickname,title,content)
VALUES (ANNOUNCEMENT_idx_seq.nextval, '김모모','공지사항3.','오늘 모임 변경안내입니다.');
INSERT INTO ANNOUNCEMENT (idx,nickname,title,content)
VALUES (ANNOUNCEMENT_idx_seq.nextval, '김모모','공지사항4.','오늘 모임 변경안내입니다.');
INSERT INTO ANNOUNCEMENT (idx,nickname,title,content)
VALUES (ANNOUNCEMENT_idx_seq.nextval, '김모모','공지사항5.','오늘 모임 변경안내입니다.');
