--create database Bootcamp;
--use Bootcamp;

create table Students (
	Id int not null primary key identity(1, 1),
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Active bit not null default 1,
	Birthday DateTime not null,
	Loan decimal(8,2)
);

Insert into Students(Firstname, Lastname, Birthday, Loan)
	values('Joe', 'Alvin', '2002-04-13', 40056.29);
Insert into Students(Firstname, Lastname, Active, Birthday)
	values('Mary', 'Frank', 0, '1998-08-16');
Insert into Students(Firstname, Lastname, Birthday, Loan)
	values('KimKel','Penn', '2001-11-23', 25000); 


create table Technology(
	Id int not null primary key identity(100,100),
	Name nvarchar(50) not null,
	PrimaryInstructor nvarchar(30) not null
	);

Insert into Technology(Name, PrimaryInstructor) values ('DotNet', 'Greg');
Insert into Technology(Name, PrimaryInstructor) values ('Java', 'Sean');

create table Cohort (
	id int not null primary key identity(1,1),
	Starts DateTime null,
	Capacity int not null default 0,
	Enrolled int not null default 0,
	TechnologyId int foreign key references Technology(Id)
	);

Select * from Students where Loan is null;

Update Students set Loan = 0
 where loan is null;

 select * from students

Alter table Students
	alter column loan decimal(8,2) not null;

alter table students
	add constraint df_loan default 0 for loan;

Alter table Cohort
	add Note nvarchar(80) not null

Alter table Cohort
	drop column Note;
