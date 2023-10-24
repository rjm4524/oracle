--drop table customeer; -- 테이블 삭제


create table member ( --테이블 추가 
id varchar2(20),
pw varchar2(20),
name varchar2(30),
gender varchar(1),
age number,
brith varchar2(13),
phone varchar2(13),
rdate date

);

--drop table member;

create table stuscore (

stuNum number(4), --9999까지가능
name varchar2(30),
kor number(3), --999까지 가능 괄호 안 숫자는 자릿수
eng number(3),
math number(3),
total number(3),
avg number(5,2), -- 5자리 중 소수점은 2자리 까지 가능.
rank number(10)
);

insert into stuscore values(
1,'홍길동',100,100,100,100+100+100,(100+100+100)/3,0
);
insert into stuscore values(
2,'유관순',100,100,99,100+100+99,(100+100+99)/3,0
);

insert into stuscore(stunum,name,rank) values(
3,'이순신',0
);
--수정--
update stuscore set kor=100,eng=100,math=100,total=100+100+100,avg=(100+100+100)/3;

select * from stuscore;

rollback;
select * from stuscore;

update stuscore set kor=100,eng=100,math=100,total=100+100+100,avg=(100+100+100)/3
where stunum=3;
select * from stuscore;





--delete stuscore where stunum=2; -- 삭제

select * from stuscore;
rollback
commit;

select * from tab;

desc stuscore; --현재 테이블의 컬럼과 컬럼타입을 보여줌.

select * from tab;

insert into member values (
'aaa','1111','홍길동','M','20','1990-01-01','010-1111-1111',sysdate
);

select * from member;

commit;





