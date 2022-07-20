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
