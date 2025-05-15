
use ITI

--- 1 ---
Select count(*) from Student where St_Age is not null

--- 2 ---
Select distinct Ins_Name from Instructor

--- 3 ---
Select St_Id , St_Fname +' '+St_Lname  as 'Full Name',
d.Dept_Name from Student s
join Department d on
s.Dept_Id = d.Dept_Id

--- 4 --- 
Select Ins_Name , d.Dept_Name from Instructor s
left outer join Department d on
s.Dept_Id = d.Dept_Id

--- 5 --- 
Select St_Fname+' '+St_Lname as 'Full Name',cr.Crs_Name  from Student s
join Stud_Course c on s.St_Id = c.St_Id
join Course cr on cr.Crs_Id = c.Crs_Id  where c.Grade is not null

--- 6 ---
Select count(Crs_id) as 'Number of courses',Top_Name from Course c 
inner join Topic t on c.Top_Id = t.Top_Id group by Top_Name


--- 7 ---
--- i edited in salaries of the table 
Select Min(Salary) as 'Min Salary' , Max(Salary) as 'Max Salary'
from Instructor

--- 8 ---
Select * from Instructor where 
Salary < (Select avg(Salary) from Instructor)


--- 9 ---
select d.Dept_Name from Department d 
join Instructor i 
on i.Dept_Id = d.Dept_Id
where i.Salary =(select min(salary) from Instructor)


--- 10 ---
 Select
    (Select max(Salary) from Instructor) as 'Max Salary',
    (Select max(Salary) from Instructor 
	where Salary < (Select max(Salary) from Instructor)) as 'Second Max Salary';


--- 11 ---
Select  Ins_Name ,coalesce(cast(Salary as varchar(20)),'bonus') 
from Instructor 


--- 12 ---
Select avg(Salary) as 'Avarage Salary' from Instructor


--- 13 ---
Select s.St_Fname ,i.* from Student s 
inner join Student i on s.St_super = i.St_Id


--- 14 ---
Select Dept_Id, Ins_Name, Salary
from (
    Select 
     Dept_Id, Ins_Name,Salary,
     dense_rank() 
	 over (partition by Dept_Id order by Salary desc) as SalaryRank
     from Instructor
     where Salary IS NOT NULL
) as RankedSalaries
where SalaryRank <= 2;


--- 15 --- 
Select dept_id, st_id, st_fname, st_lname
from (
    Select 
       dept_id, st_id, st_fname, st_lname,
       row_number() 
	   over (partition by dept_id order by newid()) as ran
    from student
) as randomstudents
where ran = 1;

