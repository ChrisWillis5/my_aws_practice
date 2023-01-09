--1.SQL Query to print the number of employees per department in the organization
SELECT emp.deptno, dname, COUNT(ename) as num_employees
FROM cards_ingest.emp AS emp
JOIN cards_ingest.dept AS dept
ON emp.deptno = dept.deptno
GROUP BY emp.deptno, dname
--or
select  distinct emp.deptno,  dname,
count(ename) over(partition by dname ) as num_employeees 
from cards_ingest.emp as emp
join cards_ingest.dept as dept
on emp.deptno = dept.deptno

--2.SQL Query to find the employee details who got second maximum salary
SELECT * FROM (
    SELECT *, 
    eRANK() OVER(ORDER BY sal DESC) as rank_sal
    FROM cards_ingest.emp) inq
WHERE inq.rank_sal = 2

--3.SQL Query to find the employee details who got second maximum salary in each department
SELECT * FROM (
    SELECT *, 
    DENSE_RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) as rank_sal
    FROM cards_ingest.emp) x
WHERE x.rank_sal = 2

--4.SQL Query to find the employee who got minimum salary in 2019


--5.SQL query to select the employees getting salary greater than the average salary 
of the department that are working in
select empno,ename,job,dname,sal, round(inq.avg_sal,2) as avg_dept_sal from(
    select *,
    avg(sal) over(partition by dname) as avg_sal
    from cards_ingest.emp as emp
    join cards_ingest.dept as dept
    on emp.deptno = dept.deptno) inq
where sal > inq.avg_sal
order by dname, sal desc


--6.SQL query to compute the group salary of all the employees.
select sum(sal) from cards_ingest.emp


--7.SQL query to list the employees and name of employees reporting to each person.
select report.ename, emp.ename as reports_to
from cards_ingest.emp as emp
join cards_ingest.emp as report
on emp.empno = report.mg

--8.SQL query to find the department with highest number of employees.
