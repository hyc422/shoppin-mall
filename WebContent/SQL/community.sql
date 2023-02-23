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
	NICKNAME VARCHAR2(30) NOT NULL,			-- 작성자 (nickName)
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

-- REVIEW COMMENTS TABLE
CREATE TABLE REVIEWCOMMENTS
(
	IDX NUMBER(10) NOT NULL,				-- 기본키
	MREF NUMBER(10) NOT NULL,				-- COMMUNITY 테이블의 IDX
	NICKNAME VARCHAR2(50) NOT NULL,			-- 작성자 (nickName)
	CONTENT VARCHAR2(1000) NOT NULL,		-- 댓글 내용
	CREATEDAT DATE DEFAULT SYSDATE,			-- 작성날짜와 시간 기본값
	IP VARCHAR2(15) DEFAULT '127.0.0.1',	-- 작성자 IP
	PRIMARY KEY(IDX)
);


CREATE SEQUENCE REVIEWCOMMENTS_IDX_SEQ;

-- QNA COMMENTS TABLE
CREATE TABLE QNACOMMENTS
(
	IDX NUMBER(10) NOT NULL,				-- 기본키
	MREF NUMBER(10) NOT NULL,				-- COMMUNITY 테이블의 IDX
	NICKNAME VARCHAR2(50) NOT NULL,			-- 작성자 (nickName)
	CONTENT VARCHAR2(1000) NOT NULL,		-- 댓글 내용
	CREATEDAT DATE DEFAULT SYSDATE,			-- 작성날짜와 시간 기본값
	IP VARCHAR2(15) DEFAULT '127.0.0.1',	-- 작성자 IP
	PRIMARY KEY(IDX)
);

CREATE SEQUENCE QNACOMMENTS_IDX_SEQ;

-- ANNOUNCEMENT TABLE 예시
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

-- REVIEW TABLE 예시
INSERT INTO REVIEW (idx,productnum,productname,filename, nickname,title,content,point)
VALUES (REVIEW_idx_seq.nextval, 1,'단감명작','gam.png','NYR','단감명작 후기','담가버리고 싶은맛',4);
INSERT INTO REVIEW (idx,productnum,productname,filename, nickname,title,content,point)
VALUES (REVIEW_idx_seq.nextval, 13,'애플리즈 금과명주세트 40도 750ml','애플리즈 금과명주세트 40도 750ml49.png','LDH','애플리즈 ','너무 독해요',2);
INSERT INTO REVIEW (idx,productnum,productname,filename, nickname,title,content,point)
VALUES (REVIEW_idx_seq.nextval, 19,'궁중술 왕주 700ml 40도 민속주왕주','궁중술 왕주 700ml 40도 민속주왕주35.png','CGH','왕주 후기','이게 왕이 먹던 술인가',5);
INSERT INTO REVIEW (idx,productnum,productname,filename, nickname,title,content,point)
VALUES (REVIEW_idx_seq.nextval, 8,'연꽃 담은 술 8도 850ml','연꽃 담은 술 8도 850ml12.png','CJW','연꽃술','연꽃향이 나요',3);
INSERT INTO REVIEW (idx,productnum,productname,filename, nickname,title,content,point)
VALUES (REVIEW_idx_seq.nextval, 16,'양반안동소주 23년산 로얄안동소주 45도 800ml','양반안동소주 23년산 로얄안동소주 45도 800ml145.png','KSH','안동소주','소주는 안동소주',4);
INSERT INTO REVIEW (idx,productnum,productname,filename, nickname,title,content,point)
VALUES (REVIEW_idx_seq.nextval, 21,'엄청주 360ml','엄청주 360ml10.png','HYC','엄청주 후기','구아악',1);

-- REVIEW COMMENTS TABLE 예시
INSERT INTO REVIEWCOMMENTS (idx, mref, nickName, content)
VALUES (REVIEWCOMMENTS_idx_seq.nextval,4,'LDH','연꽃향이 무슨향이죠?');
INSERT INTO REVIEWCOMMENTS (idx, mref, nickName, content)
VALUES (REVIEWCOMMENTS_idx_seq.nextval,1,'NYR','정말 맛있어요');
INSERT INTO REVIEWCOMMENTS (idx, mref, nickName, content)
VALUES (REVIEWCOMMENTS_idx_seq.nextval,6,'KSH','무슨 뜻?');

-- QNA TABLE 예시
INSERT INTO QNA (idx,productnum,productname,filename, nickname,title,password,content)
VALUES (QNA_idx_seq.nextval,21,'엄청주 360ml','엄청주 360ml10.png','HYC','엄청주 문의',1111,'구아악');
INSERT INTO QNA (idx,productnum,productname,filename, nickname,title,password,content)
VALUES (QNA_idx_seq.nextval,21,'엄청주 360ml','엄청주 360ml10.png','CGH','궁중술 문의', null,'배송 얼마나 걸리나요?');
INSERT INTO QNA (idx,productnum,productname,filename, nickname,title,password,content)
VALUES (QNA_idx_seq.nextval,null,null,null,'LDH','애플리즈', 1234,'대량 구매시 할인 가능?');

-- QNA COMMENTS TABLE 예시
INSERT INTO QNACOMMENTS (idx, mref, nickName, content)
VALUES (QNACOMMENTS_idx_seq.nextval,1,'admin','문의 내용을 제대로 입력해주세요');
INSERT INTO QNACOMMENTS (idx, mref, nickName, content)
VALUES (QNACOMMENTS_idx_seq.nextval,2,'admin','오래 걸려요');
INSERT INTO QNACOMMENTS (idx, mref, nickName, content)
VALUES (QNACOMMENTS_idx_seq.nextval,3,'admin','불가능');