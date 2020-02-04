use master;
go

drop database if exists testcapstone;
go

create database testcapstone;
go

use testcapstone;
go

create table Users(
	Id int primary key identity(1,1) not null,
	Username nvarchar(30) not null,
	Password nvarchar(30) not null,
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Phone nvarchar(12),
	Email nvarchar(255),
	IsAdmin bit not null default 0,
	IsReviewer bit not null default 0
	);
go

Insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsAdmin, IsReviewer)
	values ('sa', 'sa', 'System', 'Admin', '513-555-7822', 'sys@admin.com', 1, 1);
Insert into Users (Username, Password, Firstname, Lastname, Phone, Email, IsReviewer)
	values ('rv', 'rv', 'System', 'Reviewer', '513-555-1212', 'sys@reviewer.com', 1)
Insert into Users (Username, Password, Firstname, Lastname, Phone, Email)
	values ('us', 'us', 'System', 'User', '513-555-1212', 'sys@user.com'); 

create table Vendors (
	Id int primary key identity (1,1) not null,
	Code nvarchar(30) unique not null,
	Name nvarchar(30) not null,
	Address nvarchar(30) not null,
	City nvarchar(30) not null,
	State nvarchar(2) not null,
	Zip nvarchar(5) not null,
	Phone nvarchar(12),
	Email Nvarchar(255)
);
go

Insert into Vendors(Code, Name, Address, City, State, Zip, Phone, Email)
	values ('1111', 'Amazon', '1212 Amazon Way', 'Erlanger', 'KY', '44202','859-555-1000', 'admin@amazon.com');
Insert into Vendors(Code, Name, Address, City, State, Zip, Phone, Email)
	values ('1112', 'Sears', '33 Tricounty Ave', 'Springdale', 'OH', '45246', '513-555-6678', 'admin@sears.com');
Insert into Vendors(Code, Name, Address, City, State, Zip, Phone, Email)
	values ('1131', 'Staples', '4893 Colerain Ave', 'Cincinnati', 'OH', '45233','513-444-2222', 'admin@staples.com');
Insert into Vendors(Code, Name, Address, City, State, Zip, Phone, Email)
	values ('1134', 'MollyMaids', '789 West Blvd', 'Cincinnati', 'OH', '45248','513-233-5663', 'admin@,ollymaids.com');

Create table Products (
	Id int Primary Key identity(1,1) not null,
	PartNbr nvarchar(30) not null unique,
	Name nvarchar(30) not null,
	Price decimal(11,2) not null,
	Unit nvarchar(30) not null,
	PhotoPath nvarchar(255),
	VendorId int not null Foreign Key references Vendors (Id)
);
go
select * from Vendors
Insert into Products (PartNbr, Name, Price, Unit, VendorId)
	values ('11111', 'Amazon Echo', '99.99', 'Each', '1')
Insert into Products (PartNbr, Name, Price, Unit, VendorId)
	values ('13455', 'Stapler', '15.00', 'Dozen', '3')
Insert into Products (PartNbr, Name, Price, Unit, VendorId)
	values ('56789', 'Cleaning', '200.00', 'Month', '4')
Insert into Products (PartNbr, Name, Price, Unit, VendorId)
	values ('11311', 'Echo Dot', '64.99', 'Each', '1');

create table Requests (
	Id int not null Primary Key identity (1,1),
	Description nvarchar(80) not null,
	Justification nvarchar(80) not null,
	RejectionReason nvarchar(80),
	DeliveryMode nvarchar(20) default 'Pickup',
	Status nvarchar(10) not null default 'NEW',
	Total decimal(11,2) not null default 0,
	UserId int not null Foreign Key references Users (Id)
);
go

Insert into Requests (Description, Justification, RejectionReason, UserID)
	values ('Echo', 'New Class', 'Budget', 1);
Insert into Requests (Description, Justification, RejectionReason, UserID)
	values ('Staplers', 'Old broke', 'None', 3);
Insert into Requests (Description, Justification, RejectionReason, UserID)
	values ('Cleaning', 'CEO visit', 'None', 2);

go

create table RequestLine (
	Id int not null Primary Key identity(1,1),
	RequestId int not null Foreign Key references Requests(Id),
	ProductId int not null Foreign Key references Products(Id),
	Quantity int not null default 1
);
go

Insert into RequestLine (RequestId, ProductId, Quantity)
	values (1, 1, 1);
Insert into RequestLine (RequestId, ProductId, Quantity)
	values (1, 4, 3);
Insert into RequestLine (RequestId, ProductId, Quantity)
	values (2, 2, 1);
Insert into RequestLine (RequestId, ProductId, Quantity)
	values (3, 3, 1);
go

select r.Id, Sum(Quantity * Price) as Total from Requests r
	join RequestLine rl on r.id = rl.RequestId
	join Products p on p.id = rl.ProductId
	group by r.Id  

select Requests set Total = (select r.Id, Sum(Quantity * Price) as Total from Requests r
	join RequestLine rl on r.id = rl.RequestId
	join Products p on p.id = rl.ProductId
	group by r.Id)  
