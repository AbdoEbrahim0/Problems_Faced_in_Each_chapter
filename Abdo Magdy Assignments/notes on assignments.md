use [] when try to acces coulmn name of column is more than one part
example:
update Departments
set MGRSSN=(select top 1 SSN from Employee where Fname='Noha'and Lname='Mohamed'), [MGRStart Date]=GETDATE()
where Dnum=100
