------------------Exam Corr-----------------------
Use Examination_System



Declare C1 cursor
	for 
		select * 
		from getExQues_StAns(2, 1)
	for read only

	Declare @Question varchar(255), @qa_letter varchar(1)
	open C1
	fetch C1 into @Question, @qa_letter
	while (@@fetch_status = 0)
		begin
			select @qa_letter
			fetch C1 into @Question, @qa_letter
		end
	close C1
	deallocate C1