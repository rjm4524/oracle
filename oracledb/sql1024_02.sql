select * from employees;
--sysdate 현재날짜 출력, round 반올림
select hire_date,sysdate,round(sysdate-hire_date) from employees;
--distinct 중복방지
select distinct department_id from employees order by department_id asc;

select * from departments;

select * FROM departments;

desc stuscore;

select emp_name from employees;

--변수 , 테이블명 , 컬럼명은 대소문자 구별 x 단 데이터값은 대소문자 구별 o
select emp_name from employees where emp_name = 'Donald OConnell';