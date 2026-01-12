
CREATE TABLE customers(
  customer_id serial primary key,
  first_name varchar(50),
  last_name varchar(50),
  email varchar(100),
  city varchar(50),
  country varchar(50),
  registration_date date
);


INSERT INTO customers(customer_id, first_name, last_name, email, city, country, registration_date)
VALUES
   (1, 'John', 'Smith', 'john.smith@email.com', 'NewYork', 'USA', '2023-01-15'),
   (2, 'Emma', 'Johnson', 'emma.j@email.com', 'London', 'UK', '2023-02-20'),
   (3, 'Michael', 'Brown', 'mbrown@email.com', 'Toronto', 'Canada', '2023-01-10'),
   (4, 'Sophia', 'Davis', 'sophia.d@email.com', 'Sydney', 'Australia', '2023-03-05'),
   (5, 'James', 'Wilson', 'jwilson@email.com', 'NewYork', 'USA', '2023-02-28'),
   (6, 'Oliver', 'Taylor', 'oliver.t@email.com', 'London', 'UK', '2023-04-12'),
   (7, 'Ava', 'Anderson', 'ava.anderson@email.com', 'LosAngeles', 'USA', '2023-03-18'),
   (8, 'William', 'Martinez', 'w.martinez@email.com', 'Madrid', 'Spain', '2023-01-25'),
   (9, 'Isabella', 'Garcia', 'isabella.g@email.com', 'MexicoCity', 'Mexico', '2023-02-14'),
   (10, 'Lucas', 'Rodriguez', 'lucas.r@email.com', 'BuenosAires', 'Argentina', '2023-03-30');


--questions : 2

select country from customers group by country;

--select country from customers;

--QUESTION : 4
alter table customers rename column first_name to customer_first_name;


  --QUESTION : 8
select * from customers where email like '%.com' and country = 'USA' or country = 'UK';

  --QUESTION : 9
--select * from customers where uppercase(concat(customer_first_name, ' ', last_name));
--select last_name from customers where upper(last_name);

select upper(concat(customer_first_name, ' ', last_name)), email, lower(city) from customers where country in('USA', 'UK');




CREATE TABLE books(
  book_id serial primary key,
  title varchar(200),
  author varchar(100),
  genre varchar(50),
  price decimal(10, 2),
  publication_year integer,
  stock_quantity integer
);

INSERT INTO books(book_id, title, author, genre, price, publication_year, stock_quantity) 
VALUES
  (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 12.99, 1925, 45),
  (2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 14.99, 1960, 32),
  (3, '1984', 'George Orwell', 'Science Fiction', 13.99, 1949, 28),
  (4, 'Pride and Prejudice', 'Jane Austen', 'Romance', 11.99, 1813, 50),
  (5, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 12.99, 1951, 22),
  (6, 'Harry Potter and the Sorcerer Stone', 'J.K. Rowling', 'Fantasy', 19.99, 1997, 60),
  (7, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 15.99, 1937, 38),
  (8, 'Brave New World', 'Aldous Huxley', 'Science Fiction', 13.99, 1932, 25),
  (9, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 29.99, 1954, 41),
  (10, 'Animal Farm', 'George Orwell', 'Fiction', 10.99, 1945, 55),
  (11, 'Fahrenheit 451', 'Ray Bradbury', 'Science Fiction', 12.99, 1953, 30),
  (12, 'The Great Adventure', 'John Anderson', 'Fiction', 16.99, 2020, 18),
  (13, 'Mystery in Paris', 'Marie Dubois', 'Mystery', 14.99, 2019, 27),
  (14, 'Romance in Rome', 'Isabella Rossi', 'Romance', 13.99, 2021, 35);


  --QUESTION : 1
select title, price from books order by price asc;

--QUESTION : 3 
select title from books where title like 'The%';


-- QUESTION : 5
select * from books where genre = 'Fantasy';

 --QUESTION : 7
select genre, avg(price) as avgPrice from books group by genre having avg(price) > 14;
















