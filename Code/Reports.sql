Create schema Reports

/*
Report that returns the students information 
according to Department No parameter.
*/
Create view StudentInfo ([Student ID], [Full Name], Department)
as
	select s.st_id, concat(st_Fname, ' ', st_Lname), Dept_name
	from Students s inner join Departments d
		on d.Dept_no = s.Dept_no

Create proc Reports.StInfoReport
as
	select * from StudentInfo

-------------------------------------------------------------

/*
Report that takes the student ID and returns 
the grades of the student in all courses.
*/

Create view StudentGrades (StID, StFullName, StCourse, StGrade)
as 
	Select s.st_id, concat(s.st_Fname, ' ', s.st_Lname),
		c.crs_name, stexm.grade
	from Student_exams stexm inner join Students s
		on s.st_id = stexm.st_id 
		inner join Student_courses stcur
			on s.st_id = stcur.st_id
			inner join Courses c
				on c.crs_id = stcur.crs_id
				inner join Exams e
					on c.crs_id = e.crs_id and stexm.exam_id = e.exam_id
	group by s.st_id, concat(s.st_Fname, ' ', s.st_Lname), 
		c.crs_name, stexm.grade

Create proc Reports.StGradesReport @StID int
as
	Select *
	from StudentGrades
	where StID = @StID

Reports.StGradesReport 4

-------------------------------------------------------------

/*
Report that takes the instructor ID and returns 
the name of the courses that he teaches and the number of student per course.
*/

Create proc Reports.InsCoursesReport @InsID varchar(10)
as
	Select c.crs_name, Count(stc.st_id) as 'Num of Students'
	from Courses c inner join Student_courses stc
		on c.crs_id = stc.crs_id
			and c.inst_id = @InsID
	group by c.crs_name

-------------------------------------------------------------

/*
Report that takes course ID and returns its topics  
*/

Create proc Reports.crsTopicsReport (@Course_Id int)
as
	select * 
	from Topics 
	where crs_id = @Course_Id

-------------------------------------------------------------

/*
Report that takes exam number and returns the Questions in it
*/

Create proc Reports.ExQuestionsReport @exam_no int
as 
	select * 
	from Exam_questions 
	where exam_id = @exam_no

-------------------------------------------------------------

/*
Report that takes exam number and the student ID 
then returns the Questions in this exam with the student answers.
*/

Create function getExQues_StAns (@Exam_no int , @st_id int)
returns table as
return
(
select  sa.st_id, sa.exam_id, sa.q_no, q.question as Questions , sa.st_answer as Answers 
	from Student_answers sa inner join Questions q  
		on q.q_no = sa.q_no
		and sa.exam_id = @Exam_no and sa.st_id = @st_id
)


Create proc Reports.ExQues_StAnsReport @Exam_no int , @st_id int
as
	select Questions , Answers
	from getExQues_StAns(@Exam_no, @st_id)
