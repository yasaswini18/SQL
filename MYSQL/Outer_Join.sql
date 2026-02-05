-- WAQ to display details of employees and their departments even if employees does not work in any department.

select  *
from emp left outer join dept
on emp.deptno=dept.deptno;

-- WAQ to display details of employees and their departments if employees are having charcater'A' in his name and they are working in loc of
-- new york and display those employees who are not working in any department.

select *
from emp left outer join dept
on emp.deptno=dept.deptno
where emp.ename like '%A%' and dept.loc in('NEW YORK');

select *
from emp right outer join dept
on dept.deptno=emp.deptno;

-- select *
-- from emp full join dept
-- on emp.deptno=dept.deptno;  -- there is no full outer join or outer join in mysql

select *
from emp left join dept 
on emp.deptno=dept.deptno
union -- this is set operator
select *
from emp right join dept
on emp.deptno=dept.deptno;

select *
from emp left join dept 
on emp.deptno=dept.deptno
union all-- this is set operator gives all data along with common and repeated
select *
from emp right join dept
on emp.deptno=dept.deptno;

