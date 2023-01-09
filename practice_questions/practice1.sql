1. Display all the information of the Employee table.
SELECT * FROM cards_ingest.emp

2. Display unique Department names from Employee table.
SELECT DISTINCT(dname) FROM cards_ingest.emp AS emp
JOIN cards_ingest.dept AS dept
ON emp.deptno = dept.deptno
or 
select distinct(dname) from cards_ingest.dept

3. List the details of the employees in ascending order of their salaries.
SELECT * FROM cards_ingest.emp
ORDER BY sal ASC

4. List the employees who joined before 1981.
SELECT ename FROM cards_ingest.emp
WHERE hiredate < '1981-1-1'

5. List the employees who are joined in the year 1981
SELECT ename FROM cards_ingest.emp
WHERE hiredate  >= '1981-1-1' 
AND hiredate < '1982-1-1'

6. List the Empno, Ename, Sal, Daily Sal of all Employees in the ASC order of AnnSal. (Note divide sal/30 as annsal)
SELECT empno, ename, sal, ROUND((sal/30),2) AS daily_sal
FROM cards_ingest.emp
ORDER BY (sal *12) ASC
or
select empno,ename, sal, round((sal/30),2) as daily_sal, 
round((sal*12),2) as annual_sal
from cards_ingest.emp
order by annual_sal

7. List the employees who are working for the department name ACCOUNTING
SELECT ename FROM cards_ingest.emp as emp
JOIN cards_ingest.dept AS dept
ON emp.deptno = dept.deptno
WHERE dname = 'ACCOUNTING'

8. List the employees who does not belong to department name ACCOUNTING
SELECT ename FROM cards_ingest.emp as emp
JOIN cards_ingest.dept AS dept
ON emp.deptno = dept.deptno
WHERE dname != 'ACCOUNTING'
