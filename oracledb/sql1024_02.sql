select * from employees;
--sysdate ���糯¥ ���, round �ݿø�
select hire_date,sysdate,round(sysdate-hire_date) from employees;
--distinct �ߺ�����
select distinct department_id from employees order by department_id asc;

select * from departments;

select * FROM departments;

desc stuscore;

select emp_name from employees;

--���� , ���̺�� , �÷����� ��ҹ��� ���� x �� �����Ͱ��� ��ҹ��� ���� o
select emp_name from employees where emp_name = 'Donald OConnell';