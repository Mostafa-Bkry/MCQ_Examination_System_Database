--------------------Insertion Process -----------------
-------------------------------------------------------

USE Examination_System

------------Insert into Departments---------------------
Insert into Departments(Dept_no, Dept_name)
 values	(1, 'Computer Science'       ),
		(2, 'Software Engineering'   ),
		(3, 'Artificial Intelligence');


------------Insert into Instructors-----------------
Insert into Instructors (inst_id, inst_name)
values (1, 'Fatma Tolba'),
	   (2, 'Ali Elmasry'),
	   (3, 'Ahmed Ezz'  );


------------Insert into Courses---------------------
Insert into Courses
values (1, 'DotNet' , 1, 1),
	   (2, 'Mobile' , 2, 2),
	   (3, 'English', 3, 3);


-----------Insert into Topics-----------------------
Insert into Topics (topic_id, topic_name, crs_id)
values	(1, 'SQL'        , 1),
		(2, 'C#'         , 1),
		(3, 'OOP'        , 1),
		(4, 'Asp.net'    , 1),
		(5, 'Web API'    , 1),
		(6, 'Dart'       , 2),
		(7, 'Flutter'    , 2),
		(8, 'Firebase'   , 2),
		(9, 'Vocabulary' , 3),
		(10, 'Grammar'   , 3);


------------Insert into Students----------------------
Insert into Students (st_Fname, st_Lname, dept_no)
values ('Mohammed' ,  'Salama'  , 1),
	   ('Arsany'   ,  'Nashaat' , 2),
	   ('Mohammed' ,  'Hazem'   , 3),
	   ('Moustfa'  ,  'Alaa'    , 1),
	   ('Ziad'     ,  'Haggag'  , Null);


------------Insert into Questions----------------------
Insert into Questions (q_no , question, topic_id)
values(1,'Our vicar is always …………… money for for one cause or another.',9),
	  (2,'The experts were not fully …………… that the animal was puma.',9),
	  -------Grammar-------
	  (3,'It was not until the thirteenth stroke …………… the bell stopped.',10),
	  (4,'They were amazed to find that the goddess …………… to be a very modern-looking woman.',10),
	  -----Vocabulary------
	  (5,'Editors of newspapers and magazines often go to extremes to provide their ………….. withunimportant facts and statistics.',9),
	  (6,'He feels that his rise in …………. is well worth the loss of money.',9),
	  (7,'The dogs are allowed to …………….. outside the enclosure.',9),
	  (8,'After …………. at the display for several minutes, Mr. Taylor went back into his shop.',9),
	  (9,'The silence was suddenly …………. when a large car roared down the decade.',9),
	  -------Grammar-------
	  (10,'Theatrical …………….. and artificial blood had been used to make the injuries look realistic.',10),
	  (11,'You will feel better after you …………. a rest.',10),
	  (12,'When you …………….. next year, the children ………… much taller.',10),
	  (13,'Active: I never hear him shout at his children. Passive: ………………….',10),
	  (14,'Had I known she was sick, I ………… her.',10),
	  (15,'It is imperative that he ……………. The school regulations.',10),
	  (16,'I wish that I ………….. in Hanoi at the end of 1972 to witness the “Battle of Dien Bien Phu inthe Air”.',10),
	  (17,'The decision was postponed, ………….. was exactly what he wanted.',10),
	  (18,'Never ……………. her stand on the deserted station platform.',10),
	  (19,'Please ……………… my luggage ……………. To the airport tomorrow morning.',10),
	  -------Vocabulary-------
	  (20,'There must be a large number of stars with planets which could ……………. Intelligent beings in the universe.',9),
	  -----SQL-----
	  (21, 'What is SQL Server?', 1),
	  (22, 'When was the first version of Microsoft SQL Server released?', 1),
	  (23, 'Which of the following is a free database software running free SQL Server technology?', 1),
	  -----C#------
	  (24, 'What is the output of (int x = 10; int y = 20; int z = x++ + ++y; Console.WriteLine(z);)', 2),
	  (25, 'Which of the following statements about readonly fields in C# is true?', 2),
	  (26, 'What is the purpose of the using statement in C#?', 2),
	  -----OOP-----
	  (27, 'What does the term “encapsulation” refer to in OOP?', 3),
	  (28, 'Which OOP concept allows a class to inherit properties and behaviors from another class?', 3),
	  (29, 'What is the purpose of an interface in OOP?', 3),
	  -----Asp.net-----
	  (30, 'What is the purpose of the ViewState in ASP.NET Web Forms?', 4),
	  (31, 'Which of the following is an ASP.NET component that handles user input and generates HTML output?', 4),
	  (32, 'In ASP.NET, which event occurs after the page has been fully rendered and sent to the client browser?', 4),
	  -----WEB API-----
	  (33, 'What is the primary purpose of ASP.NET Web API?', 5),
	  (34, 'Which HTTP methods are commonly used in ASP.NET Web API for CRUD operations?', 5),
	  (35, 'In ASP.NET Web API, what does the ApiController class provide?', 5)


------------Insert into Questions_answers----------------------
Insert into Question_answers (qa_answer , qa_letter , qa_isTrue , q_no)
values('lifting'   , 'a' , 0 , 1),
	  ('gathering' , 'b' , 0 , 1),
	  ('raising'   , 'c' , 1 , 1),
	  ('asking'    , 'd' , 0 , 1),

	  ('convinced' , 'a' , 1 , 2),
	  ('believed'  , 'b' , 0 , 2),
	  ('found that', 'c' , 0 , 2),
	  ('realized'  , 'd' , 0 , 2),

	  ('so that' , 'a' , 0 , 3),
	  ('that'    , 'b' , 1 , 3),
	  ('before'  , 'c' , 0 , 3),
	  ('when'    , 'd' , 0 , 3),

	  ('turned into' , 'a' , 0 , 4),
	  ('turned over' , 'b' , 0 , 4),
	  ('turned down' , 'c' , 0 , 4),
	  ('turned out ' , 'd' , 1 , 4),

	  ('public'   , 'a' , 1 , 5),
	  ('common'   , 'b' , 0 , 5),
	  ('audience' , 'c' , 0 , 5),
	  ('viewers'  , 'd' , 0 , 5),

	  ('situation'   , 'a' , 0 ,6),
	  ('environment' , 'b' , 0 ,6),
	  ('status'      , 'c' , 1 ,6),
	  ('circumstance', 'd' , 0 ,6),

	  ('graze'  , 'a' , 0 , 7),
	  ('drift'  , 'b' , 0 , 7),
	  ('wonder' , 'c' , 0 , 7),
	  ('wander' , 'd' , 1 , 7),

	  ('admiring' , 'a' , 0 , 8),
	  ('gazing'   , 'b' , 1 , 8),
	  ('glancing' , 'c' , 0 , 8),
	  ('observing', 'd' , 0 , 8),

	  ('broken'    , 'a' , 1 , 9),
	  ('banned'    , 'b' , 0 , 9),
	  ('abolished' , 'c' , 0 , 9),
	  ('postponed' , 'd' , 0 , 9),

	  ('get-together' , 'a' , 0 , 10),
	  ('make-up'      , 'b' , 0 , 10),
	  ('look-out'     , 'c' , 1 , 10),
	  ('go-between'   , 'd' , 0 , 10),

	  ('will have'    , 'a' , 0 , 11),
	  ('are having'   , 'b' , 0 , 11),
	  ('will have had', 'c' , 0 , 11),
	  ('have had'     , 'd' , 1 , 11),

	  ('return / will have grown' , 'a' , 1 , 12),
	  ('return / will grow'       , 'b' , 0 , 12),
	  ('will return / have grown' , 'c' , 0 , 12),
	  ('will return / will grow'  , 'd' , 0 , 12),

	  ('His children are never heard shout at.'       , 'a' , 0 , 13),
	  ('His shout at his children are never heard.'   , 'b' , 0 , 13),
	  ('He is never heard shout at his children.'     , 'c' , 0 , 13),
	  ('He is nerver heard to shout at his children.' , 'd' , 1 , 13),

	  ('visited'           , 'a' , 0 , 14),
	  ('had visited'       , 'b' , 0 , 14),
	  ('would visit'       , 'c' , 0 , 14),
	  ('would have visited', 'd' , 1 , 14),

	  ('obey'       , 'a' , 1 , 15),
	  ('obeys'      , 'b' , 0 , 15),
	  ('would obey' , 'c' , 0 , 15),
	  ('will obey'  , 'd' , 0 , 15),

	  ('was'      , 'a' , 0 , 16),
	  ('were'     , 'b' , 0 , 16),
	  ('had been' , 'c' , 1 , 16),
	  ('has been' , 'd' , 0 , 16),

	  ('that'            , 'a' , 0 , 17),
	  ('which'           , 'b' , 1 , 17),
	  ('who'             , 'c' , 0 , 17),
	  ('none is correct' , 'd' , 0 , 17),

	  ('I will forget to see'       , 'a' , 0 , 18),
	  ('will I forget to see'       , 'b' , 0 , 18),
	  ('will I forget seeing'       , 'c' , 1 , 18),
	  ('will I be forgotten seeing' , 'd' , 0 , 18),

	  ('ask / will be taken' , 'a' , 0 , 19),
	  ('get / being taken'   , 'b' , 0 , 19),
	  ('let / to be taken'   , 'c' , 0 , 19),
	  ('have / taken'        , 'd' , 1 , 19),

	  ('assist'  , 'a' , 0 , 20),
	  ('exist'   , 'b' , 0 , 20),
	  ('support' , 'c' , 1 , 20),
	  ('survive' , 'd' , 0 , 20),

	  ('SQL Server is a relational database management system', 'a', 1, 21),
      ('SQL Server is a software whose main purpose is to store and retrieve data', 'b', 0, 21),
	  ('SQL Server is a highly secure server and does not allow any database file manipulation during execution', 'c', 0, 21),
	  ('All of the mentioned', 'd', 0, 21),

	  ('1989' , 'a' , 1 , 22),
	  ('1990' , 'b' , 0 , 22),
	  ('1988' , 'c' , 0 , 22),
      ('1983' , 'd' , 0 , 22),

      ('SQL Server Web'        , 'a' , 0 , 23),
	  ('SQL Server Enterprise' , 'b' , 0 , 23),
	  ('SQL Server Workgroup'  , 'c' , 0 , 23),
	  ('SQL Server Express'    , 'd' , 1 , 23),

	  ('30' , 'a' , 0 , 24),
	  ('31' , 'b' , 1 , 24),
	  ('32' , 'c' , 0 , 24),
      ('33' , 'd' , 0 , 24),

	  ('readonly fields can be assigned a value only at compile-time.' , 'a' , 0 , 25),
	  ('readonly fields can be modified after object creation.'        , 'b' , 0 , 25),
	  ('readonly fields can be initialized in the constructor.'        , 'c' , 1 , 25),
	  ('readonly fields can be used with static keyword.'              , 'd' , 0 , 25),

      ('To include external libraries in the project.' , 'a' , 0 , 26),
	  ('To define a namespace alias.' , 'b', 0 , 26),
	  ('To manage resources like files, streams, or database connections.' , 'c', 1 , 26),
	  ('To declare a new class.'      , 'd', 0 , 26),

	  ('The process of hiding implementation details and exposing only necessary information.' , 'a' , 1 , 27),
	  ('The act of creating objects from classes.'                      , 'b' , 0 , 27),
	  ('The inheritance of properties and behaviors from a base class.' , 'c' , 0 , 27),
	  ('The ability to override methods in derived classes.'            , 'd' , 0 , 27),

	  ('Polymorphism.'  , 'a' , 0 , 28),
	  ('Abstraction.'   , 'b' , 0 , 28),
	  ('Inheritance.'   , 'c' , 1 , 28),
	  ('Encapsulation.' , 'd' , 0 , 28),

	  ('To define a blueprint for a class.'  , 'a' , 1 , 29),
	  ('To create an instance of a class.'   , 'b' , 0 , 29),
	  ('To encapsulate data within a class.' , 'c' , 0 , 29),
	  ('To override base class methods.'     , 'd' , 0 , 29),

      ('To store session data on the server.' , 'a' , 0 , 30),
	  ('To maintain state information across postbacks for a specific page.' , 'b' , 1 , 30),
	  ('To manage authentication and authorization.' , 'c' , 0 , 30),
	  ('To cache frequently accessed data.' , 'd' , 0 , 30),

      ('Web Service'    , 'a' , 0 , 31),
	  ('Web Form'       , 'b' , 1 , 31),
	  ('Web API'        , 'c' , 0 , 31),
	  ('MVC Controller' , 'd' , 0 , 31),

      ('Page_Load'      , 'a' , 0 , 32),
	  ('Page_Init'      , 'b' , 0 , 32),
	  ('Page_Unload'    , 'c' , 0 , 32),
	  ('Page_PreRender' , 'd' , 1 , 32),

      ('To create dynamic web pages.'    , 'a' , 0 , 33),
	  ('To build RESTful APIs for client-server communication.' , 'b' , 1 , 33),
	  ('To manage database connections.' , 'c' , 0 , 33),
	  ('To handle user authentication.'  , 'd' , 0 , 33),

      ('GET, POST, PUT, DELETE'              , 'a' , 1 , 34),
	  ('SELECT, INSERT, UPDATE, DELETE'      , 'b' , 0 , 34),
	  ('FETCH, ADD, MODIFY, REMOVE'          , 'c' , 0 , 34),
	  ('READ, CREATE, UPDATE, DELETE'        , 'd' , 0 , 34),

      ('A base class for creating custom authentication filters.' , 'a' , 0 , 35),
	  ('A way to define routes for API endpoints.'                , 'b' , 0 , 35),
	  ('Built-in methods for handling HTTP requests.'             , 'c' , 1 , 35),
	  ('Support for session management.'                          , 'd' , 0 , 35);