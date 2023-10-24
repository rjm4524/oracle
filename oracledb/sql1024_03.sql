



select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

select * from emp2;

select * from departments;

--department_id를 부서번호로 , department_name 을 부서명으로 컬럼이름을 변경후, 
--부서명이 10~40까지만 출력

select department_id as "부서번호" , department_name as "부서명" from departments
where department_id>=10 and department_id <= 40;

--문자타입을 붙여서 출력
select emp_name||'is a'||job_id from employees;

select concat(concat(emp_name,'is a'),job_id)con_name from employees;

select * from stuscore;

select kor,eng,math,kor+eng+math,(kor+eng+math)/3 from stuscore;

--department_id 중복제거 및 순차정렬
select distinct department_id from employees order by department_id asc;

--job id 중복제거 출력
select distinct job_id from employees;

--월급 3000,5000,6000 출력

select * from employees
where salary >= 3000 and salary <= 10000 order by salary asc; 

--월급이 5000이하인 사람에게 +1000월급을 인상해서 출력하세요.

select salary from employees
where salary <=5000 ;

select  salary  as "기본월급" , (salary+1000) as "인상월급" , (salary+1000)*1342 as "원화" from emp2
where salary <= 5000 ;


--부서 번호가 10번 30번 50번 인 사람의 사원번호,사원이름,부서번호,직급,월급,입사일


select employee_id,emp_name,department_id,job_id,salary,hire_date  
from emp2
where department_id = 10 or department_id = 30 or department_id = 50
order by  employee_id asc,department_id asc 

;

select employee_id,emp_name,salary,hire_date,department_id 
from emp2
where salary >= 4000 and salary <= 8000 and hire_date >= '03/09/01'
order by hire_date asc;















