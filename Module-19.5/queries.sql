create table students(
  student_id serial primary key,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  email varchar(100) unique not null,
  phone varchar(20),
  country varchar(50) not null,
  enrollment_date date
)

insert into students(student_id, first_name, last_name, email, phone, country, enrollment_date)
values 
(1, 'Rahim', 'Uddin', 'rahim@email.com', '01711111111', 'Bangladesh', '2023-01-10'),
(2, 'Karim', 'Ahmed', 'karim@email.com', NULL, 'Bangladesh', '2023-01-15'),
(3, 'Sara', 'Khan', 'sara@email.com', '01822222222', 'Pakistan', '2023-02-01'),
(4, 'John', 'Smith', 'john@email.com', NULL, 'USA', '2023-02-10'),
(5, 'Emma', 'Brown', 'emma@email.com', '01933333333', 'UK', '2023-02-20'),
(6, 'Ayaan', 'Ali', 'ayaan@email.com', NULL, 'India', '2023-03-05'),
(7, 'Lina', 'Rahman', 'lina@email.com', '01644444444', 'Bangladesh', '2023-03-12'),
(8, 'Mark', 'Taylor', 'mark@email.com', NULL, 'Australia', '2023-03-25'),
(9, 'Sophia', 'Lee', 'sophia@email.com', '01555555555', 'USA', '2023-04-01'),
(10, 'Daniel', 'Martinez', 'daniel@email.com', NULL, 'Spain', '2023-04-10');



  --QUESTION : 1
select first_name, last_name, coalesce(phone, 'not provided') as phone_num from students;




create table courses(
  course_id serial primary key,
  course_title varchar(150) not null,
  category varchar(50) not null,
  price decimal(10, 2) not null,
  instructor varchar(100),
  published_year integer
)

insert into courses(course_id, course_title, category, price, instructor, published_year)
values 
(1, 'Complete SQL Bootcamp', 'Database', 49.99, 'John Carter', 2021),
(2, 'Advanced JavaScript', 'Programming', 59.99, 'Sarah Miller', 2020),
(3, 'Python for Data Science', 'Data Science', 69.99, 'David Kim', 2022),
(4, 'Web Development with React', 'Programming', 54.99, 'Emily Stone', 2021),
(5, 'Machine Learning Basics', 'AI', 79.99, 'Andrew Ng', 2019),
(6, 'Cloud Computing Fundamentals', 'Cloud', 64.99, 'James Allen', 2020),
(7, 'UI/UX Design Essentials', 'Design', 39.99, 'Laura Scott', 2022),
(8, 'DevOps for Beginners', 'DevOps', 74.99, 'Michael Brown', 2023);


--Question : 2 Show all courses ordered by price (highest to lowest) and limit the result to 5 courses.
select course_title, price from courses order by price desc limit 5;


--Question : 3 Display courses for page 2, assuming 3 courses per page, using LIMIT and OFFSET.
--OFFSET = (Page Number - 1) × Items Per Page     LIMIT = Items Per Page

select * from courses order by course_id limit 3 offset 3;
select * from courses order by course_id limit 3 offset 6;
select * from courses order by course_id limit 3;


--Question : 4 Update the price of all courses in the Programming category by increasing it 10%.
update courses set price = price * 1.10 where category = 'Programming';
select course_title, price, category from courses where category = 'Programming'

--Question : 7 Show course categories where the average course price is greater than 60 using HAVING. 
select category, avg(price) from courses group by category having avg(price) > 60;


create table enrollments(
  enrollment_id serial primary key,
  student_id integer references students(student_id),
  course_id integer references courses(course_id),
  enrollment_date date not null,
  progress_percentage integer,
  paid_amount decimal(10, 2) not null
)

insert into enrollments(enrollment_id, student_id, course_id, enrollment_date, progress_percentage, paid_amount)
values 
(1, 1, 1, '2023-05-01', 80, 49.99),
(2, 2, 2, '2023-05-03', NULL, 59.99),
(3, 3, 3, '2023-05-05', 60, 69.99),
(4, 4, 1, '2023-05-07', 100, 49.99),
(5, 5, 4, '2023-05-10', 40, 54.99),
(6, 6, 5, '2023-05-12', NULL, 79.99),
(7, 7, 2, '2023-06-01', 90, 59.99),
(8, 8, 6, '2023-06-02', 30, 64.99),
(9, 9, 3, '2023-06-03', 70, 69.99),
(10, 10, 7, '2023-06-04', NULL, 39.99),
(11, 1, 8, '2023-06-05', 20, 74.99),
(12, 2, 1, '2023-06-06', 50, 49.99),
(13, 3, 6, '2023-06-07', NULL, 64.99),
(14, 4, 4, '2023-06-08', 85, 54.99),
(15, 5, 5, '2023-06-09', 60, 79.99);

--Question : 5 Delete all enrollment records where progress_percentage is NULL
delete from enrollments where progress_percentage is null;

--Question : 6 Find the total paid amount per course category using GROUP BY.
select category, sum(price) from courses group by category;


--Question : 8 Count how many students are enrolled in each course.
select c.course_title, c.course_id, count(e.student_id) as student_count from courses c left join enrollments e on c.course_id = e.course_id group by c.course_id, c.course_title order by student_count desc; 


--Question : 10 Display student full name, course title, and paid amount using an INNER JOIN.
select concat(s.first_name,' ', s.last_name) as full_name, c.course_title, e.paid_amount from students s 
  join enrollments e on s.student_id = e.student_id 
  join courses c on e.course_id = c.course_id
  order by full_name, c.course_title;


--Question : 11 Display all students and their enrolled courses.Include students who have not enrolled in any course using a LEFT JOIN.
select concat(s.first_name, ' ', s.last_name) as full_name, c.course_title, e.paid_amount from students s 
left join enrollments e on s.student_id = e.student_id
left join courses c on e.course_id = c.course_id 
order by full_name, c.course_title;

--Question : 12 Display all courses and their enrolled students. Include courses that have no enrollments using a RIGHT JOIN.
select c.course_title, coalesce(concat(s.first_name, ' ', s.last_name), 'no student enrolled') as full_name from courses c 
left join enrollments e on c.course_id = e.course_id
left join students s on s.student_id = e.student_id;

--Question : 13 Display all students and all courses, even if there is no matching enrollment, using a FULL JOIN.
select concat(s.first_name, ' ', s.last_name) as full_name, c.course_title from students s 
full join enrollments e on s.student_id = e.student_id
full join courses c on e.course_id = c.course_id
order by full_name, c.course_title;

--Question : 14 Show the number of enrollments per year based on enrollment_date.
select extract(year from enrollment_date) as enrollment_year, count(*) as number_of_enrollments from enrollments group by extract(year from enrollment_date);


--Question : 15 Find the average progress percentage per course, ignoring NULL values.
select c.course_title, avg(e.progress_percentage) from enrollments e 
left join courses c on e.course_id = c.course_id
group by c.course_title;


SELECT 
    c.course_title,
    AVG(e.progress_percentage) AS avg_progress,
    COUNT(e.progress_percentage) AS non_null_count,
    COUNT(*) AS total_enrollments
FROM courses c  -- Start with ALL courses!
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
ORDER BY c.course_title;



