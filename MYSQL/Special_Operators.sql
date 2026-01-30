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
