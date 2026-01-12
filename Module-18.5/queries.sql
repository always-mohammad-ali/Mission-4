
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










