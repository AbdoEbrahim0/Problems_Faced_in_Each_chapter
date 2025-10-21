use Company_SD


--Display the Department id, name and id and the name of its manager.
select d.Dnum ,d.Dname ,e.Fname,e.SSN
from Employee  as e join Departments as d
on d.MGRSSN=e.SSN

--Display the name of the departments and the name of the projects under its control.
select d.Dname ,p.Pname
from  Departments as d  join Project as p
on d.Dnum=p.Dnum

--Display the full data about all the dependence associated with the name of the employee they depend on him/her.
select e.Fname+' '+e.Lname as "Employee name",d.*
from Dependent d join Employee as e
on e.SSN =d.ESSN

--Display the Id, name and location of the projects in Cairo or Alex city.

select Pnumber,Pname ,Plocation
from Project 
where City in ('Cairo' ,'Alex')

--Display the Projects full data of the projects with a name starts with "a" letter.
select *
from Project 
where Pname like 'A%'

--display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
select *
from Employee 
where Dno=30 and Salary between 1000 and 2000

--Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.

select e.Fname+' '+ e.Lname as "Name"
from Works_for as wf
join Project as p 
on p.Pnumber =wf.Pno and p.Pname='al rabwah' and wf.Hours >=10
		join Employee as e
		on e.SSN=wf.ESSn
where e.Dno=10 

--Find the names of the employees who directly supervised with Kamel Mohamed.

select e1.Fname+' '+ e1.Lname as "Name"
from Employee as e1 join Employee as e2
on e2.SSN=e1.Superssn and e2.Fname='Kamel' and e2.Lname='Mohamed'

-- Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
select e.Fname+' '+ e.Lname as "Name" , wf.Pno, p.Pname
from Works_for as wf join Employee as e 
on e.SSN=wf.ESSn
		join Project as p
		on wf.Pno=p.Pnumber
order by p.Pname

--For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
select p.Pnumber,p.Pname,d.Dname,e.Fname,e.Lname,e.Address,e.Bdate
from Departments as d join Project as p
on p.Dnum=d.Dnum and p.City='Cairo'
		join Employee as e
		on e.SSN=d.MGRSSN
;

--Display All Data of the managers
select e.*   --This returns all columns of the manager (e) for each employee (m) who has a supervisor. [correct as asked from Question]
from   Employee as m join Employee as e -- table exist alread FK child join table [created] PK parent
on e.SSN=m.Superssn

select m.*	--This returns all columns of the employee (m) who has a manager (e)
from   Employee as m join Employee as e -- table exist alread FK child join table [created] PK parent
on e.SSN=m.Superssn

--Display All Employees data and the data of their dependents even if they have no dependents

select e.*,d.*
from Employee as e left join Dependent as d
on e.SSN=d.ESSN

--Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233, salary=3000.
insert into Employee (Fname,Lname,Sex,Address,Bdate,Salary,Superssn)
values ('Abdo','Magdy','M','Ain shams Orabi st',3/25/2001,3000,112233)


--Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, but don’t enter any value for salary or supervisor number to him.
insert into Employee (Fname,Lname,Sex,Address,Bdate,Dno,SSN)
values ('Abdelaziz','Gamal','M','United Arabs st','3-25-2002',30,102660)

--Upgrade your salary by 20 % of its last value.
update Employee 
set Salary*=1.2
where SSN=102672
/*





Upgrade your salary by 20 % of its last value.

*/