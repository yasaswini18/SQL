select *
from emp inner join dept
on emp.deptno = dept.deptno;

-- WAQ to display details of employees and their departments if their employees are earning more than 3000.

select *
from emp inner join dept
on emp.deptno=dept.deptno
where sal>3000;

-- WAQ to display details of departments along with the employee names if employees are working in the location of chicago and
-- they are hired after clerk.

select dept.*,emp.ename
from emp inner join dept
on emp.deptno=dept.deptno
where loc='chicago' and hiredate >ALL (select hiredate from emp where job='clerk');

-- WAQ to display number of employees working in each department if their maximum salary is more than 2000 and their loc is new york or
-- chicago and they are hired after the employee who is not earning commission.

select count(*),emp.deptno
from emp inner join dept 
on emp.deptno = dept.deptno
where loc in('new york','chicago') and
hiredate >ALL (select hiredate from emp where comm is null or comm=0.0)
group by emp.deptno
having max(sal)>2000;

