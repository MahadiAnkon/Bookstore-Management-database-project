drop table writtenby;
drop table Book;
drop table shoppingbasket;
drop table customer;
drop table publisher;
drop table Author;
drop table warehouse;



create table publisher(
	name varchar(20) not null,
	address varchar(40),
	phone number(14),
	url varchar(20),
	primary key(name));

create table customer(
	name varchar(20),
	address varchar(20),
	email varchar(40) not null,
	phone number(20),
	primary key(email));

create table shoppingbasket(
		basketid number(10) not null,
		primary key(basketid),
		email varchar(40),
		foreign key(email) references customer(email) on delete cascade);

create table warehouse(
	address varchar(20),
	phone number(14),
	wcode integer not null,
	stockLeft integer,
	primary key(wcode));

Create table Book(
	code integer not null,
	title varchar(20),
	price integer,
	year number(10),
	name varchar(20),
	wcode integer,
	basketid number(10),
	primary key(code),
	foreign key(name) references publisher(name) on delete cascade,
	foreign key(basketid) references shoppingbasket(basketid) on delete cascade,
	foreign key(wcode) references warehouse(wcode) on delete cascade);

create table Author(
	url varchar(30),
	name varchar(20) not null,
	address varchar(40),
	primary key(name));

create table writtenby(
	code integer not null,
	name varchar(20) not null,
	primary key(code,name),
	foreign key(code) references Book(code) on delete cascade,
	foreign key(name) references Author(name) on delete cascade);


insert into publisher values('Okkhorpotro','Nazrul Avenue',01312679384,'www.okkhorpotro.com');
insert into publisher values('Lecture','Nilkhet',01312679385,'www.lecture.com');
insert into publisher values('Shomoy','Farmgate',01312679384,'www.oshomy.com');
insert into publisher values('Ononna','Mirpur',01312679384,'www.ononna.com');
insert into publisher values('Sheba','Bogura',01312679384,'www.sheba.com');

insert into customer values('Argho','Jashore','argho1807066@gmail.com',01413679384);
insert into customer values('Sadi','Dhaka','sadi1807073@gmail.com',01413679385);
insert into customer values('Shafin','Sylhet','shafin1807074@gmail.com',01413679386);
insert into customer values('Emon','Bogura','emon1807072@gmail.com',01413679387);
insert into customer values('Shoriful','Bogura','shoriful1807082@gmail.com',01413679388);


insert into shoppingbasket values(123,'argho1807066@gmail.com');
insert into shoppingbasket values(124,'sadi1807073@gmail.com');
insert into shoppingbasket values(125,'argho1807066@gmail.com');
insert into shoppingbasket values(126,'shafin1807074@gmail.com');
insert into shoppingbasket values(127,'emon1807072@gmail.com');


insert into warehouse values('Dhaka',01725823223,5321,231);
insert into warehouse values('Comilla',01725823224,5322,3434);
insert into warehouse values('Jashore',01725823225,5333,523);
insert into warehouse values('Bogura',01725823226,5334,34423);
insert into warehouse values('Khulna',01725823227,5335,343);


insert into Book values(1,'Angels and Demons',890,2002,'Okkhorpotro',5322,125);
insert into Book values(2,'The Alchemist',790,2003,'Okkhorpotro',5321,127);
insert into Book values(3,'Ami Topu',595,1994,'Sheba',5334,124);
insert into Book values(4,'The Vinci Code',640,2010,'Shomoy',5335,123);
insert into Book values(5,'Inferno',840,2000,'Lecture',5333,126);

insert into Author values('www.fb.com/danbrown','Dan Brown','USA');
insert into Author values('www.fb.com/charlesdickens','Charles Dickens','UK');
insert into Author values('www.fb.com/salha','Salha Obeid','UAE');
insert into Author values('www.fb.com/paulocoelho','Paulo Coelho','Brazil');
insert into Author values('www.fb.com/jafariqbal','Jafar Iqbal','Bangladesh');

insert into writtenby values(4,'Dan Brown');
insert into writtenby values(1,'Dan Brown');
insert into writtenby values(5,'Dan Brown');
insert into writtenby values(2,'Paulo Coelho');
insert into writtenby values(3,'Jafar Iqbal');
