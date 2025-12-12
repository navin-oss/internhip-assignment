CREATE database Project_db;
--user table--
CREATE TABLE user(
email  varchar(20) PRIMARY KEY,
password VARCHAR(20),
role enum("student","admin")
);

--courses table--
CREATE TABLE courses(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(20),
    description VARCHAR(20),
    fees INT ,
    start_date DATE,
    end_date DATE,
    video_expire_days INT
);

--student table--
CREATE TABLE student (
reg_no INT primary key auto_increment,
name varchar(20),
email varchar(50),
course_id int ,
mobile_no int,
profile_pic BLOB,
FOREIGN KEY (email) REFERENCES user(email),
FOREIGN KEY (course_id) REFERENCES courses(course_id)
); 

--videos table--
CREATE TABLE videos(
    video_id INT PRIMARY KEY,
    course_id INT,
    title VARCHAR(30),
    description VARCHAR(30),
    youtube_url VARCHAR(80),
    added_at DATE
);

--insert into user--
INSERT INTO user VALUES ("s1","nav1234","student"),("s2","nav12345","student"),("s3","nav12346","student"),("s4","nav12347","student");
;

--insert into courses
INSERT INTO courses VALUES(1,"AI","AUTOMATION",5000,"2025-10-3","2025-10-25",25);
(2,"AI","Automation",5000,"2025-10-03","2025-10-25",25),
(3,"ML","Machine Learn",6000,"2025-09-01","2025-09-30",30),
(4,"DSA","Algo + DS",4000,"2025-08-10","2025-09-10",40),
(5,"JAVA","Core Java",4500,"2025-07-01","2025-07-31",20),
(6,"HTML","Web Basics",2000,"2025-06-01","2025-06-20",10);


--insert into student--
INSERT INTO student (name, email, course_id, mobile_no, profile_pic)
VALUES ("navin","s1",1,2147483632,NULL);
('Navin', 's1', 1, 2147483632, NULL),
('Rohan', 's2', 2, 2147483632, NULL),
('Sneha', 's3', 3, 2147483632, NULL),
('Amit',  's4', 4, 2147483632, NULL);


--insert into videos--
INSERT INTO videos values(1,1,"Introduction to ai","AI automation","https://www.youtube.com/watch?v=lt-9uqa7A6c","2025-10-11");
(2,2,"Intro ML","Supervised","https://youtu.be/mVideo1","2025-09-10"),
(3,3,"Arrays DSA","Basics","https://youtu.be/dsaArray","2025-08-15"),
(4,4,"OOP Java","Classes","https://youtu.be/javaOOP","2025-07-05"),
(5,5,"Intro HTML","Tags","https://youtu.be/htmlBasics","2025-06-02");

--join 1 --
SELECT reg_no, s.email, mobile_no, s.course_id, course_name 
FROM student s
JOIN courses c ON s.course_id = c.course_id;

--join2--
SELECT c.course_id,course_name,start_date,end_date,video_expire_days,video_id,title,added_at 
FROM courses c
JOIN videos v ON c.course_id = v.course_id;
