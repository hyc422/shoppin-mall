--실시간 검색
CREATE TABLE bestsearch(
	productName VARCHAR2(2000),
	productPrice NUMBER(30),
	fileName VARCHAR2(2000)
);

--실시간 검색에 넣을 상품
INSERT INTO BESTSEARCH values (?,?,?);

--실시간 검색 조회
SELECT * FROM BESTSEARCH;

--실시간 검색 삭제
DELETE FROM  BESTSEARCH 	
WHERE productname = ?