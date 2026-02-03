use scott;
-- SINGLE ROW FUNCTIONS AND MULTI-ROW FUNCTIONS
 
 select sal,length(sal)
 from emp;

select max(sal)
from emp;

-- select max(sal),sal  -- ERROR
-- from emp;

-- waqtd number of employees along with their max salary if they working in deptno 10 or 30.
select count(*) ,max(sal) 
from emp
where deptno in (10,30);

-- waqtd number of employees working in deptno 10 if they have reporting manager.

select count(*)
from emp
where deptno=10 and mgr is not null;

-- waqtd number of employees working in each dept.
select deptno,count(*)
from emp
group by deptno;
-- Write a query to display the maximun salary of employee
select max(sal)
from emp;

-- write a query to display unique salaries without using distinct

select sal
from emp
group by sal;

-- write a query to display number of times salaries have been repeated in emp table.

select count(sal),sal
from emp
group by sal;

-- write a query to display total salaries of employees working in each job if their job is clerk or salesman and they are hired in the year of 1981.

select sum(sal),job
from emp
where job in('CLERK','SALESMAN') and hiredate between '1981-01-01' and '1981-12-31'
group by job;
-- or 
select sum(sal),job
from emp
where job in('CLERK','SALESMAN') and hiredate like '1981%'
group by job;

-- write a query to display number of employees working in each dept if there are atleast 2 employees working in each dept.

select count(empno),deptno
from emp
group by deptno
having count(empno)>1;

-- write a query to display maximum and minimum salary of employee working in each job if maximum salary of each job is more than 3000.

select max(sal),min(sal),job
from emp
group by job
having max(sal)>3000;

-- write a query to display total salary of employees working in each dept if their salary is more than 2000 and average salary needed to pay to the employees is less than 2000.

select sum(sal),deptno
from emp
where sal>2000
group by deptno
having avg(sal)<2000;

-- write a query to display repeated salary

select sal
from emp
group by sal
having count(sal)>1;

-- write a query to display maximum salary of employees working in each job if their job is analyst or clerk and their deptno is 20 
-- but their maximum salary is more than 2000 and their salary is more than 1000.

select max(sal),job
from emp
where job in('ANALYST','CLERK') and deptno in(20) and sal>1000
group by job
having max(sal)>2000;



                                 

