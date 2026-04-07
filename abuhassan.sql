--final abuhassan
create database final
drop table if exists auther
create table auther
(
autherid  int  primary key,
age int,
first_name varchar(15),
last_name varchar(15),
natonality varchar(10),
);
ALTER TABLE auther
ALTER COLUMN age VARCHAR(5);
ALTER TABLE auther
ALTER COLUMN natonality VARCHAR(15);



CREATE TABLE member (
    memberid int PRIMARY KEY,
    first_name varchar(15),
    last_name varchar(15),
    age int,
    states varchar(10) CHECK (states IN ('active', 'not active'))
);




drop table if exists staff
create table staff
(
staffid int primary key,
SSN int not null unique,
first_name varchar(15),
last_name varchar(15),
salary decimal(3,2),
);
alter table staff
ALTER COLUMN salary decimal(12,5);



drop table if exists section
create table section
(
number int primary key,
staffid int unique,
category varchar(15),
);
ALTER TABLE section
ALTER COLUMN category nVARCHAR(25);
alter table section 
add constraint sec_fk FOREIGN KEY(staffid) REFERENCES staff(staffid);



drop table if exists book;
create table book
(
    bookid int primary key,
    title nvarchar(25),
    category nvarchar(15),
    genres nvarchar(15)
);
ALTER TABLE book
ALTER COLUMN title nVARCHAR(125);
alter table book
alter column genres nvarchar(50);





	drop table if exists transactions;
create table transactions
(
transactionid int primary key,
memberid int,
bookid int,
type varchar(10) CHECK (type IN ('metaphor', 'return'))
);
alter table transactions
    add constraint trans_fk FOREIGN KEY(memberid) REFERENCES member;
	alter table transactions
    add constraint trans_fk_book FOREIGN KEY(bookid) REFERENCES book;



	drop table if exists book_auther;
create table book_auther
(
autherid int,
bookid int,
primary key(bookid),
);
alter table book_auther
    add constraint ba_fk FOREIGN KEY(autherid) REFERENCES auther;
alter table book_auther
    add constraint b_fk FOREIGN KEY(bookid) REFERENCES book;



	drop table if exists book_section;
create table book_section
(
bookid int,
number int,
primary key(bookid),
);
alter table book_section
  add constraint bs_fk foreign key(bookid) references book;
alter table book_section
  add constraint bss_fk foreign key(number) references section;



   drop table if exists transaction_date;
create table transaction_date
(
transactionid int primary key,
date_of_metaphor date not null,
return_date date ,
fine decimal(2,1) default(0),
);
alter table transaction_date
add constraint td_fk foreign key(transactionid) references transactions;

drop table if exists staff_phone
create table staff_phone
(
staffid int,
phone int unique,
primary key(staffid,phone),
);
alter table staff_phone
add constraint sp_fk foreign key(staffid) references staff;



drop table if exists staff_section
create table staff_section
(
staffid int,
number int,
primary key(staffid),
);
alter table staff_section
add constraint ss_fk foreign key(staffid) references staff;
alter table staff_section
add constraint st_fk foreign key(number) references section;



drop table if exists member_phone
create table member_phone
(
memberid int,
member_phone int unique,
primary key(memberid,member_phone),
);
alter table member_phone
add constraint mp_fk foreign key(memberid)references member;



drop table if exists sectoin_location
create table section_location
(
number int,
location varchar(100),
primary key (number,location),
);
alter table section_location
add constraint sl_fk foreign key(number) references section;



insert into auther (autherid,age,first_name,last_name,natonality)values
(1,'60','jamal','Abuhassan','jordanian'),
(2,'53','amal','khattab','jordanian'),
(3,'death','abdallah','ibnalmukafaa','Iranian'),
(4,'52','abdallah','albarghothy','palastinain'),
(5,'death','abdalqader','khattab','palastinain'),
(6,'52','ayman','alotoom','jordanian'),
(7,'death','alkhalel','alfraheedy','iraqi'),
(8,'death','najeeb','alkylani','Egyptian'),
(9,'death','ismaeel','aldemashqy','Syrian'),
(10,'death','mohammad','alzahaby','Syrian');



insert into staff(staffid,SSN,first_name,last_name,salary) values
(1,1,'ahmad','qadomy',240.5),
(2,2,'abdalrahman','abumazen',456.1),
(3,3,'ameen','thneibat',500),
(4,4,'mohammad','wael',486.7),
(5,5,'ezaldeen','alayed',750),
(6,6,'omar','mallak',200),
(7,7,'zaid','alzubi',635.95),
(8,8,'abdallah','altamimi',400),
(9,9,'adam','alamro',756.54),
(10,10,'ameer','marmash',999.99);



insert into section (number,staffid,category) values
(101,1,N'ديني'),
(102,2,N'قصص'),
(103,3,N'سيرة ذاتية'),
(104,4,N'روايات'),
(105,5,N'ادب عربي'),
(106,6,N'تاريخي');



insert into book (bookid,title,category,genres) values
(1,N'العلاقة بين الانسان والجان كما يصورها القران',N'ديني',N'مجلة ال البيت'),
(2,N'تقاليد الزواج حوادثها ومحدثاتها وموقف الشريعة الاسلامية منها',N'ديني',N'دار الفتح'),
(3,N'كليلة و دمنة',N'قصص',null),
(4,N'امير الظل: مهندس على الطريق',N'سيرة ذاتية',N'دار البرغوثي'),
(5,N'الشمس خلف الغيوم',N'سيرة ذاتية',N'دار الطليعة العلمية'),
(6,N'يا صاحبي السجن',N'روايات',N'المؤسسة العربية للدراسات'),
(7,N'العروض',N'ادب عربي',null),
(8,N'رأس الشيطان',N'روايات',N'دار الصحوة'),
(9,N'البداية والنهاية',N'تاريخي',null),
(10,N'الطب النبوي',N'ديني',null),
(11,N'يسمعون حسيسها',N'روايات',N'المؤسسة العربية للدراسات'),
(12,N'اسئلة الكنيسة',N'ديني',N'دار ورد'),
(13,N'دراسة ما روي عن عثمان في شأن لحن القران',N'ديني',N'دار الفتح'),
(14,N'المقصلة وجواسيس الشاباك الصهيوني',N'روايات',N'دار البرغوثي'),
(15,N'الميزان جهاد الدعوة و دعوة المجاهدين',N'روايات',N'دار البرغوثي'),
(16,N'معاني الحروف',N'ادب عربي',null),
(17,N'التكميل في الجرح والتعديل ومعرفة الثقات والضعفاء والمجاهيل',N'تاريخي',null),
(18,N'العبر في خبر من عبر',N'ديني',null),
(19,N'الأدب الكبير و الأدب الصغير',N'ادب عربي',null),
(20,N'فلسطين العاشقة والمعشوق',N'ادب عربي',N'دار البرغوثي');



INSERT INTO member (memberid, first_name, last_name, age, states) VALUES
    (1, 'abdallah', 'hesham', 20, 'active'),
    (2, 'omar', 'hasan', 20, 'not active'),
    (3, 'mohammad', 'kanaan', 20, 'active'),
    (4, 'malek', 'Abualsamen', 23, 'not active'),
    (5, 'fuad', 'jaber', 26, 'active'),
    (6, 'own', 'tarawneh', 20, 'not active'),
    (7, 'hamza', 'abusaleh', 20, 'active'),
    (8, 'mohammad', 'khaled', 20, 'not active'),
    (9, 'yousef', 'musabeh', 20, 'active'),
    (10, 'amro', 'dannoun', 20, 'not active');




insert into transactions(transactionid,memberid,bookid,type) values
(1,10,20,'metaphor'),
(2,9,19,'return'),
(3,8,18,'metaphor'),
(4,7,17,'return'),
(5,6,16,'metaphor'),
(6,5,15,'return'),
(7,4,14,'metaphor'),
(8,3,13,'return'),
(9,2,12,'metaphor'),
(10,1,11,'return');



insert into book_auther(bookid,autherid) values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,6),
(12,5),
(13,1),
(14,4),
(15,4),
(16,7),
(17,9),
(18,10),
(19,3),
(20,4);



insert into book_section(bookid,number) values
(1,101),
(2,101),
(3,102),
(4,103),
(5,103),
(6,104),
(7,105),
(8,104),
(9,106),
(10,101),
(11,104),
(12,101),
(13,101),
(14,104),
(15,104),
(16,105),
(17,106),
(18,101),
(19,105),
(20,105);



insert into member_phone(memberid,member_phone) values
(1,0790683438),
(2,0795766025),
(3,0791614524),
(4,0796041896),
(5,0772304768),
(6,0797224679),
(7,0778064473),
(8,0791325717),
(9,0782403411),
(10,0792095512);



insert into transaction_date(transactionid,date_of_metaphor,return_date,fine) values
(1,'1-2-2024','1-9-2024',default),
(2,'12-21-2023','12-26-2023',default),
(3,'1-7-2024','1-14-2024',default),
(4,'12-22-2023','12-31-2023',3.5),
(5,'1-8-2024','1-15-2024',default),
(6,'12-31-2023','1-8-2024',default),
(7,'1-5-2024','1-12-2024',default),
(8,'11-10-2023','11-25-2024',9.9),
(9,'1-3-2024','1-10-2024',default),
(10,'12-26-2023','1-2-2024',default);



insert into staff_phone(staffid,phone) values
(1,0798340297),
(2,0781088077),
(3,0799911493),
(4,0775742633),
(5,0788129088),
(6,0776952265),
(7,0795665634),
(8,0799634207),
(9,0799999169),
(10,0781709477);



insert into staff_section (staffid,number) values
(1,101),
(2,102),
(3,103),
(4,104),
(5,105),
(6,106),
(7,101),
(8,104),
(9,101),
(10,103);



insert into section_location (number,location) values
(101,'Next to the reception'),
(102,'On the right side of Section 101'),
(103,'On the right side of Section 102'),
(104,'Behind Section 103'),
(105,'On the left side of Section 104'),
(106,'On the left side of Section 105');
/*
-------------------------------------------------------------------
CREATE VIEW staff_phone_info
AS
SELECT
  staff.staffid,
  staff.first_name+''+staff.last_name as staff_name,
  staff_phone.phone
FROM
  staff
INNER JOIN
  staff_phone
ON
  staff.staffid = staff_phone.staffid;
  select * from staff_phone_info
-------------------------------------------------------------------------------------
CREATE VIEW member_phone_info
AS
SELECT
  member.memberid,
  member.first_name+' '+member.last_name as member_name,
  member_phone.member_phone
FROM
  member
INNER JOIN
  member_phone
ON
  member.memberid = member_phone.memberid;

  select * from member_phone_info
  ---------------------------------------------------------------------------------
  CREATE VIEW books_by_genres AS
SELECT
  genres,
  COUNT(*) AS books_count
FROM
  book
GROUP BY
  genres;
  select * from books_by_genres
  where 
  genres is not null
  ---------------------------------------------------------------------------------------
  CREATE VIEW all_book AS
SELECT
  book.bookid,
  book.title,
  book.category,
  book.genres,
  auther.first_name + ' ' + auther.last_name as auther_fullname
FROM
  book
INNER JOIN
  book_auther
ON
  book.bookid = book_auther.bookid
INNER JOIN
  auther
ON
  book_auther.autherid = auther.autherid;
select * from all_book
------------------------------------------------------------------------------------------
CREATE VIEW active_members AS
SELECT
  member.memberid,
  member.first_name+''+member.last_name as member_name
FROM
  member
WHERE
  member.states = 'active';
  select * from active_members
 ------------------------------------------------------------------------------------------
 CREATE PROCEDURE update_staff
(
  @staffid INT,
  @SSN INT,
  @first_name VARCHAR(15),
  @last_name VARCHAR(15),
  @salary DECIMAL(12,5)
)
AS
BEGIN
  UPDATE staff
  SET SSN = @SSN,
      first_name = @first
---------------------------------------------------------------------------------------------
CREATE PROCEDURE update_book
(
   @bookid INT,
  @title NVARCHAR(125),
  @category NVARCHAR(25),
  @genres NVARCHAR(15)
)
AS
BEGIN
  UPDATE book
  SET 
      title = @title,
      category = @category,
      genres = @genres
  WHERE bookid = @bookid;
END;
------------------------------------------------------------------------------------------------
CREATE PROCEDURE update_author
(
  @auther_id INT,
  @age INT,
  @first_name VARCHAR(15),
  @last_name VARCHAR(15),
  @nationality VARCHAR(15)
)
AS
BEGIN
  UPDATE auther
  SET age = @age,
      first_name = @first_name,
      last_name = @last_name,
      nationality = @nationality
  WHERE auther_id = @auther_id;
END;
---------------------------------------------------------------------------------------------------
CREATE PROCEDURE ShowStaffBySection(@sectionNumber INT)
AS
BEGIN
    SELECT  s.first_name+' '+ s.last_name as staff_name
    FROM staff s
    JOIN staff_section ss ON s.staffid = ss.staffid
    WHERE ss.number = @sectionNumber;
END;
exec ShowStaffBySection @sectionNumber=101;
-----------------------------------------------------------------------------------------------------
CREATE PROCEDURE ShowAuthorNationality(@autherid INT)
AS
BEGIN
    SELECT first_name+''+last_name as 'auther_name', natonality
    FROM auther
    WHERE autherid = @autherid;
END;
exec ShowAuthorNationality @autherid=4;
--------------------------------------------------------------------------------------------------
CREATE PROCEDURE GetBooksByCategory(@category NVARCHAR(15))
AS
BEGIN
    SELECT *
    FROM book
    WHERE category = @category;
END;
exec GetBooksByCategory @category =N'ديني';
----------------------------------------------------------------------------------------------------
CREATE PROCEDURE get_books_by_member
(
  @memberid INT
)
AS
BEGIN
  SELECT
    b.bookid,
    b.title,
   b. category,
    b.genres
  FROM transactions
  INNER JOIN book b
    ON transactions.bookid = b.bookid
  WHERE memberid = @memberid
  AND type = 'metaphor';
END;
EXEC get_books_by_member @memberid = 3; 
--------------------------------------------------------------------------------------------------
CREATE PROCEDURE get_books_by_author
(
  IN authorid INT
)
AS
BEGIN
  SELECT
    bookid,
    title,
    category,
    genres
  FROM book
  INNER JOIN book_auther
    ON book.bookid = book_auther.bookid
  WHERE autherid = @authorid;
END;ٍ
-----------------------------------------------------------------------------------------------------
CREATE PROCEDURE delete_author
(
  @auther_id INT
)
AS
BEGIN
  DELETE FROM auther
  WHERE auther_id = @auther_id;
END;
---------------------------------------------------------------------------------------------
CREATE PROCEDURE add_staff
(
  @staff_id INT,
  @SSN INT,
  @first_name VARCHAR(15),
  @last_name VARCHAR(15),
  @salary DECIMAL(12,5)
)
AS
BEGIN
  INSERT INTO staff (staff_id, SSN, first_name, last_name, salary)
  VALUES (@staff_id, @SSN, @first_name, @last_name, @salary);
END;
-------------------------------------------------------------------------------------------------
CREATE PROCEDURE add_book
(
  @bookid INT,
  @title NVARCHAR(125),
  @category NVARCHAR(25),
  @genres NVARCHAR(15)
)
AS
BEGIN
  INSERT INTO book (bookid, title, category, genres)
  VALUES (@bookid, @title, @title, @category, @genres);
END;
--------------------------------------------------------------------------------------------
CREATE PROCEDURE add_author
(
  @auther_id INT,
  @age INT,
  @first_name VARCHAR(15),
  @last_name VARCHAR(15),
  @nationality VARCHAR(15)
)
AS
BEGIN
  INSERT INTO auther (auther_id, age, first_name, last_name, nationality)
  VALUES (@auther_id, @age, @first_name, @last_name, @nationality);
END;
--------------------------------------------------------------------------------
/*


