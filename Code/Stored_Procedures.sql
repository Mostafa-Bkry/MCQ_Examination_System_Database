---------------------------------Stored Procedures----------------------------------
--------------------Insert----Update----Delete----Select---------------------------


----------------------------------------------students -------------------------------------------------
--------------------------------------------------------------------------------------------------------


----------select all ------------ 
create proc SelectAllStudent 
as
begin
   select * from Students
end

----------select a student ------------ 
create proc SelectStudent @st_id int
as
begin
   select * from Students where st_id = @st_id
end

------------insert --------------
create proc insertStudent @stFname varchar(50) , @stLname varchar(50) , @deptNo int
as
  begin try
	insert into Students 
	values (@stFname , @stLname , @deptNo)
  end try
  begin catch
	Select 'Faild to insert into Students'
	Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
  end catch

----------update-----------
--------use this SP with named parameters for best work
Create proc updateStudent @stId int, @stFname varchar(50) = null, 
	@stLname varchar(50) = null, @deptNo int = null
as
	begin try
		Update Students
		set st_Fname = (case when @stFname is not null then @stFname else st_Fname end),
			st_Lname = (case when @stLname is not null then @stLname else st_Lname end),
			dept_no = (case when @deptNo is not null then @deptNo else dept_no end)
		where st_id = @stId
	end try
	begin catch
		Select 'Faild to update Student ' + st_id
		from Students
		where st_id = @stId
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch

-----------delete-----------
Create proc DeleteStudent @stId int
as
	begin try
		Delete from Students  
		where st_id = @stId
	end try
	begin catch
		Select 'Faild to delete Student ' + st_id
		from Students
		where st_id = @stId
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch

	
-----------------------------------------------Courses-------------------------------------------------
-------------------------------------------------------------------------------------------------------


----------select all ------------ 
create proc SelectAllCourses
as
begin
	select * from Courses
end

----------select a Course ------------ 
create proc SelectCourse @crs_id int
as
begin
   select * from Courses where crs_id = @crs_id
end

-----------insert ------------ 
create proc insertCourses @crsId int, @crsName varchar(50), 
	@instId int, @dept_no int
as
	begin try
		insert into Courses 
		values (@crsId , @crsName , @instId, @dept_no)
	end try
	begin catch
		Select 'Faild to insert into Courses'
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch


----------update-----------
create proc updateCourses @newCrsId int = null, @crsId int, 
	@crsName varchar(50) = null, @instId int = null, @dept_no int = null
as
	begin try
		Update Courses
		set crs_id = (case when @newCrsId is not null then @newCrsId else @crsId end),
			crs_name = (case when @crsName is not null then @crsName else crs_name end),
			inst_id = (case when @instId is not null then @instId else inst_id end),
			Dept_no = (case when @dept_no is not null then @dept_no else Dept_no end)
		where crs_id = @crsId
	end try
	begin catch
		Select 'Faild to update Course ' + crs_id
		from Courses
		where crs_id = @crsId
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch

----------delete----------
create proc DeleteCourses @crsId int 
as
	begin try
		Delete from Courses  
		where crs_id = @crsId
	end try
	begin catch
		Select 'Faild to delete course ' + crs_id
		from Courses
		where crs_id = @crsId
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch



----------------------------------------------------------------------------------------------------------------