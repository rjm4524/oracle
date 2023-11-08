select * from member;

select * from member 
where id = 'aaa' and pw ='1111';

select count(*)as lcheck from member
where id='aaa' and pw = '1111'
;

select count(*) from member;


drop table mem;

drop table nboard;

drop table sscore;

drop table fboard;

desc member;

commit;

select * from departments;

select * from employees;


select employee_id,emp_name,salary,(salary*12+(salary*12*nvl(commission_pct,0))) year_salary , b.department_id,hire_date,department_name 
from employees a , departments b
where a.department_id = b.department_id(+)




;

select employee_id,emp_name,salary,to_char(salary*12+(salary*12*nvl(commission_pct,0)),'999,999,999') year_salary,nvl(to_char(a.department_id),'CEO') department_id,nvl(department_name,'CEO') department_name,hire_date from employees a,departments b where a.department_id = b.department_id(+)
;

--번호 11~20 번호,제목,작성자,작성일,조회수

select bno,btitle,bcontent,id,bdate,bhit from (select rownum rnum, a.*from(select *from board order by bgrouup) a) where bno >=11 and bno <=20;


-- 외워서라도 알고 있을 것!!!!!(자주 사용하는 sql구문)
select * from
(select rownum rnum, a.*from
(select * from board
order by bgrouup) a
)
where rnum>=11 and rnum<=20
;
commit;
-- 외워서라도 알고 있을 것!!!!!(자주 사용하는 sql구문)
select * from
(select row_number() over (order by bgroup) rnum,a.*
from board a)
where rnum>=11 and rnum<=20
-- where rnum between 11 and 20
;


select * from (select row_number() over(order by bgrouup desc,bstep asc) rnum, a.*from board a where btitle like '%ia%') where rnum>=11 and rnum <=20;

select * from ( select row_number() over(order by bgrouup desc,bstep asc) rnum, a.* from board a
where btitle like '%ia%' ) where rnum>=11 and rnum<=20;



select * from board order by bgrouup desc, bstep asc;

select * from board;


create table mem (
id varchar2(20) primary key,
pw varchar2(20),
name varchar2(20),
phone varchar2(20),
gender varchar2(6),
hobby varchar2(80)
)
;

insert into mem values('ccc','1111','이순신','010-3333-3333','Male','game,golf,run');

select * from mem;

alter table mem add mdate date;

desc mem;

update mem
set mdate = sysdate;

commit;

delete mem where id = 'ddd' ;


