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
