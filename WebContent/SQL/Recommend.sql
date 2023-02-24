--추천상품 테이블
CREATE TABLE Recommend(
fileName VARCHAR2(2000),
productPrice NUMBER(30),
productName VARCHAR2(2000)
);

--추천상품 조회
SELECT * FROM recommend
order by PRODUCTNAME;

--추천상품 삭제
DELETE FROM recommend
WHERE PRODUCTNAME = ?;

--추천상품 등록
INSERT INTO RECOMMEND (FILENAME, PRODUCTPRICE, PRODUCTNAME)VALUES(?,?,?);