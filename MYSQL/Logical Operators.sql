-- write a query to display details of employees if thier annual salary is more than 9000 and display their half_term_salary.

select *,sal*6 as half_term_sal
from emp
where sal*12>9000;

-- write query to display name and job and salary of the employees who is working as clerk.

select ename,job,sal
from emp
where job='clerk';

-- write a query to display details of employees working as analyst and their salary <5000;

select *
from emp
where job='analyst' and sal<5000;

-- write a query to display details of employees along with half term salary if they are hired after 1980 and earning more than 2000 and working as manager;

select *,sal*6 as half_term_sal
from emp
where hiredate>'1980-12-31' and sal>2000 and job='manager';

-- write the query to display details of employees hired in the year of 1980 and their half_term_Salary is less than 7000;

select * 
from emp
where hiredate>1979-12-31 and hiredate<1981-01-01 and sal*6<7000;

-- syntax of 'OR' operator:
-- select col_name/exp
-- from table_name
-- where cindition1 or condition2 or condition3;

-- write a query to display details of employees working as analyst or clerk or salesman;
select *
from emp
where job='analyst' or job='clerk' or job='salesman';

-- write a query to diplay details of employees if they are working as salesman or analyst but they should earn more then 2000.

select *
from emp
where (job='salesman' or job='analyst') and sal>2000;

-- write a query to display the details of employees working as salesman or manager earning more than 2000 and less than 5000 and hired after 1982 and before 1987.

select *
from emp
where (job='salesman' or job='manager') and sal>2000 and sal<5000 and hiredate>'1982-12-31' and hiredate<'1987-01-01';

-- WRITE  a query to display details of employees earn more than 2000 but their job should not be manager.alter

select *
from emp
where sal>2000 and not job='MANAGER';

-- write a query to display details of employees if they are not working as manager or salesman but they are earning annual sal less than 15000.

select *
from emp
where not (job='MANAGER' OR JOB='SALESMAN') AND SAL*12<15000;

