------------------Exam Ans-----------------------
Use Examination_System


--View the questions with their answers
Create view showQuesWithAns (examID, QuestionNum, Question, AnsLetter, Answer, TorF)
as
	Select ex.exam_id, q.Q_no, q.question, qa_letter, qa_answer, qa_isTrue
	from Exams ex inner join Exam_questions exq
		on ex.exam_id = exq.exam_id
		inner join Questions q
			on q.q_no = exq.q_no
			inner join Question_answers qa
				on q.q_no = qa.q_no


--SP for each Exam Questions and answers with cursor
Create proc EachQuesWithAns @exID int
as
	Declare C2 cursor
	for 
		select Question, AnsLetter, Answer, TorF
		from showQuesWithAns 
		where examID = @exID
	for read only

	Declare @Question varchar(255), @qa_letter varchar(1), 
		@qa_answer varchar(255), @qa_isTrue bit, @flag bit = 0, @counter tinyint = 0
	open C2
	fetch C2 into @Question, @qa_letter, @qa_answer, @qa_isTrue
	while (@@fetch_status = 0)
		begin
			if (@flag = 0)
				begin
					select @Question as Question
					set @flag = 1
				end
			select @qa_letter as AnsLetter, @qa_answer as Answer, 
				case
					when @qa_isTrue = 1 then 'Correct Choice'
					else 'X'
				end as 'True OR False'

			set @counter += 1
			if (@counter = 4)
				begin
					set @flag = 0
					set @counter = 0
				end
			fetch C2 into @Question, @qa_letter, @qa_answer, @qa_isTrue
		end
	close C2
	deallocate C2


--Exam Ans SP
Create proc ExamAns @exID int
as
	begin try
		if exists(select exam_id from Exam_questions where exam_id = @exID)
		begin
			exec EachQuesWithAns @exID
		end
		else
			select 'Check the examID is not found or has no questions yet'
	end try
	begin catch
		Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE() 
	end catch


exec ExamAns 1
exec ExamAns 2
exec ExamAns 3
exec ExamAns 5