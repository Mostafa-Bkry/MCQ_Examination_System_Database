------------------Exam Corr-----------------------
Use Examination_System

--Select topic_id from Topics where crs_id = 1 and topic_id = 7
exec ExamGene 1, 1, 7


declare @counter int = 0, @rightAns int = 0
select @counter = q_no
from showQuesWithAns sq inner join getExQues_StAns(2, 1) g
on sq.QuestionNum = g.q_no
group by q_no

select @rightAns += 1
from showQuesWithAns sq inner join getExQues_StAns(2, 1) g
on sq.QuestionNum = g.q_no 
and lower(sq.AnsLetter) = lower(g.Answers) and TorF = 1

select @counter as 'Number of Questions', @rightAns as 'Right Answers'

select *
from getExQues_StAns(2, 1)



Declare C1 cursor
	for 
		select * 
		from getExQues_StAns(2, 1)
	for read only

	Declare @stId int, @examId int, @qNo int, @Question varchar(255), @qa_letter varchar(1)
	open C1
	fetch C1 into @stId, @examId, @qNo, @Question, @qa_letter
	while (@@fetch_status = 0)
		begin
			select  @stId, @examId, @qNo, @Question, @qa_letter
			fetch C1 into @stId, @examId, @qNo, @Question, @qa_letter
		end
	close C1
	deallocate C1