--검색은 xml에 쓸때랑 SQL에 쓸때랑 like조건문이 다릅니다. ->Product.xml참고
--검색은 Product테이블을 사용했기때문에 테이블을 따로만들지않았습니다.

--TOP검색
SELECT * FROM TBL_PRODUCT tp 
JOIN TBL_FILE tf 
ON tp.PRODUCTNUM = tf.PRODUCTNUM 
WHERE productname like '%청주%' or productcategories = '청주'
ORDER BY productname ASC;

--페이징 상품명 조회
SELECT * FROM 
(SELECT rownum r ,f.* FROM
(SELECT * FROM 
TBL_PRODUCT tp
JOIN TBL_FILE tf
ON tp.PRODUCTNUM = tf.PRODUCTNUM
WHERE productname LIKE '%청주%' or productcategories = '청주'
ORDER BY PRODUCTNAME ASC) f)
WHERE r BETWEEN 1 AND 3;

--페이징 가격높은순 조회
SELECT * FROM 
(SELECT rownum r ,f.* FROM
(SELECT * FROM 
TBL_PRODUCT tp
JOIN TBL_FILE tf
ON tp.PRODUCTNUM = tf.PRODUCTNUM
WHERE productname LIKE '%청주%' or productcategories = '청주'
ORDER BY productprice DESC) f)
WHERE r BETWEEN 1 AND 10;

--페이징 가격낮은순 조회
SELECT * FROM 
(SELECT rownum r ,f.* FROM
(SELECT * FROM 
TBL_PRODUCT tp
JOIN TBL_FILE tf
ON tp.PRODUCTNUM = tf.PRODUCTNUM
WHERE productname LIKE '%청주%' or productcategories = '청주'
ORDER BY productprice ASC) f)
WHERE r BETWEEN 1 AND 3;