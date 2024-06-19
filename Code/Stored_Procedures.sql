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
		Select 'Faild to update Student ' , @stId
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
		Select 'Faild to delete Student ' , @stId
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
		Select 'Faild to update Course ' , @crsId
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
		Select 'Faild to delete course ' , @crsId
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch



-----------------------------------------------Departments-------------------------------------------------
-----------------------------------------------------------------------------------------------------------


----------select all ------------
create proc SelectAllDepartments
as
	select * from Departments

	
----------select a Department ------------ 
create proc SelectDepartment @deptNo int
as
begin
   select * from Departments where Dept_no = @deptNo
end

------------insert --------------
create proc insertDepartments @deptNo int, @deptName varchar(50)
as
	begin try
		insert into Departments
		values(@deptNo, @deptName)
	end try
	begin catch
		Select 'Faild to insert into Departments'
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch

	
----------update-----------
Create proc UpdateDepartments @newDeptNo int = null,
	@deptNo int, @deptName varchar(50) = null
as
	begin try
		update Departments
		set Dept_no = (case when @newDeptNo is not null then @newDeptNo else Dept_no end),
			Dept_name = (case when @deptName is not null then @deptName else Dept_name end)
		where Dept_no = @deptNo
	end try
	begin catch
		Select 'Faild to update Department ' , @deptNo
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch


----------Delete-----------
create proc DeleteDepartments @deptNo varchar(10)
as
	begin try
		delete from Departments
		where Dept_no = @deptNo
	end try
	begin catch
		Select 'Faild to update Department ' , @deptNo
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch



-----------------------------------------------Instructor -------------------------------------------------
-----------------------------------------------------------------------------------------------------------


----------Select All-----------
create proc SelectAllInst
as
	select * from Instructors

----------select an instructor ------------ 
create proc Selectinstructor @instId int
as
begin
   select * from Instructors where inst_id = @instId
end


----------Insert-----------
create proc InsertInst @instId int, @instName varchar(50)
as
	begin try
		insert into Instructors
		values(@instId, @instName)
	end try
	begin catch
		Select 'Faild to insert into Instructors'
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch


----------update-----------
create proc Inst_Update @I_Number_old int,
	@I_Number_new int = null, @I_name_new varchar(50) = null
as
	begin try
		update Instructors
		SET inst_id=(case when @I_Number_new is not null then @I_Number_new else @I_Number_old end),
		inst_name=(case when @I_name_new is not null then @I_name_new else inst_name end)
		where inst_id = @I_Number_old
	end try
	begin catch
		Select 'Faild to update Instructor ' , @I_Number_old
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch

----------Delete-----------
create proc Inst_Delete @I_Number int
as
	begin try
		delete from dbo.Instructors
		where inst_id = @I_Number
	end try
	begin catch
		Select 'Faild to update Instructor ' , @I_Number
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch


-----------------------------------------------Topics-------------------------------------------------
------------------------------------------------------------------------------------------------------

----------Select All-----------
Create proc SelectAllTopics
as
	Select * from Topics

----------Select a topic-----------
Create proc SelectTopics @Tid int
as
	Select * from Topics where topic_id = @Tid


----------Insert-----------
Create proc AddTopic @Tid int, @Tname varchar(50), @CourseID int
as
	begin try
		insert into Topics
		values(@Tid, @Tname, @CourseID)
	end try
	begin catch
		Select 'Faild to insert into Topics'
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch



----------update-----------
Create proc UpdateTopic @NewTid int = null, @Tid int, 
	@Tname varchar(50) = null, @CourseID int = null
as
	begin try
		Update Topics
		set topic_id = (case when @NewTid is not null then @NewTid else @Tid end),
			topic_name = (case when @Tname is not null then @Tname else topic_name end),
			crs_id = (case when @CourseID is not null then @CourseID else crs_id end)
		where topic_id = @Tid
	end try
	begin catch
		Select 'Faild to update topic ' , @Tid
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch



----------delete-----------
Create proc DeleteTopic @Tid int
as
	begin try
		Delete from Topics
		where topic_id = @Tid
	end try
	begin catch
		Select 'Faild to delete topic ' , @Tid
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch



-----------------------------------------------Questions-------------------------------------------------
---------------------------------------------------------------------------------------------------------
----------Select All-----------
Create proc SelectAllQuestions
as
	Select * from Questions

----------Select a Question-----------
Create proc SelectQuestion @QNo int
as
	Select * from Questions where q_no = @QNo


----------Insert-----------
Create proc AddQuestion @QNo int, 
	@QuesContent varchar(255), @TopID int
as
	begin try
		insert into Questions
		values(@QNo, @QuesContent, @TopID)
	end try
	begin catch
		Select 'Faild to insert into Questions'
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch


----------Update-----------
Create proc UpdateQuestion @NewQNo int, @QNo int, 
	@QuesContent varchar(255), @TopID int
as
	begin try
		Update Questions
		set q_no = (case when @NewQNo is not null then @NewQNo else @QNo end),
			question = (case when @QuesContent is not null then @QuesContent else question end),
			topic_id = (case when @TopID is not null then @TopID else topic_id end)
		where q_no = @QNo
	end try
	begin catch
		Select 'Faild to update Question ' , @QNo
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch



----------Delete-----------
Create proc DeleteQuestion @QNo int
as
	begin try
		Delete from Questions
		where q_no = @QNo
	end try
	begin catch
		Select 'Faild to delete Question ' , @QNo
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch


-----------------------------------------------Questionss_Answers-------------------------------------------------
------------------------------------------------------------------------------------------------------------------

----------Select-----------
Create proc Select_From_QA (@q_no int = Null)
as
Begin
	if @q_no IS NULL
	Begin
		select * from Question_answers
	End
	else 
	Begin
		select * from Question_answers where q_no = @q_no
	End
End



----------Insert-----------
Create proc Insert_Into_QA (@qa_answer varchar(255), 
	@qa_letter char(1) , @qa_isTrue bit , @q_no int)
as
	begin try
		Insert into Question_answers
		values (@qa_letter, @qa_answer,  @qa_isTrue, @q_no)
	end try
	begin catch
		Select 'Faild to insert into Question_answers'
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch

----------Update-----------
Create proc Update_From_QA @NewQNo int = null, @QNo int, 
	@qa_answer varchar(255) = null, @qa_isTrue bit = null, @QA_Letter char(1) = null
as
	begin try
		Update Question_answers
		set q_no = (case when @NewQNo is not null then @NewQNo else @QNo end),
			qa_answer = (case when @qa_answer is not null then @qa_answer else qa_answer end),
			qa_letter = (case when @QA_Letter is not null then @QA_Letter else qa_letter end),
			qa_isTrue = (case when @qa_isTrue is not null then @qa_isTrue else qa_isTrue end)
		where q_no = @QNo and qa_letter = @QA_Letter
	end try
	begin catch
		Select 'Faild to update Question_answer Q number ' , @QNo
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch

----------Delete-----------
Create proc DeleteQuestionAnswer @QNo int
as
	begin try
		Delete from Question_answers
		where q_no = @QNo
	end try
	begin catch
		Select 'Faild to delete Question_answers ' , @QNo
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE()
	end catch


----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------