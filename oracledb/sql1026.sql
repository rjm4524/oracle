select employee_id from employees
where mod(employee_id,2)=1;
--board
select * from board;
desc board;
select sysdate from dual;
select * from board
order by bno desc;
INSERT INTO board VALUES (
board_seq.nextval,'이벤트 진행','내용입니다.',SYSDATE,'ddd',board_seq.currval,0,0,1,'3.jpg');
select * from board
order by bno desc;
commit;
select sysdate-1 어제,sysdate 오늘,sysdate+1 내일
from dual;
select bno,bdate,btitle from board
order by bdate desc;
--현재날짜 기준으로 5일 이전 게시글을 출력
--번호 , 제목 , 작성일만 출력
select bno, btitle,bdate from board
where bdate > sysdate-5
order by bdate desc;
--employees 현재날짜 기준 입사일에서 현재 날짜까지 기간을 출력하시오
--소수점은 절사
--사원번호 , 사원명 , 입사일 , 부서번호 출력
select employee_id, emp_name, hire_date,salary,department_id,
trunc(sysdate - hire_date)
from employees;
--다음에 오는 일요일의 날짜를 알고싶을때
select next_day(sysdate,'일요일') from dual;
--현재 입력한 날의 마지막 일을 출력
select last_day(sysdate) from dual;
--입력한 값의 마지막 날이 언제인지 출력
select last_day('20231101') from dual;
select last_day('20231201') from dual;
--add , months
select add_months(sysdate,-2) from dual;
select to_date('20210113','yyyymmdd') + 2000 from dual;
SELECT TO_DATE('20210113', 'YYYYMMDD') + 1000 FROM dual;
--현재 기준으로 1년동안 작성된 글을 출력하시오
select bno,btitle,bdate from board
where bdate > add_months(sysdate,-6)
order by bdate desc;
--날짜중 달만 출력
--날짜 중 년도만 , 달만 , 일만 출력 : extract
select extract( year from bdate) from board;
select extract ( month from bdate) from board;
select extract ( day from bdate)from board;
--3월 ,5월 , 7월 입력한 게시글을 출력하시오
select bno,btitle,bdate from board
 where extract (month from bdate) in (3,5,7)
 order by bdate asc;
select bno,btitle,bdate from board;
select bdate 데이터날짜, round(bdate,'mm') 일자반올림 , trunc(bdate,'mm') 일자버림 from board;
--to_date 는 형변환 함수
select round(to_date('20231015'),'mm') from dual;
select bdate from board;
--to_char 날짜를 문자형변환
select to_char(bdate,'yyyy-mm-dd dy hh:mi:ss')from board
order by bdate desc;
select bno,btitle,bcontent, to_char(bdate,'yyyy"년"mm"월"dd"일"') bdate,bgroup,bstep,bindent,bfile
from board;
--employees 입사일을 2023 - 11 - 01 화요일
select hire_date, to_char(hire_date, 'yyyy-mm-dd' ) from employees
order by hire_date desc;
-- 문자형 변환함수
-- 숫자를 -> 문자로 변환
select to_char(123456789) 문자형 from dual;
select to_char(1234567890,'999,999,999,999')from dual;
select salary, to_char( salary,'$999,999,999'), salary*1342 원화월급 from employees;
-- 12345 총 9자리까지 표시하는데, 빈공백은 0으로 채워줌
select to_char(12345,'000000000') from dual;
select trim(to_char(12345,'L999,999,999'))
from dual;
-- board table 에서 bdate 와 비교해서 20231023 숫자와  같은날 입력한 게시글을 출력하시오
select bdate,bcontent from board
where to_char(bdate,'yyyymmdd') = '20231023'
order by bdate desc;
--20200101부터 현재까지 기간이 얼마나 지났는지 출력하시오.
select trunc(sysdate - to_date( '20200101' ,'yyyymmdd'))
from dual;
select trunc(sysdate-to_date('19931011','yyyymmdd'))
from dual;
--태어난 날 부터 지금까지 달로 계산
select trunc(months_between(sysdate,to_date('19931011','yyyymmdd')))
from dual;
--문자를 숫자로 형변환함수
select to_number('10,000','99,999') from dual;
--연봉 + 커미션 포함
-- 월급 *12  / 월급 * 12 * 커미션 : 연봉으로 해서 출력하시오
select * from employees;
select employee_id 사원번호 ,salary 월급 , salary*12 연봉 , salary*12+(salary*12*nvl(commission_pct,0)) 최종연봉  from employees
order by employee_id;
select manager_id from employees
where manager_id is null;
select manager_id from employees;
--null 값을 0으로 만드는 방법
select nvl(manager_id,0) from employees;
select nvl(to_char(manager_id),'ceo') from employees;
--게시글 조회수 총합을 출력하시오.
select to_char(sum(bhit),'999,999,999') from board;
--월급의 평균을 구하시오
select round(avg(salary),2) from employees;
--min 최소값, max 최대값 avg 평균 , count 개수 , sum 합계
--부서가 50인 사원들의 합계 평균을 출력하시오
select * from employees;
select department_id  from employees
where department_id >= 50
order by department_id asc;
--날짜 게시글 개수를 출력하시오
select bdate,count(*) from board
group by bdate
order by bdate asc;
SELECT TO_CHAR(bdate, 'YYYY-MM') month, COUNT(*) count
FROM board
GROUP BY TO_CHAR(bdate, 'YYYY-MM')
ORDER BY month ASC;
--년도만 출력
select extract(year from bdate) from board;
--월만 출력
select extract(month from bdate) from board;
--일만 출력
select extract(day from bdate) from board;
--년도와 상관없이 
select extract(month from bdate),count(extract(month from bdate))
from board
group by  extract(month from bdate)
order by  extract(month from bdate);

--단일함수 사용은 group by 절에 추가해서 사용해야 함.
select department_id,count(*) from employees
group by department_id
order by department_id
;

select count(employee_id) from employees;--107
select count(manager_id) from employees;--106(null은 카운트 x)

--조회수가 가장 낮은 게시글을 출력하시오.
select min(bhit) from board;


select bno,btitle,min(bhit) from board
group by bno,btitle
;--전부 출력
--이중 select 문
select * from board 
where bhit = (select min(bhit) from board)
;

--조회수가 가장 많은 게시글 출력

select * from board
where bhit = (select max(bhit) from board);

--문자함수

select emp_name from employees;


--대소문자 구분 없이 si, Si가 포함된 이름을 모두 출력하시오.

select emp_name 
from employees
where emp_name like('%DA%') or emp_name like ('%Da%') or emp_name like ('%dA%') or emp_name like  ('%da%')
;
--소문자로 변환후 출력
select emp_name
from employees
where lower(emp_name) like ('%da%')
;
--대문자로 변환후 출력 
select emp_name
from employees
where upper(emp_name) like ('%DA%')
;

--employees 에서 이름을 대문자로 출력하시오.

select upper(emp_name) from employees
;
--자리수를 만들어서 출력 , 12345 라는 수를 출력 후 10자리가 되게 하고 남은 공백은 0으로 넣음.(왼쪽으로)
select LPAD(12345,10,'0') from dual;

--12345 10자리로 천단위 표시와 원화 표시를 추가해서 출력하시오.
select to_char(12345,'L0,000,000,000') from dual;

--ltrim(왼쪽공백제거),rtrim(오른쪽 공백제거),trim(모든 공백제거)

select trim('   abc def c   ') from dual;

select * from employees;

--job_id asst -> ss -> i , asst-> ait 
select job_id,replace(job_id,'SS','I') from employees;

--job_id 안에 있는 공백 제거
select emp_name,replace(emp_name,' ','') from employees;

select replace('   abc def c   ',' ','') from dual;

select job_id from emp2;
--sh_clerk -> clerk변경해서 저장하시오.
update emp2 
set job_id = 'CLERK'
where job_id = 'SH_CLERK'
;

select replace(job_id,'SH_CLERK','CLERK') from emp2;

--rollback;
--substr(해당컬럼,3,2) 해당 컬럼에서 3번쨰 글자부터 2개를 잘라와 출력하는 예시문.
--4번째부터 이름 3개를 가져옴.
select emp_name,substr(emp_name,4,3) from employees;

select hire_date from employees;

--이름 5개와 입사년도를 출력 ex) Donal(1995)


select emp_name,substr(emp_name,1,5)||'('||extract(year from hire_date)||')'  as nameyear
from employees;

select * from employees;

--입사일이 06월인 사람중에 이름이 d가 들어가있는 사원을 출력하시오.

select emp_name,hire_date from employees
where extract(month from hire_date) = 6 
and emp_name like ('%d%') ;


select bhit,bhit+100 from board;

update board
set bhit = 1;

rollback;


update board a
set bhit = (select bhit+100 from board b where a.bno = b.bno)
;

select bhit from board;


select job_id,employee_id from emp2;

update emp2 a
set job_id = (select replace(job_id,'CLERK','SH_CLERK')from emp2 b where a.employee_id = b.employee_id);

select * from board;


--게시글의 날짜를 1씩 증가해서 update 하시오.

update board a
set bdate = (select bdate+1 from board b where a.bno = b.bno)
;

select bdate from board;

--

select * from stuscore;


update stuscore 
set rank = 0;
select b_num,b_rank from
(select stunum b_num,rank() over (order by total desc) b_rank from stuscore)
;
--난이도 상 (아직 오류) 
update stuscore a 
set rank =(select b_rank from
(select stunum b_num,rank() over (order by total desc) b_rank from stuscore b)
where a.stunum = b_num);


select length(emp_name),emp_name from employees;

select avg(length(emp_name)) from employees;

select substr(emp_name,1,3) from employees;


--employees phone 번호 5번째 부터 3개와 이름 1번째 부터 5개까지 출력
select * from employees;

select substr(phone_number,5,3),substr(email,1,5) from employees;


--instr 찾고자 하는 위치 숫자출력.

select * from employees;

select emp_name,instr(emp_name,' '),instr(emp_name,' ')+1 from employees;
--1번째 공백 이후부터 이름 가져오기.
select substr(emp_name,instr(emp_name,' ')+1) from employees;

--주민번호 앞자리 가져오기
select substr('880101-1101111',1,instr('880101-1101111','-')-1) from dual;

--주민번호 뒷자리 가져오기
select substr('880101-1101111',instr('880101-1101111','-')+1) from dual;

--employees
select phone_number from employees;
--ex)
select instr('123.456.789','.') from dual;
select instr('123.456.789.000','.',1,3) from dual; -- 첫번째 숫자는 시작위치
                                                --두번째 숫자는 찾고자하는 점의위치
select instr('123.456.789.000','.',-1,3) from dual;                                                
                              
                              
select * from member;

--전화번호 - 첫번째값 출력 ,두번째 , 세번째 출력
--010(1번
select substr(phone,1,instr(phone,'-',1)-1) from member;
--1111(2번
select substr(phone,instr(phone,'-')+1,4) from member;
--1111(3번                                               
select substr(phone,instr(phone,'-',1,2)+1,4) from member;                                                
                                                
                                                
select phone_number from employees;
--폰번호에서 123번이 포함되어있는 폰 번호를 출력하시오.

select phone_number from employees
where phone_number like ('%123%');



--부서별 최대월급을 출력하시오.
select * from employees;

select department_id,count(*),max(salary),min(salary) from employees
group by department_id
order by department_id
;

select emp_name,hire_date,to_char(hire_date,'yyyy"년"mm"월"dd"일"day') 
from employees;
             
                         
                         
 SELECT TO_CHAR(bdate, 'YYYY년MM월DD일') month, COUNT(*) count
FROM board
GROUP BY TO_CHAR(bdate, 'YYYY-MM')
ORDER BY month ASC;                       

                    
                                                                                                                
commit;                                              
                                                
                                                
                                                
                                                
                                                
--employees 의 phone_number 첫번째 점 기준으로 앞부분 출력 
select substr(phone_number,1,instr(phone_number,'.')-1) from employees;
--employees 의 phone_number 첫번째 점 기준으로 뒷부분 출력
select substr(phone_number,instr(phone_number,'.')) from employees;


--홍 길동
--유 관순
















