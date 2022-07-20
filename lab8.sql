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
    
