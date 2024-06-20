------------------Exam Gene-----------------------
Use Examination_System


--View the questions in Questions table
Create view showQuesTopics 
as
	select *
	from Questions


--SP for adding Exam Questions Numbers with cursor
Create proc AddIntoExamQuestions @exID int, @topicID int
as
	Declare C1 cursor
	for 
		select q_no
		from showQuesTopics
		where topic_id = @topicID
	for read only

	Declare @QuesNo int
	open C1
	fetch C1 into @QuesNo
	while (@@fetch_status = 0)
		begin
			insert into Exam_questions
				values(@exID, @QuesNo)
			fetch C1 into @QuesNo
		end
	close C1
	deallocate C1


--Exam Generation SP
Create proc ExamGene @exID int, @CrsID varchar(10), @topicID varchar(10)
as
	begin try
		if not exists(select exam_id from Exams where exam_id = @exID) and
		exists(select crs_id from Courses where crs_id = @CrsID) and
			exists(Select topic_id from Topics where topic_id = @topicID)
		begin
			insert into Exams
			values (@exID, @CrsID)

			---needs cursor to add each q_no in Exam_questions
			exec AddIntoExamQuestions @exID, @topicID
		end
		else
			select 'Check the examID or CrsID or TopicID may be dublicated or not found'
	end try
	begin catch
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE() 
	end catch


exec ExamGene 5, 3, 10
