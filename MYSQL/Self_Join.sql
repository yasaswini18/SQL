-- WAQ to display details of ford's manager

select *
from emp
where empno=(select mgr from emp where ename='ford');

-- WAQ to display name and hiredate of adams manager.

select ename,hiredate
from emp
where empno=(select mgr from emp where ename='adams');

-- WAQ to display name and hiredate of smith's manager's manager.

select ename,hiredate
from emp
where empno=(select mgr from emp 
where empno=(select mgr from emp where ename='smith'));

-- WAQ to display details of employees reporting to king

select *
from emp
where mgr=(select empno from emp where ename='king');

-- WAQ to display details of employees and their manager details.
use scott;

select *
from emp as emp1 join emp as emp2
on emp1.mgr=emp2.empno;

-- WAQ to display names of emplyees and their managers if employees are earning more than 2000.

select e1.ename,e2.ename
from emp as e1 join emp as e2
on e1.mgr=e2.empno
where e1.sal>2000;

-- WAQ to display names of employees and their managers if employees are earning more than their managers and managers are hired after clerk.

select e1.ename,e2.ename
from emp as e1 join emp as e2
on e1.mgr=e2.empno
where e1.sal>e2.sal and e2.hiredate >all (select hiredate from emp where job='clerk');

-- WAQ to display details of employees and their managers name if employees annual salary is greater than their managers annual salary if 
-- employees are hired after the employee who is working in the location of new york and managers are having character 'A' IN THEIR NAME.

select e1.*,e2.ename
from emp as e1 join emp as e2
on e1.mgr=e2.empno
where e1.sal*12>e2.sal*12 and 
e1.hiredate >ALL (select hiredate from emp where deptno in(select deptno from dept where loc =('new york'))) and
e2.ename like '%A%';

-- WAQ to display details of employees ad their managers and managers manager name.

select e1.*,e2.*,e3.ename
from emp as e1 join emp as e2 
on e1.mgr=e2.empno
join emp as e3
on e2.mgr=e3.empno;

-- WAQ to display details of employees and their managers and managers manager if employees are earning more than their managers and managers
-- are hired after blake and managers manager are working in deptno 10 or 30 if all of them have character 'A' or 'S' in their name.

select *
from emp as e1 join emp as e2
on e1.mgr=e2.empno
join emp as e3
on e2.mgr=e3.empno
where e1.sal>e2.sal and
e2.hiredate >ALL (select hiredate from emp where ename='blake') and
e3.deptno in (10,30) and
(e1.ename like '%A%' or e1.ename like '%S') and (e2.ename like '%A' or e2.ename like '%S%') and( e3.ename like '%A%' OR e3.ename like'%S%');

-- WAQ to display all the details of employees,managers and managers manager along with their dept details

select *
from emp e1 join emp e2 on e1.mgr=e2.empno
join emp e3 on e2.mgr=e3.empno
join dept d1 on e1.deptno=d1.deptno
join dept d2 on e2.deptno=d2.deptno
join dept d3 on e3.deptno=d3.deptno;

-- WAQ to display name of employees and their managers and managers manager along with their dept name

select e1.ename,e2.ename,e3.ename,d1.dname,d2.dname,d3.dname
from emp e1 join emp e2 on e1.mgr=e2.empno
join emp e3 on e2.mgr=e3.empno
join dept d1 on e1.deptno=d1.deptno
join dept d2 on e2.deptno=d2.deptno
join dept d3 on e3.deptno=d3.deptno;

-- WAQ to display names and hiredate of the employees if the employees are hired after their managers and managers are hired after adams and
-- managers manager are earning more than clerk and employees are working in research department managers are working in the location of chicago and 
-- managers manager are working in the deptno 20.

select e1.ename,e1.hiredate
from emp e1 join emp e2 on e1.mgr=e2.empno
join emp e3 on e2.mgr=e3.empno
join dept d1 on e1.deptno=d1.deptno
join dept d2 on e2.deptno=d2.deptno
join dept d3 on e3.deptno=d3.deptno
where e1.hiredate > e2.hiredate and 
e2.hiredate >ALL (select hiredate from emp where ename='adams') and
e3.sal >All (select sal from emp where job='clerk') and
d1.dname in('research') and
d2.loc in('chicago')and
d3.deptno in(20);

-- WAQ to display loc of salesman's managers manager.

select d1.loc
from emp e1 join emp e2 on e1.mgr=e2.empno
join emp e3 on e2.mgr=e3.empno
join dept d1 on e3.deptno=d1.deptno
where e1.job in('salesman');