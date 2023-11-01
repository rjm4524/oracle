--grgion별 대출금액을 출력하시오

select * from kor_loan_status

;

select substr(period,1,4),sum(loan_jan_amt)
from kor_loan_status
group by period;



select region,sum(loan_jan_amt)
from kor_loan_status
group by region;


select a.department_id,department_name,sum(salary) 
from employees a, departments b
where a.department_id = b.department_id
group by a.department_id,department_name
;

SELECT A.DEPARTMENT_ID,DEPARTMENT_NAME,SUM(SALARY)
FROM EMPLOYEES A, DEPARTMENTS B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID
GROUP BY A.DEPARTMENT_ID,DEPARTMENT_NAME
;

select substr(period,5,2) as s_period,sum(loan_jan_amt)
from kor_loan_status
group by substr(period,5,2);

select period from kor_loan_status;

select * from employees;

select employee_id,emp_name,department_id,manager_id from employees
order by department_id 
;

select a.employee_id,a.emp_name,a.manager_id,b.emp_name
from employees a, employees b 
where a.manager_id=b.employee_id
order by a.department_id;


--매니저 이름이 Steven King인 사람을 모두 출력하시오.

select b.manager_id,b.emp_name,b.employee_id,a.emp_name,a.department_id,department_name,
job_title
from employees a,employees b , departments c , jobs d
where a.employee_id = b.manager_id --self join 
and a.department_id = c.department_id   -- equl join
and a.job_id = d.job_id
and a.emp_name = 'Steven King'
order by c.department_id
;

select * from employees
where emp_name = 'Steven King'
;

--부서번호, 부서명 , 직급타이틀
select * from departments;
select * from jobs;


