



select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

select * from emp2;

select * from departments;

--department_id�� �μ���ȣ�� , department_name �� �μ������� �÷��̸��� ������, 
--�μ����� 10~40������ ���

select department_id as "�μ���ȣ" , department_name as "�μ���" from departments
where department_id>=10 and department_id <= 40;

--����Ÿ���� �ٿ��� ���
select emp_name||'is a'||job_id from employees;

select concat(concat(emp_name,'is a'),job_id)con_name from employees;

select * from stuscore;

select kor,eng,math,kor+eng+math,(kor+eng+math)/3 from stuscore;

--department_id �ߺ����� �� ��������
select distinct department_id from employees order by department_id asc;

--job id �ߺ����� ���
select distinct job_id from employees;

--���� 3000,5000,6000 ���

select * from employees
where salary >= 3000 and salary <= 10000 order by salary asc; 

--������ 5000������ ������� +1000������ �λ��ؼ� ����ϼ���.

select salary from employees
where salary <=5000 ;

select  salary  as "�⺻����" , (salary+1000) as "�λ����" , (salary+1000)*1342 as "��ȭ" from emp2
where salary <= 5000 ;


--�μ� ��ȣ�� 10�� 30�� 50�� �� ����� �����ȣ,����̸�,�μ���ȣ,����,����,�Ի���


select employee_id,emp_name,department_id,job_id,salary,hire_date  
from emp2
where department_id = 10 or department_id = 30 or department_id = 50
order by  employee_id asc,department_id asc 

;

select employee_id,emp_name,salary,hire_date,department_id 
from emp2
where salary >= 4000 and salary <= 8000 and hire_date >= '03/09/01'
order by hire_date asc;















