create database Examination_System
go
use Examination_System
go
-------------------- instructor----------
create table Instructors(
inst_id int primary key,
inst_name varchar(50) not null
)
go

-------------departments------------
create table Departments(
Dept_no int primary key,
Dept_name varchar(50) not null unique
)
go

----------------courses-------
create table Courses (
crs_id int primary key default(404),
crs_name varchar(50) not null unique default('General'),
inst_id int foreign key references Instructors(inst_id) 
	on delete set null on update cascade,
Dept_no int foreign key references Departments(Dept_no)
	on delete set null on update cascade
)
go

------------students------------------
create table Students (
st_id int primary key identity(1,1),
st_Fname varchar(50) not null,
st_Lname varchar(50) not null,
Dept_no int foreign key references Departments(Dept_no) 
	on delete set null on update cascade
)
go 
---------------Student_courses----------
create table Student_courses(
crs_id int foreign key references Courses(crs_id) 
	on delete cascade,
st_id int foreign key references Students(st_id) 
	on delete cascade,
primary key (crs_id, st_id),
)

go
--------------------topics-------
create table Topics (
topic_id int primary key,
topic_name varchar(50) not null unique,
crs_id int foreign key references Courses(crs_id) 
	ON DELETE CASCADE not null
)

go
------------questions ----------------
create table Questions(
Q_no int primary key ,
question varchar(255) not null unique,
topic_id int foreign key references Topics(topic_id) 
	ON DELETE CASCADE not null
)
go
-----------questions answers----------------
Create table Question_answers(
qa_id int identity(1,1),
qa_letter char(1) not null,
qa_answer varchar(255) not null,
qa_isTrue bit default(0),
q_no int foreign key references Questions(q_no) 
	ON DELETE CASCADE on update cascade not null, 
constraint C1 primary key(qa_id, q_no)
)
go

---------Exams -------------
create table Exams (
exam_id int primary key default(404),
crs_id int foreign key references Courses(crs_id) 
	ON DELETE CASCADE not null
)
go 

------------exam_ questions -------------
create table Exam_questions (
exam_id int foreign key references Exams(exam_id) 
	on delete cascade,
q_no int foreign key references Questions(q_no),
PRIMARY KEY (exam_id, q_no)
)
go 

-------------Student_exams------------
create table Student_exams (
st_id int foreign key references Students(st_id) 
	ON DELETE CASCADE,
exam_id int foreign key references Exams(exam_id) ,
grade varchar(50) not null,
primary key(st_id , exam_id)
)
go
------------Student_answers----------
create table Student_answers (
st_answer char(1) not null ,
st_id int foreign key references Students(st_id) 
	on delete cascade,
exam_id int foreign key references Exams(exam_id),
q_no int foreign key references Questions(q_no),
primary key(st_id , exam_id , q_no)
)

