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
