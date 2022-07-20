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

  -- lab 1



  --Describe Tables

  describe writtenby;
  describe Book;
  describe shoppingbasket;
  describe customer;
  describe publisher;
  describe Author;
  describe warehouse;



  --View Table Data;


  select * from writtenby;
  select * from Book;
  select * from shoppingbasket;
  select * from customer;
  select * from publisher;
  select * from Author;
  select * from warehouse;
  --Lab 2

  --add column

  alter table Author add AuthorAge int;
  describe Author;

  --rename column

  alter table Author rename column AuthorAge to AuthorBooks;
  describe Author;

  --modify column
  alter table Author modify AuthorBooks varchar(20);
  describe Author;

  --update value
  select * from Author;
  update Author set AuthorBooks='Angels' where name='Dan Brown';
  select *from Author;

  -- delete values
  select * from Author ;
  delete from Author where AuthorBooks='Angels';
  select * from Author;

  --drop column
  alter table Author drop column AuthorBooks;
  describe Author;
  --Lab 3

  --Select
      --Select All
  select * from Author;
      --Select specific column
  select name,address from Author;
      --select non repeating elements
  select distinct(name) from Author;


      --select with calculation on column
  select (price/5) from book;
      --select with calculation on column with renaming the column
  select (price/5) as reduced_price from book;


  --select and where with condition
  select code,title,name from book where code>2;

  --OR
  select code,title,name from book where code=1 or code=5;

  --AND
  select code,title,name from book where code>1 and price>500;

  --BETWEEN
  select code,title,name from book where price between 500 and 800;

  --NOT BETWEEN
  select code,title,name from book where price not between 500 and 800;

  --IN
  select code,title,name from book where price in(790,840);

  --NOT IN
  select code,title,name from book where price not in(790,840);

  --LIKE
  select code,title,name from book where title like '%ngel%';

  --Ascending Order
  select code,title,name,price from book order by price;

  --Descending Order
  select code,title,name,price from book order by price desc;

  --order with multiple column
  --Ascending Order
  select code,title,name,price from book order by price,code;

  --order with multiple column
  --Descending Order
  select code,title,name,price from book order by price,code desc;
  --LAB 4

  --Aggregate Functions

  --MAX
  select max(price) from book;

  --COUNT
  select count(*) from book;

  --SUM
  select sum(price) from book;

  --MIN
  select min(price) from book;

  --AVG
  select avg(price) from book;

  --COUNT WITH DISTINCT
  select count(DISTINCT price) from book;

  --COUNT WITH ALL
  select count(all price) from book;

  --GROUP BY
  select name,max(price) from book group by name;

  --HAVING
  select name,max(price) from book group by name having name like '%kkhor%';

  --HAVING WITH AGGREGATE FUNCTIONS
  select name,max(price) from book group by name having max(price)>650;
  --lab5

  --subquery
  select title,price from book where price in(select price from book where price>650);

  --union all
  select title,price from book where price<650
  union all
  select title,price from book where price in(select price from book where price>650);

  --union
  select code,title,price
  from book
  where price>=720
  union
  select code,title,price
  from book
  where price <800;

  --intersect
  select code,title,price
  from book
  where price>=720
  intersect
  select code,title,price
  from book
  where price <800;

  --minus
  select code,title,price
  from book
  where price>=720
  minus
  select code,title,price
  from book
  where price <800;
  --lab6

  --join
  select b.title,p.name,b.price
  from book b,publisher p
  where b.name=p.name;

  --natural join
  select title,price,name as publisher_name,phone as publisher_phone from book natural join publisher;

  --inner join
  select b.title,name,b.price
  from book b inner join publisher p
  using(name);

  --cross join
  select b.title,b.price,p.name as publisher_name,p.phone as publisher_phone from book b cross join publisher p;

  --left outer join
  select b.title,name,b.price from book b left outer join publisher p
  using(name);

  --right outer join
  select b.title,name,b.price from book b right outer join publisher p
  using(name);

  --full outer join
  select b.title,name,b.price from book b full outer join publisher p
  using(name);
  --lab 7

  --pl-sql to get maximum book price:
  SET SERVEROUTPUT ON
  DECLARE
     max_price  book.price%type;
  BEGIN
     SELECT MAX(price)  INTO max_price
     FROM book;
     DBMS_OUTPUT.PUT_LINE('The maximum Price : ' || max_price);
   END;
  /

  --PL_SQL for finding the discounted price for 'Angels and Demons'

  -- 	No discount if the price is less than £500,
  -- 	25% discount if the price is less than £550,
  -- 	40% discount if the price is less than £650.
  -- 	For any other price, the discount is 50%

  SET SERVEROUTPUT ON
  DECLARE
      full_price      book.price%type;
      book_title  VARCHAR2(100);
      discount_price book.price%type;

  BEGIN
      book_title := 'Angels and Demons';

      SELECT price  INTO full_price
      FROM book
      WHERE title like book_title ;

      IF full_price < 500  THEN
                  discount_price := full_price;
      ELSIF full_price >= 500 and full_price <550   THEN
                 discount_price :=  full_price - (full_price*0.25);
      ELSIF full_price >= 550 and full_price <=650 THEN
         discount_price :=  full_price - (full_price*0.4);
     ELSE
  	discount_price :=  full_price - (full_price*0.5);
      END IF;

  DBMS_OUTPUT.PUT_LINE (book_title || 'Full Price: '||full_price||' Disounted Pice: '|| ROUND(discount_price,2));
  EXCEPTION
           WHEN others THEN
  	      DBMS_OUTPUT.PUT_LINE (SQLERRM);
  END;
  /
  SHOW errors
  --lab 8


  --PL/SQL LOOP
  SET SERVEROUTPUT ON
  DECLARE
   CURSOR book_cur IS SELECT code,title FROM book;
   book_record book_cur%ROWTYPE;
  BEGIN
  OPEN book_cur;
   LOOP
   FETCH book_cur INTO book_record;
   EXIT WHEN book_cur%ROWCOUNT > 3;
   DBMS_OUTPUT.PUT_LINE ('Code : ' || book_record.code || ' ' ||
  book_record.title);
   END LOOP;
   CLOSE book_cur;
   END;
   /

  ----PL/SQL FOR LOOP
   set serveroutput on
   declare
       bookprice book.price%type;
       new_price book.price%type;
       bookcode book.code%type;
       bookname book.title%type;
   begin
       for bookcode in 1..5
       loop
         select price,title into bookprice,bookname
           from book
           WHERE code=bookcode;

       IF bookprice<700 then
           new_price:=bookprice;
       elsif bookprice<800 then
           new_price:=bookprice*0.75;
       else
           new_price:=bookprice*0.5;
       end If;

       dbms_output.put_line('Book Name= '||bookname|| '   New Price= '||new_price|| ' ');
       end loop;
   end;
   /


   ----PL/SQL WHILE LOOP
    set serveroutput on
    declare
        bookprice book.price%type;
        new_price book.price%type;
        bookcode book.code%type :=1;
        bookname book.title%type;
    begin
        WHILE bookcode <=5
        loop
          select price,title into bookprice,bookname
            from book
            WHERE code=bookcode;

        IF bookprice<700 then
            new_price:=bookprice;
        elsif bookprice<800 then
            new_price:=bookprice*0.75;
        else
            new_price:=bookprice*0.5;
        end If;

        dbms_output.put_line('Book Name= '||bookname|| '   New Price= '||new_price|| ' ');
        bookcode := bookcode + 1;
        end loop;
    end;
    /

    --PL/SQL Procedure
    set serveroutput on
    create or replace procedure proc is
          bookprice book.price%type;
          new_price book.price%type;
          bookcode book.code%type;
          bookname book.title%type;
      begin
          for bookcode in 1..5
          loop
            select price,title into bookprice,bookname
              from book
              WHERE code=bookcode;

          IF bookprice<700 then
              new_price:=bookprice;
          elsif bookprice<800 then
              new_price:=bookprice*0.75;
          else
              new_price:=bookprice*0.5;
          end If;

          dbms_output.put_line('Book Name= '||bookname|| '   New Price= '||new_price|| ' ');
          end loop;
      end;
      /
      BEGIN
     proc;
    END;
    /

    --LAB 9

--TRIGGER
set serveroutput on;
CREATE OR REPLACE TRIGGER check_price BEFORE INSERT OR UPDATE ON
book
FOR EACH ROW
DECLARE
 c_min constant number(8,2) := 100.0;
 c_max constant number(8,2) := 2000.0;
BEGIN
 IF :new.Price > c_max OR :new.Price < c_min THEN
 RAISE_APPLICATION_ERROR(-20000,'New Price is too small or large');
END IF;
END;
/
insert into book values(6,'Angels',90,2002,'Okkhorpotro',5322,125);

    --Transaction Management
    delete from book;
    select * from book;

    rollback;
    select * from book;


    --SavePoint
    savepoint one;
    delete from book where title like '%Angel%';
    savepoint two;
    select * from book;
    rollback to one;
    select * from book;


    -- Date and time
    select sysdate from dual;
    select current_date from dual;
    select systimestamp from dual;


    --View
    DROP VIEW DetailsView;
    CREATE VIEW DetailsView AS
    SELECT title,price
    FROM book
    WHERE code < 5;
    SELECT * FROM DetailsView;
