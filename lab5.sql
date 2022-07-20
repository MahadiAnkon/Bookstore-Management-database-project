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
