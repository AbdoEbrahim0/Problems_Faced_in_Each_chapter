use Company_SD


--1-Display (Using Union Function)
-- The name and the gender of the dependence that's gender is Female and depending on Female Employee.
-- And the male dependence that depends on Male Employee.
select d.Dependent_name,d.Sex as d_sex,e.Sex as e_sex ,e.SSN
from Dependent d join Employee e
on d.ESSN=e.SSN  and d.Sex='F' and e.Sex='F'
UNION ALL
select d.Dependent_name,d.Sex as d_sex,e.Sex as e_sex ,e.SSN
from Dependent d join Employee e
on d.ESSN=e.SSN  and d.Sex='M' and e.Sex='M'


--2-For each project, list the project name and the total hours per week (for all employees) spent on that project.

select p.Pname ,sum(wf.Hours)
from Works_for wf join Project p
on p.Pnumber=wf.Pno
group by p.Pname

--3-Display the data of the department which has the smallest employee ID over all employees' ID.
-- miimum ID per Department
select d.Dnum ,min(SSN)
from Employee as e join Departments as d
on e.Dno=d.Dnum 
where e.Dno is not NULL 
group by d.Dnum 

-- minimum ID per  all Departments
select d.* 
from Departments as d join  Employee as e
on d.Dnum=e.Dno and e.SSN= (select top 1 min(e.SSN) as "MinimumIdDep"
from Employee as e 
where e.Dno is not NULL 
group by e.Dno
order by MinimumIdDep asc)

--4-For each department, retrieve the department name and the maximum, minimum and average salary of its employees.
select  d.Dname,max(e.Salary) "max_salary",min(e.Salary) "min_salary",avg(e.Salary) "avg_salary"
from Employee as e join Departments as d 
on d.Dnum = e.Dno
group by d.Dname

select *
from Employee


--5-List the full name of all managers who have no dependents.
select e1.Fname +' '+e1.Lname
from Employee as e1 join Employee as e2 --Fk child join PK parent
on e2.SSN=e1.Superssn and e2.SSN not in (select ESSN from Dependent) --PK =FK

select * from Employee
select * from Dependent
--6-For each department-- if its average salary is less than the average salary of all employees-- display its number, name and number of its employees.

select d.Dnum,d.Dname,avg(e.Salary) , sum(Salary),count(e.SSN) as "number of Employees"
from Departments as d join Employee as e
on d.Dnum  =e.Dno 
--where ((select avg(Salary) from Employee ) <1500)  -- incorrect approach as [where] deal with each row not grouped data
group by d.Dnum,d.Dname
--having ((select avg(Salary) from Employee )<1500)  -- incorrect approach dont know why 
having (avg(Salary) <sum(Salary))					 -- correct approach as [having] deal with each row not grouped data

select * from Employee

--7-Retrieve a list of employee’s names and the projects names they are working on ordered by department number and within each department, ordered alphabetically by last name, first name.
select e.Fname ,e.Lname,p.Pname,e.Dno
from Project as p join Employee as e
on e.Dno = p.Dnum
order by e.Dno ,e.Fname ,e.Lname 

--8-Try to get the max 2 salaries using sub query
select *
from Employee 

select * from 
Employee
where salary >= (select max(Salary) from Employee  where Salary < ( select MAX(Salary) from Employee ) )

--9-Get the full name of employees that is similar to any dependent name
select * from 
Employee

select * from 
Dependent

select e.Fname+' '+e.Lname,d.Dependent_name 
from Employee as e  join Dependent as d
on e.SSN =d.ESSN
--to show relatives
select e.Fname+' '+e.Lname as Employee ,d.Dependent_name as SimilarNames
from Employee as e  cross join Dependent as d
where d.Dependent_name like '%' +e.Fname or d.Dependent_name like '%' +e.Lname or d.Dependent_name like e.Fname+'%'  or d.Dependent_name like e.Lname+'%' 

--to show father and sons
select e.Fname+' '+e.Lname as Employee ,d.Dependent_name as son
from Employee as e  left join Dependent as d
on e.SSN =d.ESSN
where d.Dependent_name like '%' +e.Fname+' '+e.Lname   or d.Dependent_name like '%' +e.Fname





--10 -Display the employee number and name if at least one of them have dependents (use exists keyword) self-study.
select * from 
Employee

select * from 
Dependent

select e.SSN ,e.Fname,e.Lname from 
Employee  as e 
where EXISTS (select 1 from Dependent as d where e.SSN=d.ESSN)

--11 -In the department table insert new department called "DEPT IT”, with id 100, employee with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'
select * from 
Departments

delete from Departments where MGRSSN=112233

insert into Departments
values('DEPT IT',100,112233,'11-1-2006')

--12-Do what is required if you know that : Mrs.Noha Mohamed(SSN=968574)  moved to be the manager of the new department (id = 100), and they give you(your SSN =102672) her position (Dept. 20 manager) 
select * from 
Employee
select * from 
Departments

insert into Employee (Fname,Lname,SSN,Sex,Dno)
values('Abdo','Magdy',102672,'M',20)

update Departments
set MGRSSN=(select top 1 SSN from Employee where Fname='Noha'and Lname='Mohamed'), [MGRStart Date]=GETDATE()
where Dnum=100

update Employee
set Dno=100
where SSN=(select top 1 SSN from Employee where Fname='Noha'and Lname='Mohamed')

update Employee
set Superssn=102672
where SSN=102660


--A- First try to update her record in the department table
--B- Update your record to be department 20 manager.
--C- Update the data of employee number=102660 to be in your teamwork (he will be supervised by you) (your SSN =102672)
/*
16- Unfortunately the company ended the contract with Mr. Kamel Mohamed (SSN=223344) 
so try to delete his data from your database in case you know that you will be temporarily in his position.
--Hint: (Check if Mr. Kamel has dependents, works as a department manager, supervises any employees or 
works in any projects and handle these cases).
*/
select * from 
Employee
select * from 
Departments
select *
from Dependent
select *
from Works_for

update Employee
set Superssn =102672
where Superssn =223344

update Departments
set MGRSSN =102672
where MGRSSN =223344

update Works_for
set ESSn=102672
where ESSn=223344

delete from Dependent
where ESSN=223344

delete from Employee
where SSN=223344
--17- Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30%
select *
from Project
select *
from Employee
select *
from Works_for


update Employee
set Salary=1.3*Salary
where SSN in (select ESSn from Works_for where Pno=(select distinct Pnumber from Project where Pname='Al Rabwah'))

--will return SSN of Abdo Magdy as he work on this project alone

