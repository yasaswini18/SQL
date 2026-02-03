-- WAQ to display name and hiredate of the employee who is earning more than clerk

select ename,hiredate
from emp
where sal > (select max(sal)
from emp
where job in ('clerk'));
-- or
select ename,hiredate
from emp
where sal >ALL (select sal
from emp
where job in ('clerk'));

-- WAQ to display the details of employees earning less than salesman and hired after all the clerks.

select *
from emp
where sal <All (select sal 
from emp 
where job=('salesman')) and
hiredate >All (select hiredate
from emp
where job='clerk');

-- WAQ ro display details of employees earning more than the employee who is having character 'A' in his name and
-- earning less than the employee who is working in the location of chicago.

select *
from emp
where sal >All (select sal 
from emp
where ename like '%A%') AND sal <All (select sal 
from emp
where deptno in (select deptno
from dept 
where loc=('chicago')));

-- WAQ to display details of employees earning more than any one of the clerk / earning more than atleast a clerk.

select *
from emp
where sal >ANY (select sal from emp where job='clerk');

-- WAQ to display name and hiredate and annual salary of the employee if his annual salary is greater than any one of the clerks annual salary
-- but those employees are hired after managers.

select ename,hiredate
from emp
where sal*12 >ANY (select sal*12 from emp where job='clerk') and
hiredate >ALL (select hiredate from emp where job='manager');

-- WAQ to display names and half term salary of employee who is hired after adams and earning less than the employees who is 
-- having charcater 'man' in his job and they are hired after atleast a salesman if their salary is in the range of 1000 to 5000.

select ename,sal*6 as half_term_sal
from emp
where hiredate >All (select hiredate from emp where ename='adams') and 
sal <ALL (select sal from emp where job like '%man%') and 
hiredate >ANY (select hiredate from emp where job ='salesman' )and
sal between 1000 and 5000;