------------------Exam Corr-----------------------
Use Examination_System

--exec ExamGene 1, 1, 1
--exec ExamAns 1

alter proc Exam_Corr @examNo int, @studID int
as
  begin try
	if exists(select exam_id, st_id from Student_answers 
		where exam_id = @examNo and st_id = @studID)
	begin
		declare @counter int
		select @counter = count(q_no)
		from getExQues_StAns(@examNo, @studID)

		declare @rightAns int
		select @rightAns = count(*)
		from getExQues_StAns(@examNo, @studID) g inner join showQuesWithAns sq
			on g.q_no = sq.QuestionNum
			and TorF = 1 and lower(sq.AnsLetter) = lower(g.Answers)

		if (@rightAns = @counter)
			insert into Student_exams
				values(@studID, @examNo, 'A')
		else if (@rightAns > @counter / 2 and @rightAns < @counter)
			insert into Student_exams
				values(@studID, @examNo, 'B')
		else if (@rightAns = @counter / 2)
			insert into Student_exams
				values(@studID, @examNo, 'C')
		else if (@rightAns < @counter / 2 and @rightAns <> 0)
			insert into Student_exams
				values(@studID, @examNo, 'D')
		else
			insert into Student_exams
				values(@studID, @examNo, 'F')
	end
	else
		select 'Check exam id or student id and ensure that he answered the exam'

	select * from Student_exams where st_id = @studID and exam_id = @examNo
  end try
  begin catch
	Select ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE() 
  end catch

exec Exam_Corr 1, 1
exec Exam_Corr 1, 2


/*
declare @counter int
select @counter = count(q_no)
from getExQues_StAns(1, 1)

declare @rightAns int
select @rightAns = count(*)
from getExQues_StAns(1, 1) g inner join showQuesWithAns sq
on g.q_no = sq.QuestionNum
and TorF = 1 and lower(sq.AnsLetter) = lower(g.Answers)

select @counter as 'Number of Questions', @rightAns as 'Right Answers'

begin transaction
if (@rightAns = @counter)
	insert into Student_exams
		values(1, 1, 'A')
else if (@rightAns > @counter / 2 and @rightAns < @counter)
	insert into Student_exams
		values(1, 1, 'B')
else if (@rightAns = @counter / 2)
	insert into Student_exams
		values(1, 1, 'C')
else if (@rightAns < @counter / 2 and @rightAns <> 0)
	insert into Student_exams
		values(1, 1, 'D')
else
	insert into Student_exams
		values(1, 1, 'F')

select * from Student_exams
rollback
*/


/*--show correct answers only
select *
from showQuesWithAns
where examID = 1 and TorF = 1
*/