-- write a query to display details of employees working as analyst or clerk or salesman hired after 1980 in dept no 10,30

select *
from emp
where (job='analyst' or job='clerk' or job='salesman') and hiredate>'1980-12-31' and deptno in(10,30);
-- or 
select *
from emp
where job in('analyst' , 'clerk','salesman') and hiredate>'1980-12-31' and deptno in(10,30);

-- write a query to display name,job,hiredate of employees who is hired before 1987 working as clerk or manager but not working in deptno 20,30

select ename,job,hiredate
from emp
where hiredate<'1987-01-01' and job in('clerk','manager') and deptno not in(20,30);

-- write a query to display the details of employees along with half term salary if they are earning in the range of 1000 to 5000 but they are not working as salesman or analyst

select *,sal*6 as half_term_sal
from emp
where sal between 1000 and 5000 and job not in('salesman', 'analyst');

-- write a query to display the details of employees if they are having salary more than 2000 and less than 6000 and they are hired after 1978 and before 1986

select *
from emp
where sal between 2001 and 5999 and hiredate between '1979-01-01' and '1985-12-31';

-- write a query to display details of employees working as analyst or clerk or salesman hired after 1980 in dept no 10,30

select *
from emp
where (job='analyst' or job='clerk' or job='salesman') and hiredate>'1980-12-31' and deptno in(10,30);
-- or 
select *
from emp
where job in('analyst' , 'clerk','salesman') and hiredate>'1980-12-31' and deptno in(10,30);

-- write a query to display name,job,hiredate of employees who is hired before 1987 working as clerk or manager but not working in deptno 20,30

select ename,job,hiredate
from emp
where hiredate<'1987-01-01' and job in('clerk','manager') and deptno not in(20,30);

-- write a query to display the details of employees along with half term salary if they are earning in the range of 1000 to 5000 but they are not working as salesman or analyst

select *,sal*6 as half_term_sal
from emp
where sal between 1000 and 5000 and job not in('salesman', 'analyst');

-- write a query to display the details of employees if they are having salary more than 2000 and less than 6000 and they are hired after 1978 and before 1986

select *
from emp
where sal between 2001 and 5999 and hiredate between '1979-01-01' and '1985-12-31';

 -- WAQTD ename ,sal ,hiredate if employees is not hired after 81 and before 87.
 
select ename,sal,hiredate
from emp
where hiredate not between '1982-01-01' and '1986-12-31';

-- WAQTD details of employees who are not earning commission

select *
from emp
where comm is null or comm=0;

-- waqtd details of employees who don't have reporting manager but he is earning more than 3000 and less than 6000

select *
from emp
where mgr is null and sal between 3001 and 5999;

-- waqtd name of employee who earns commission

select ename
from emp
where comm is not null and comm!=0;

-- waqtd details of employees who is not earning commision but they have reporting manager;

select *
from emp
where (comm is null and comm=0) and mgr is not null;

-- waqtd details of employee if they have character a as a first character in thier name;

select *
from emp
where ename like 'a%';

-- waqtd details of employee if they have word 'MAN' in thier job.

select *
from emp
where job like '%man%';

-- waqtd details of employee if they have character 'a' or character 's' in thier job and their sal is starting with digit of '50'.

select *
from emp
where job like '%a%' and job like '%s%' and sal like '50%';

-- WAQTD details of employee if they are hired in the month of december.

select *
from emp
where hiredate like '____-12-__';

-- waqtd details of employees if they are hired int the year of 1981 and having 4 digit salary.

select *
from emp
where hiredate like '1981%' and sal between 1000 and 9999;

 -- waqtd name,annual salary and half term salary along with job if the employees are hired after 82 and befre 86 
 -- and they dont have 3 digit salary but they are working in deptno 10 or 30 as a salesman or analyst but they have reporting manager.
 
 select ename,sal*12 as annual_Sal,sal*6 as half_term_sal,job
 from emp
 where (hiredate between '1983-01-01' and '1985-12-31') and (sal like '_.%') and (deptno in(10,30)) and job in('salesman','analyst') and mgr is not null;
 