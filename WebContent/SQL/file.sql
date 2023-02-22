CREATE TABLE TBL_FILE(
	fileName VARCHAR2(2000) PRIMARY KEY,
	productNum NUMBER(30),
	fileNameOriginal VARCHAR2(2000),
	CONSTRAINT FK_FILES_PRODUCT FOREIGN KEY(productNum)
	REFERENCES TBL_PRODUCT(productNum) ON DELETE CASCADE
);

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('gam.png', 1, 'gamP.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('goldenpeach.png', 2, 'goldenpeachP.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('sweetMAMA.png', 3, 'sweetMAMAP.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('mazue.png', 4, 'mazueP.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('벤로막10년.png', 5, '벤로막10년상세.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('에반 윌리엄스 블랙.png', 6, '에반 윌리엄스 블랙상세.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('하이랜드 파크 18년 700mL.png', 7, '하이랜드 파크 18년 700mL상세.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('연꽃 담은 술 8도 850ml12.png', 8, '연꽃 담은 술 8도 850ml12PP.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('이천미 예술 누룩막걸리 14도 750ml 12.png', 9, '이천미 예술 누룩막걸리 14도 750ml 12PP.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('이화백주 940ml_10병입_12.png', 10, '이화백주 940ml_10병입_12PP.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('지란지교 프리미엄 약주 15도 375ml25.png', 11, '지란지교 프리미엄 약주 15도 375ml25PP.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('오미나라 전통주 고운달 도자기숙성 52도 500ml360.png', 12, '오미나라 전통주 고운달 도자기숙성 52도 500ml360PP.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('애플리즈 금과명주세트 40도 750ml49.png', 13, '애플리즈 금과명주세트 40도 750ml49PP.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('KY올드 마르퀴스XO세트120.png', 14, 'KY올드 마르퀴스XO세트120PP.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('식품명인 문배주양조원 명작 1000 40%125.png', 15, '식품명인 문배주양조원 명작 1000 40%125PP.png');
INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('양반안동소주 23년산 로얄안동소주 45도 800ml145.png', 16, '양반안동소주 23년산 로얄안동소주 45도 800ml145PP.png');
INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('양반안동소주 24년산 로얄 45도 600ml108.png', 17, '양반안동소주 24년산 로얄 45도 600ml108PP.png');
INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('제주샘주 고소리술 도자기 40도 500ml80.png', 18, '제주샘주 고소리술 도자기 40도 500ml80PP.png');

INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('궁중술 왕주 700ml 40도 민속주왕주35.png', 19, '궁중술 왕주 700ml 40도 민속주왕주35PP.png');
INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('양촌양조 양촌 우렁이쌀 청주 14도 500ml16.png', 20, '양촌양조 양촌 우렁이쌀 청주 14도 500ml16PP.png');
INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('엄청주 360ml10.png', 21, '엄청주 360ml10PP.png');
INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('우포의 아침 조선 주조사 14도 300ml4.png', 22, '우포의 아침 조선 주조사 14도 300ml4PP.png');
INSERT INTO TBL_FILE
(FILENAME, PRODUCTNUM, FILENAMEORIGINAL)
VALUES('초가 한청 15도 700ml 20.png', 23, '초가 한청 15도 700ml 20PP.png');