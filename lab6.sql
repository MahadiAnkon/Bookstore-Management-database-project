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
