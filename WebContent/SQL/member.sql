-- js_member TABLE
CREATE TABLE js_member
(
   idx NUMBER(10),        			 --회원 번호
   id varchar2(20) NOT NULL,         --회원 id
   password varchar2(20) NOT NULL,   --회원 password
   name varchar2(20) NOT NULL,       --회원 이름
   nickname varchar2(30) NOT NULL,   --회원 별명
   email varchar2(20),               --회원 이메일
   phone varchar2(20),               --회원 전화번호
   c_code varchar2(20)NOT NULL,      --회원 우편번호
   address varchar2(100)NOT NULL,    --회원 주소
   birth varchar2(20)NOT NULL,		 --회원 생일
   admin varchar2(1) DEFAULT 'n'	 --관리자 여부
);

CREATE SEQUENCE member_idx_seq;

-- js_member TABLE 예시
INSERT INTO js_member (idx, id, password, name, nickname, email, phone, c_code, address, birth)
VALUES (member_idx_seq.nextval,'admin','1234','admin','admin','admin@admin.com','010-0000-0000','000-000','00000 경기 서울시 서울구 서울로 00번지','2022-12-31');
INSERT INTO js_member (idx, id, password, name, nickname, email, phone, c_code, address, birth)
VALUES (member_idx_seq.nextval,'LDH111','1234','이동해','LDH','LDH111@naver.com','010-1111-1111','111-111','11111 경기 서울시 종로구 종로 11번지','2022-12-31');
INSERT INTO js_member (idx, id, password, name, nickname, email, phone, c_code, address, birth)
VALUES (member_idx_seq.nextval,'CJW222','1234','최재우','CJW','CJW222@naver.com','010-2222-2222','222-222','22222 경기 서울시 역삼구 역삼로 22번지','2022-12-31');
INSERT INTO js_member (idx, id, password, name, nickname, email, phone, c_code, address, birth)
VALUES (member_idx_seq.nextval,'NYR333','1234','남유리','NYR','NYR333@naver.com','010-3333-3333','333-333','33333 경기 서울시 송파구 송파로 33번지','2022-12-31');
INSERT INTO js_member (idx, id, password, name, nickname, email, phone, c_code, address, birth)
VALUES (member_idx_seq.nextval,'KSH444','1234','김상훈','KSH','KSH444@naver.com','010-4444-4444','444-444','44444 경기 서울시 판교구 판교로 44번지','2022-12-31');
INSERT INTO js_member (idx, id, password, name, nickname, email, phone, c_code, address, birth)
VALUES (member_idx_seq.nextval,'CGH555','1234','조건희','CGH','CGH555@naver.com','010-5555-5555','555-555','55555 경기 서울시 강남구 강남로 55번지','2022-12-31');
INSERT INTO js_member (idx, id, password, name, nickname, email, phone, c_code, address, birth)
VALUES (member_idx_seq.nextval,'HYC666','1234','홍용치','HYC','HYC666@naver.com','010-6666-6666','666-666','66666 경기 서울시 사당구 사당로 66번지','2022-12-31');

-- admin id 관리자로 변경
UPDATE js_member SET admin = 'y'
WHERE id = 'admin';