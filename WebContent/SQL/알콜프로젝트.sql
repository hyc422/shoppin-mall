CREATE TABLE recommendItem(
	name varchar2(50),
	price number(8),
	coverfile varchar2(100)	
);

DROP TABLE RECOMMENDITEM ;

INSERT INTO RECOMMENDITEM VALUES ('제주감귤과실주',7000,'시트러스 혼디주 12도 330ml 제주감귤과실주.jpg');
INSERT INTO RECOMMENDITEM VALUES (?,?,?);

SELECT * FROM RECOMMENDITEM ;

DELETE FROM RECOMMENDITEM 
WHERE name = '술송주';

UPDATE RECOMMENDITEM 
SET NAME = '제주감귤과실주주',PRICE = 77000
WHERE COVERFILE = '시트러스 혼디주 12도 330ml 제주감귤과실주.jpg';

UPDATE RECOMMENDITEM
SET NAME=?, PRICE=?
WHERE COVERFILE = ?;


CREATE TABLE acsearch(
category varchar2(100),
searchname varchar2(100),
price number(7)
);

INSERT INTO ACSEARCH values('소주','안동소주',70000);
INSERT INTO ACSEARCH values('맥주','카스',1500);
INSERT INTO ACSEARCH values('소주','참이슬',4000);
INSERT INTO ACSEARCH values('와인','레드와인',40000);
INSERT INTO ACSEARCH values('와인','화이트와인',45000);
INSERT INTO ACSEARCH values('소주','북경소주',120000);
INSERT INTO ACSEARCH values('맥주','화이트',2000);
INSERT INTO ACSEARCH values('맥주','조은맥주',3500);
INSERT INTO ACSEARCH values('맥주','맥주필링',3500);
INSERT INTO ACSEARCH values('양주','블랙잭',135000);
INSERT INTO ACSEARCH values('양주','양주온리원',180000);
INSERT INTO ACSEARCH values('양주','블루양주',120000);
INSERT INTO ACSEARCH values('소주','블랙소주',5500);
INSERT INTO ACSEARCH values('소주','소주나인',8500);

SELECT * FROM ACSEARCH a ;


--검색창 밸류 %@@%
SELECT CATEGORY, SEARCHNAME, PRICE FROM ACSEARCH
WHERE SEARCHNAME like '%맥주%'
ORDER BY SEARCHNAME asc;





--카테고리별
SELECT * FROM ACSEARCH 
WHERE CATEGORY = '와인';

--검색개수 보류
SELECT COUNT(*)  FROM ACSEARCH
WHERE SEARCHNAME LIKE '%맥주%';

--가격으로 검색
SELECT * FROM ACSEARCH
WHERE price BETWEEN 10000 AND 15000;

--상품명으로 검색
SELECT * FROM ACSEARCH
ORDER BY SEARCHNAME ASC;

--낮은가격순
SELECT * FROM ACSEARCH
ORDER BY PRICE ASC;

--높은가격순
SELECT * FROM ACSEARCH
ORDER BY PRICE deSC;