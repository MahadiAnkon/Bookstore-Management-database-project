--LAB 9

--TRIGGER
drop trigger check_price;
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
CREATE VIEW DetailsView AS
SELECT title,price
FROM book
WHERE code < 5;
SELECT * FROM DetailsView;
