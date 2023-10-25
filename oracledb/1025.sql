select * from employees;

select salary,salary+100 from employees;

select sysdate,sysdate+365 from dual; --dual 더미테이블

select 1+3 from dual;
--숫자 문자는 더하면 자동으로 숫자로 변환
select 1+'3' from dual;
--문자는 더하기 안됨
select 1+'a' from dual;
--문자끼리도 더하기 불가
select 'a'+'b' from dual;
--문자를 합치려면 || , concat
select 'a'||'b' from dual;
select concat('a','b') from dual;

select * from employees;

--emp_name(email) 출력해라

--concat 
select concat(emp_name,concat('(',concat(email,')'))) from employees;
--||
select emp_name||'('||email||')' u_nicld from emp2;

select employee_id,emp_name,hire_date from employees order by hire_date asc;

--00/01/01 이후에 입사한 사람을 출력해라
--00/01/24,00-01-01,2000-01-01 모두 같다
select hire_date from emp2
where hire_date >='00/01/01'
order by hire_date asc;


select * from employees
order by salary desc;

select max(salary) from employees;

select * from employees
where salary=24000;

select * from employees
where salary=(select max(salary) from employees);

--부서번호가 80이상인 사람을 출력해라

select * from employees 
where department_id >= 80
order by department_id asc;

select * from employees
where department_id != 80
order by department_id asc;

--월급 6000이상 부서번호는 50인사람을 출력해라

select salary,department_id from emp2
where salary > 6000 and department_id =50 ;

select * from employees
where salary>=2000 and salary <= 3000;

select * from employees
where salary between 2000 and 3000
;
--avg,count,max,min
select avg(salary) from employees
;

select*from employees
where salary<= 6461
order by salary desc
;
--월급이 3000, 5000,6000
select * from employees
where salary =3000 or salary = 5000 or salary = 6000
;
select * from employees
where salary in(3000,5000,6000)
;

select salary,employee_id from employees
where employee_id in(101,151,200) 
;

select employee_id, salary from employees
where employee_id = 101 or employee_id = 151 or employee_id = 200
;

--연봉이 2000미만 3000초과인 사람 
select * from employees
where salary < 2000 or salary >3000
;

select * from employees
where salary not between 2000 and 3000
;

--입사일 00/01/01 ~ 00/12/31 사원을 출력하시오

select * from employees
where hire_date between '00/01/01' and '00/12/31'
;

select * from employees 
where hire_date >= '00/01/01' and hire_date <= '00/12/31'
;


--S로 시작되는 이름을 출력하시오.
select emp_name from employees
where emp_name like 'S%' 
;

--n으로 끝나는 이름을 출력하시오.

select emp_name from employees
where emp_name like '%n'
;

--e가 포함된 이름을 출력하시오
select emp_name from employees
where emp_name like '%e%'
;                   


select * from board;

--bcontent 컬럼faucibus 단어가 들어가있는 글을 출력하시오.

select * from board
where bcontent like '%faucibus%';


--bcontent 컬럼에 ven갯수 
select * from board
where bcontent like '%ven%'
;

--btitle ven 개수
select * from board
where btitle like '%ven%'
;
--btitle 또는 bcontent 컬럼에 ven들어간 게시글을 출력하시오
select btitle,bcontent from board
where btitle like '%ven%' or bcontent like '%ven%'
;

--bcontent n으로 시작면서 4개의 문자단어가 있는  게시글을 출력하시오.

select bcontent from board
where bcontent like '%n___'
;

select emp_name from employees
where emp_name like 'P__%'
;
--이름의 시작이 D인사람 출력 
select emp_name from employees
where emp_name like 'D%'
;
--이름중간에 a가 들어간 사람 출력
select emp_name from employees
where emp_name like '%a%'
;

--두번쨰 글자가 a인 사원이름을 출력하시오.

select emp_name from employees
where emp_name like '_a%';


--월급을 낮은순부터 출력하시오

select emp_name,salary from employees
order by salary desc;

select * from emp2;

select employee_id,emp_name,job_id,hire_date from emp2
order by hire_date desc;
--사원명 역순정렬
select emp_name from emp2
order by emp_name desc;

--부서 번호는 순차정렬 , 이름은 역순정렬 
select employee_id,emp_name,department_id,job_id,hire_date,salary from emp2
order by department_id asc, emp_name desc;

--월급으로 순차정렬, 입사일 역순정렬

select employee_id,emp_name,department_id,job_id,hire_date,salary from emp2
order by salary asc, hire_date desc;


--abs 절댓값

select -10,abs(-10)"절댓값"from dual;

-- floor :버림
select 10.54578,floor(10.54578)"버림" from dual;

--trunc:특정자리 버림
select 10.54578, trunc(10.54578,2)"특정자리만 까지만 남김" from dual;

--round: 특정자리 반올림 
select 10.54578 , round(10.54578) "첫쨰자리 바로 반올림",
round(10.54578,3)"셋째 자리에서 반올림" from dual;

select * from stuscore;
select stunum,name,kor,eng,kor+eng,floor((kor+eng)/2) from stuscore;

--월급은 원화로 환산 1342 소수점 2자리 반올림해서 출력하시오.
--컬럼 사번 사원명 월급 월급환산 월급환산 2자리 반올림
select employee_id,emp_name,salary,salary*1342.32 "월급환산",round((salary*1342.32),1)"월급환산 2자리 반올림"
from employees;

--입사일이 현재날짜까지 걸린 일자를 출력하시오.
select sysdate-hire_date, round(sysdate-hire_date,2)"반올림" 
from employees;


--입사일에서 현재날짜까지 걸린 일자를 출력하세요.
--소숫점 자리는 반올림, 일을 년으로 환산해라.

select floor(sysdate-hire_date) "근무일",
floor((sysdate-hire_date)/365) "년차"
from employees
order by sysdate-hire_date asc;

select * from member;

select * from employees;

--나머지 함수

select mod(27,2), mod(27,5), mod(27,7) from dual;

--employees사번이 홀수인 차원을 출력하시오.
select * from emp2;

select * from emp2
where  mod(employee_id,2) = 1
order by employee_id asc
;

--부서번호가 짝수인 사원만 출력하시오.
select employee_id,emp_name,hire_date,salary,manager_id,department_id
from emp2
where mod(employee_id,2) = 0
order by employee_id asc;


select bhit from board;

select avg(bhit) from board;

--2자리 반올림
select round(avg(bhit),2) from board;
--소숫점 버림
select floor(avg(bhit)) from board;
--평균받아 높은 조회수를 가진 게시글 출력
select bhit from board
where bhit >= (select avg(bhit) from board)
order by bhit asc
;

select to_char(salary,'999,999'),
to_char(round(salary*1342.32),'999,999,999')
from employees;

--시퀀스

create sequence member_seq
start with 1
increment by 1
minvalue 1
maxvalue 99999
nocycle 
nocache
;





create sequence board_seq
start with 1001
increment by 1
minvalue 1
maxvalue 99999
nocycle 
nocache
;

--시작이 1 증가량 1 최솟값 1 최댓값 10만인 시퀀스 생성명령어 (name emp_seq)
--create sequence emp_seq
--start with 1
--increment by 1
--minvalue 1
--maxvalue 100000
--nocycle
--nocache
--;

create table emp01(
empno number(4) primary key,
ename varchar(10),
hiredate date
);

drop  table emp01;

--테이블에 데이터 삽입
insert into emp01 values(emp_seq.nextval,'홍길동',sysdate);

insert into emp01 values(emp_seq.nextval,'유관순',sysdate);

insert into emp01 values(emp_seq.nextval,'이순신',sysdate);

insert into emp01 values(emp_seq.nextval,'홍길자',sysdate);

insert into emp01 values(emp_seq.nextval,'홍길순',sysdate);

commit;
select emp_seq.currval from dual;


--데이터 확인
select * from emp01;
select emp_seq.nextval from dual;
--

select employee_id,emp_name,job_id,hire_date from employees
order  by hire_date desc;




select * from board 
order by bno desc
;

insert into board values(
board_seq.nextval,'제목입니다.','내용입니다.',sysdate,'aaa',board_seq.currval,0,0,1,'1.jpg'
);

select board_seq.currval from dual;
select board_seq.nextval from dual;

select member_seq.nextval from dual;

--dept_seq 시작 10, 증분 10,

create SEQUENCE dept_seq
start with 10
increment by 10
minvalue 1
maxvalue 99999
nocycle
nocache
;

select dept_seq.nextval from dual;

select * from stuscore;

--delete stuscore;
commit;

select * from stuscore
order by total desc;

select stunum,name,total,rank,rank() over (order by total desc) m_rank
from stuscore
;

--total을 기준으로 역순정렬 해서 등수를 출력한다. 
select stunum,rank() over (order by total desc) 
from stuscore;


--별칭 부여
select * from stuscore a,member b;

select employee_id,emp_name,a.department_id,department_name,parent_id
from employees a,departments b
where a.department_id = b.department_id 
;


select department_id,department_name from departments;

select * from departments;

update stuscore a
set rank = 1
where stunum=1;

--emp2
--테이블 복사 
--create table emp2 as select * from employees;



update emp2 set manager_id = '';

commit;

select * from emp2;

update (select a.manager_id a_m ,b.manager_id b_m
 from emp2 a ,employees b
where a.employee_id = b.employee_id)
set a_m = b_m
;

select salary  from employees
where salary >= (select avg(salary) from employees)
;


--1. emp2의 테이블 사원번호와 employees의 사원번호를 똑같은것을 찾는다. 
--2. emp2의 관리자번호와 employees의 관리자 번호를 검색한다.
--3. employees의 관리자번호를 emp2의 관리자번호에 입력시킴.
update 
(select a.manager_id a_m ,b.manager_id b_m from emp2 a, employees b 
where a.employee_id = b.employee_id)
set a_m = b_m;
 


update emp2
set manager_id = 1;

select manager_id from emp2;


--랭킹구하기

update stuscore a
set rank = ( -- select stunum,rank from stuscore
select b_rank from
(select stunum b_num, rank() over (order by total desc) as b_rank from stuscore) b
where a.stunum = b.b_num
);

select total,rank from stuscore
order by total desc;



select a.manager_id a_m ,b.manager_id b_m
 from emp2 a ,employees b
where a.employee_id = b.employee_id
;

select manager_id from employees;

rollback;


select * from stuscore;



--delete stuscore;

commit;

--drop table board;