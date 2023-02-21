CREATE TABLE js_member(
   idx NUMBER(10),         --회원 번호
   id varchar2(20) NOT NULL,         --회원 id
   password varchar2(20) NOT NULL,      --회원 password
   name varchar2(20) NOT NULL,         --회원 이름
   nickname varchar2(30) NOT NULL,      --회원 별명
   email varchar2(20),               --회원 이메일
   phone varchar2(20),               --회원 전화번호
   c_code varchar2(20)NOT NULL,      --회원 우편번호
   address varchar2(20)NOT NULL,      --회원 주소
   birth varchar2(20)NOT null
   );
   
DROP TABLE js_member; 
CREATE SEQUENCE member_idx_seq;
DROP SEQUENCE MEMBER_idx_seq;

INSERT INTO js_member VALUES 
(member_idx_seq.nextval,'admin','1234','관리자','관리자','admin@admin.com'
,'010-1111-2222','103-242','나어디사냐','2022-12-31');