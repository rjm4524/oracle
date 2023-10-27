select sysdate from dual;
select sysdate, sysdate+1, add_months(sysdate,1) from dual;
select last_day(sysdate) from dual;
select last_day('20220101') from dual;
-- 날짜에서 년도, 월, 일만 출력
select extract(year from sysdate) from dual;
select extract(month from sysdate) from dual;
select extract(day from sysdate) from dual;
-- 날짜에서 날짜를 빼면 기간의 일을 알 수 있음
select bdate, trunc(sysdate - bdate)||'일' from board;
-- 지난 개월수를 출력
select bdate, trunc(months_between(sysdate,bdate))||'개월' from board;
-- 날짜 -> 문자 형변환, 날짜 포맷 변경
select sysdate from dual;
select to_char(sysdate,'YYYY-MM-DD AM HH:MI:SS') from dual;
select to_char(sysdate,'YYYY"년" MM"월" DD"일" DAY') from dual;
-- 숫자 -> 문자 형변환, 천단위 표시, 원화 표시
-- 9로 자리수 표시를 하면 없을 때는 공백, 0으로 자리수 표시를 하면 없을 때 0으로 출력됨
select 1234500000 from dual;
select to_char(1234500000,'999,999,999,999') from dual; -- 공백
select trim(to_char(1234500000,'999,999,999,999')) from dual; -- trim 공백을 제거
select to_char(1234500000,'000,999,999,999') from dual; -- 0으로 표시
select to_char(1234500000,'L999,999,999,999') from dual; -- 원화 표시 L
select to_char(1234500000,'$999,999,999,999') from dual; -- 미화 표시 $
-- 문자 -> 날짜 형변환, 기존의 날짜로부터 얼마나 지났는지 확인
select '2023-10-01' from dual;
select add_months('2023-10-01',1) from dual;
select sysdate-to_date('2023-10-01','YYYY-MM-DD') from dual;
-- nvl(commision_pct,0)
-- manager_id null값에 'ceo'
select manager_id from employees;
-- manager_id 타입 : number
select nvl(manager_id,0) from employees;
-- 숫자 -> 문자 형변환 'ceo' 글자를 입력
select nvl(to_char(manager_id), 'ceo') from employees;
select manager_id from employees where manager_id is null; -- 혼자 한 것
-- 월급 총금액 - 천단위, $
select sum(salary) from employees;
select to_char(sum(salary),'$999,999,999') from employees;
-- 평균 월급 - 환율 1342.32 곱해서 천단위, \ 표시
select avg(salary) from employees;
select to_char(avg(salary)*1342.32,'L999,999,999,999') from employees;
--월급의 최댓값,최솟값
select max(salary),min(salary) from employees;

select department_id from employees;

--max,min과 같은 그룹함수가 사용될떈 단일 함수를 넣으려면 group by를 사용
select emp_name,max(salary) from employees
where department_id = 50
group by emp_name;

select emp_name,salary from employees
where salary = (select max(salary) from employees);

select department_id,max(salary),min(salary) from employees
group by department_id;

--count(*) - null 카운트
select count(*) from employees;--107

select count(manager_id) from employees;--106 (null count x)

select id from board;
--대소문자 구분없이 검색하는 법 
--전부 소문자로 변환 후 검색
select emp_name from employees
where lower(emp_name) like('%d%');
--전부 대문자로 변환 후 검색
select emp_name from employees
where upper(emp_name) like('%D%');
--공백을 채우는 함수 LPAD,RPAD
--to_char와 비슷
select to_char(12,'000,000') from dual; --천단위 표시 가능
--왼쪽 빈공백 채우기 
select LPAD(12,6,'0') from dual;--천 단위 X
--특정 부분부터 특정 부분까지 떄오기 substr(테이블,a,b) 테이블의 a부터 b개만큼 떄온다.
select id from board;
select id,substr(id,3,3) from board;
select substr(to_char(bdate,'YYYYMMDD'),5,2) from board;
--특정 문자가 몇번째 자리에 있는지 확인하는 함수. 
--instr(테이블,'문자') 테이블에 문자가 몇번쨰에 있는지 출력가능
select id,instr(id,'ff') from board
where instr(id,'ff') !='0'
;
--특정문자의 길이를 알려주는 함수 
select length(id) from board;

--hire_date,employees
--substr월을 출력

select hire_date from employees;

select substr(to_char(hire_date,'YYMMDD'),3,2) from employees;
--이름에서 3번쨰 부터 3개와 월을 함께 출력하시오.
--aaa06
select * from employees;

select emp_name,hire_date from employees;

select substr(emp_name,3,3)||substr(hire_date,4,2) from employees;

--해당 달의 마지막 날짜 확인 last_day
select hire_date,last_day(hire_date) from employees;
--테이블 생성 및 모든 데이터 가져오기 
create table fboard as select * from board;

select bhit,bhit+100 from board;

update board
set bhit = bhit+100;

select bno,bhit from board;

rollback;

update board
set bhit = bhit + 1
where bno= 32
;

select bno,bhit from fboard;

select bno,bhit from board;


update fboard a
set bhit = (select bhit from board b where a.bno = b.bno)
;
--rollback;

desc fboard;

alter table fboard
add userid varchar2(30)
;

select userid from fboard;

--id 1번째부터 3, bdate 월을 합친값을 userid에 입력하시오.
select * from fboard;
select substr(id,1,3)||substr(bdate,4,2) from fboard;

update fboard a
set userid = (
select substr(id,1,3)||substr(bdate,4,2) from fboard b
where a.bno=b.bno);

select userid,id from fboard;

desc member;

create table mem(
id varchar2(30) primary key, -- not null, unique 
pw varchar2(30) not null, --null값 안됨
name varchar2(30) not null,
phone varchar2(13), -- 010-1111-1111
gender varchar2(1) check(gender in ('M','F','m','f')), -- M,F만 가능
hobby varchar2(80),
mlevel number(2) check(mlevel between 1 and 10), -- 1~10까지만 가능
mdate date default sysdate --입력하지않으면 현재날짜 등록
);

insert into mem values (
'aaa','1111','홍길동','010-1111-1111','M','game','1',sysdate);

insert into mem(id,pw,name) values (
'bbb','1111','유관순');

insert into mem(id,pw,name,gender) values (
'ccc','1111','이순신','M');

select * from mem;

commit;

select * from member;

desc member;

--오라클 switch,if 조건문
--decode같은 값인 경우만 비교 가능함.

select * from employees;

select department_id from employees;

select department_id,department_name from departments;

--10번 총무기확 20번 마케팅 30번 구매/생산부 40번 인사부 50번 배송부
select department_id from employees;

select department_id,
decode(department_id,
10,'총무기획부',
20,'마케팅',
30,'구매/생산부',
40,'인사부',
50,'배송부'
)
from employees;
--테이블 조인
select a.department_id,department_name from departments a, employees b
where a.department_id = b.department_id;


--학생성적 테이블
create table sscore(
sno number(4) primary key, --점수에 부여되는 순번
sid varchar2(20),
total number(3) default 0
);

insert into sscore values(
sscore_seq.nextval,'a1',50
);
insert into sscore values(
sscore_seq.nextval,'a2',90
);
insert into sscore values(
sscore_seq.nextval,'a3',80
);
insert into sscore values(
sscore_seq.nextval,'a4',10
);
insert into sscore values(
sscore_seq.nextval,'a5',100
);
insert into sscore values(
sscore_seq.nextval,'a6',70
);
insert into sscore values(
sscore_seq.nextval,'a7',60
);
insert into sscore values(
sscore_seq.nextval,'a8',30
);
insert into sscore values(
sscore_seq.nextval,'a9',20
);
insert into sscore values(
sscore_seq.nextval,'a10',80
);

select * from sscore;

select sno,sid,total,decode(total,
10,'F',
20,'F',
30,'F',
40,'F',
50,'F',
60,'F',
70,'D',
80,'B',
90,'A',
100,'A'
)as hak from sscore;

select total,avg from stuscore;

select avg,
case 
when avg >= 90 then 'A'
when avg >=80 then 'B'
when avg >=70 then 'C'
when avg >=60 then 'D'
when avg <60 then 'F'
end as hak
from stuscore;

--월급이 3000 $ 이상은 E 등급 4000$ ~ 5000$는 D 6000~8000 C 9000~10000B 10000이상 A

select salary,
case
when salary>10000 then 'A'
when salary>=8001 then'B'
when salary>=5001 then'C'
when salary>=3000 then'D'
when salary<3000 then'E'
end 
from employees;

alter table emp2 
add rank varchar(10);

update emp2 a
set rank = (
select 
case
when salary>10000 then 'A'
when salary>=8001 then'B'
when salary>=5001 then'C'
when salary>=3000 then'D'
when salary<3000 then'E'
end rank2
from emp2 b where a.employee_id = b.employee_id
);

select salary,rank from emp2;

select * from emp2;


select emp_name,salary from employees
where salary <= (select avg(salary) from employees);

select bhit,bhit+100 from fboard;

update fboard
set bhit = bhit+100;

commit;

select bno,bhit from fboard;

select bno,bhit from board;
--테이블 생성 및 복사 (부모 board)
create table fboard as select * from board;


--계획
drop table fboard;

select a.bhit,b.bhit from fboard a, board b
where a.bno=b.bno
;

--수정 코드 
update fboard a 
set bhit = (
select bhit from board b
where a.bno=b.bno 
)
;


create table nboard (
bno number(4) primary key,
id varchar2(20),
btitle varchar2(1000) not null,
bcontent varchar2(4000),
bdate date,
constraint fk_nboard foreign key(id) references member(id)
--외래키 등록 이름 fk_nboard
);
select * from member;
select * from nboard;
--drop table nboard;

insert into nboard values (
nboard_seq.nextval,'aaa','제목4','내용4',sysdate
);

--commit;

select * from member;
--자식이있기에 삭제 불가
delete member 
where id = 'ddd';
--외래키로 등록, primary key 테이블 데이터가 삭제되면 외래키에 있는 자식데이터도 모두 삭제
alter table nboard
add constraint fk_nboard foreign key(id) REFERENCES member(id)
on delete cascade;
--primary key 테이블의 데이터가 삭제되면 외래키에 있는 데이터의 id만 null값으로 변경
alter table nboard
add constraint fk_nboard_id foreign key(id) references member(id)
on delete set null
;

alter table nboard 
drop constraint fk_nboard;

select * from board
order by bno
;

--부모격인 member 의 aaa id를 삭제하니 자식인 
-- nboard의 aaa아이디도 삭제됨.
delete member 
where id = 'aaa';

select * from member;


select * from employees;


--having(그룹함수를 대상으로 사용하는 where 같은것)
select department_id,count(commission_pct) 
from employees
group by department_id 
having count(commission_pct) !=0
;

select department_id,count(commission_pct) 
from employees
where commission_pct is not null
group by department_id 
;


--부서별로 평균이 전체평균 이상인 부서만 출력하시오./
--추가 null,소수점 삭제 
select department_id,floor(avg(salary)) from employees
where department_id is not null
group by department_id
having avg(salary)>(select avg(salary) from employees)
;

select department_id,floor(avg(salary)) from employees
group by department_id

;





