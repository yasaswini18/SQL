-- Write a query to display details of employees earning more than smith.

select *
from emp
where sal>(select sal from emp where ename in('SMITH'));

-- write a query to display names of employees earning less than jones

select ename
from emp
where sal < (select sal from emp where ename='jones');

-- write a query to display name of the employees along with annual salary who are hired before james and earning more than 1000.

select ename,sal*12 as 'annual_salary'
from emp
where sal>1000 and hiredate < (select hiredate
from emp
where ename='james');

-- WAQ name,sal,deptno of employees if the employee earn more than 2000 and work in same department as james

select ename,sal,deptno 
from emp
where sal>2000 and deptno in (select deptno from emp where ename='james');

-- WAQ to display details of the employees earning more than smith but less than king

select *
from emp
where sal > (select sal from emp where ename='smith') and
sal<(select sal from emp where ename='king');

-- WAQ to display names of the employees working in same dept as james and earning salary more than adams and working in the same role
-- as miller and hired after martin.

select ename
from emp
where deptno in(select deptno from emp where ename='james') and 
      sal > (select sal from emp where ename='adams') and
	job in (select job from emp where ename='miller') and
    hiredate > (select hiredate from emp where ename='martin');
    
use scott;
-- WAQ to display name and hiredate of the employees whos anme ends with 'S' and hired after james

select ename,hiredate
from emp
where ename like '%s' and hiredate>(select hiredate from emp where ename='james');

-- WAQ to display details of employees who are working in the location newyork.

select *
from emp
where deptno=(select deptno from dept where loc='new york');

-- WAQ to display all the details of the employees working in the same designation as miller and work in location new york

select *
from emp
where job =(select job from emp where ename='miller')
 and deptno=(select deptno from dept where loc = 'new york');
 
 -- WAQ to display number of employees working as clerk in the same deptno as smith and earning more than king hired after martin
 -- in the location boston.
 
 select count(*)
 from emp
 where deptno=(select deptno from emp where ename='smith')
 and sal>(select sal from emp where ename='king')
 and hiredate>(select hiredate from emp where ename='martin')
and deptno=(select deptno from dept where loc='boston');
 
-- WAQ to display dept name of clerk;

-- select dname
-- from dept
-- where deptno = (select deptno from emp where job in('clerk')); //single value subquery uses = and multi value subquery uses in operator
select dname
from dept
where deptno in (select deptno from emp where job in('clerk'));
 
 -- WAQ to display number of employees working as clerk or salesman earning more than 800 and working in the location of new york or dallas
 -- in each department.
 
 select count(*),deptno
 from emp
 where job in('clerk','salesman') and sal>800 
  and deptno in (select deptno from dept where loc in ('new york','dallas'))
group by deptno;

-- WAQ to display maximum salary

select max(sal)
from emp;

-- WAQ to display details of employee who is earning maximum salary

select *
from emp
where sal=(select max(sal) from emp);

-- WAQ to display the second maximum salary

select max(sal)
from emp
where sal < (select max(sal) from emp) ;
-- or
select sal
from emp
where sal<(select max(sal) from emp)
order by sal desc
limit 1;

-- WAQ to display third maximum salary

select max(sal)
from emp
where sal<(select max(sal) from emp where sal<(select max(sal) from emp));

-- WAQ to display 2nd minimum sal

select min(sal)
from emp
where sal>(select min(sal)
from emp);

-- WAQ to display all details of employees who is earning 2nd minimum salary

select *
from emp
where sal =(select min(sal) from emp where sal>(select min(sal) from emp));

-- WAQ to display loc of employee who is earning 3rd maximum salary

select loc
from dept
where deptno in (select deptno
from emp
where sal in (select max(sal)
from emp
where sal < (select max(sal)
from emp
where sal < (select max(sal)
from emp))));

