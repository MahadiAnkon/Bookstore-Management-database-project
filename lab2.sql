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
