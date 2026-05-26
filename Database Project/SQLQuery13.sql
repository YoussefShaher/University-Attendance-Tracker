INSERT INTO Department (name) VALUES
('Computer Science'),('Information Systems'),('Mathematics'),('Physics'),('Chemistry'),
('Biology'),('Business'),('Economics'),('English'),('History');

INSERT INTO Program (program_name, degree_type) VALUES
('BSc Computer Science','BSc'),('BSc Information Systems','BSc'),('BSc Mathematics','BSc'),
('BSc Physics','BSc'),('BSc Chemistry','BSc'),('BSc Biology','BSc'),('BBA Business','BSc'),
('BA Economics','BSc'),('BA English','BA'),('BA History','BA');

INSERT INTO Semester (name, start_date, end_date) VALUES
('Fall 2024','2024-09-01','2024-12-31'),
('Spring 2025','2025-02-01','2025-05-31'),
('Summer 2025','2025-06-01','2025-08-15'),
('Fall 2025','2025-09-01','2025-12-31'),
('Spring 2026','2026-02-01','2026-05-31'),
('Summer 2026','2026-06-01','2026-08-15'),
('Fall 2026','2026-09-01','2026-12-31'),
('Spring 2027','2027-02-01','2027-05-31'),
('Summer 2027','2027-06-01','2027-08-15'),
('Fall 2027','2027-09-01','2027-12-31');

INSERT INTO Instructor (first_name,last_name,email,department_id) VALUES
('Ahmed','Ali','a.ali@uni.edu',1),
('Mona','Saeed','m.saeed@uni.edu',2),
('Omar','Hassan','o.hassan@uni.edu',1),
('Sara','Khalid','s.khalid@uni.edu',3),
('Hany','Farouk','h.farouk@uni.edu',4),
('Laila','Nabil','l.nabil@uni.edu',5),
('Tamer','Youssef','t.youssef@uni.edu',6),
('Nour','Adel','n.adel@uni.edu',7),
('Ramy','Ibrahim','r.ibrahim@uni.edu',8),
('Dina','Moussa','d.moussa@uni.edu',9);

INSERT INTO Student (first_name,last_name,email,department_id,program_id) VALUES
('Youssef','El-Sayed','y.el-sayed@student.uni.edu',1,1),
('Khaled','Mahmoud','k.mahmoud@student.uni.edu',1,1),
('Mariam','Omar','m.omar@student.uni.edu',2,2),
('Ahmed','Reda','a.reda@student.uni.edu',3,3),
('Fatma','Ali','f.ali@student.uni.edu',4,4),
('Hassan','Yahia','h.yahia@student.uni.edu',5,5),
('Salma','Naguib','s.naguib@student.uni.edu',6,6),
('Ibrahim','Hassan','i.hassan@student.uni.edu',7,7),
('Nada','Sami','n.sami@student.uni.edu',8,8),
('Leila','Hossam','l.hossam@student.uni.edu',9,9);

INSERT INTO Course (course_code,course_name,credit_hours,department_id) VALUES
('CS101','Intro to Programming',3,1),
('CS102','Data Structures',3,1),
('IS201','Database Systems',3,2),
('MATH101','Calculus I',4,3),
('PHYS101','Mechanics',3,4),
('CHEM101','General Chemistry',3,5),
('BIO101','Intro Biology',3,6),
('BUS101','Principles of Management',3,7),
('ECON101','Microeconomics',3,8),
('ENG101','English Composition',2,9);

INSERT INTO Room (building,room_number,capacity) VALUES
('Engineering','E101',60),('Engineering','E102',40),('CS Building','C201',80),
('Main Hall','M01',200),('Science','S12',45),('Science','S14',35),('Business','B01',60),
('Economics','E201',50),('Humanities','H10',30),('Library','L01',20);

INSERT INTO Schedule (room_id,day_of_week,start_time,end_time) VALUES
(3,'Monday','09:00','10:30'),
(3,'Wednesday','09:00','10:30'),
(1,'Tuesday','11:00','12:30'),
(2,'Thursday','13:00','14:30'),
(4,'Monday','10:00','12:00'),
(5,'Friday','08:30','10:00'),
(6,'Wednesday','14:00','15:30'),
(7,'Tuesday','09:00','10:30'),
(8,'Thursday','11:00','12:30'),
(9,'Friday','12:00','13:30');

INSERT INTO Enrollment (student_id,enroll_date) VALUES
(1,'2024-09-05'),
(2,'2024-09-05'),
(3,'2024-09-06'),
(4,'2024-09-07'),
(5,'2024-09-05'),
(6,'2025-02-10'),
(7,'2025-02-10'),
(8,'2025-02-11'),
(9,'2025-06-01'),
(10,'2025-06-02');

INSERT INTO AttendanceType (type_name) VALUES
('Present'),('Absent'),('Late'),('Excused'),('Sick'),('Field Trip'),('Online'),('Makeup'),('Early Leave'),('Other');

INSERT INTO Attendance (schedule_id,student_id,attendance_date,type_id,remark) VALUES
(1,1,'2024-09-10',1,'On time'),
(2,2,'2024-09-12',1,''),
(1,2,'2024-09-10',3,'5 minutes late'),
(3,3,'2024-09-11',2,'Absent - sick'),
(4,4,'2024-09-14',1,''),
(5,5,'2024-09-15',4,'Excused'),
(6,6,'2025-02-15',1,''),
(7,7,'2025-02-18',1,''),
(8,8,'2025-02-19',2,'No show'),
(9,9,'2025-06-05',1,'');

INSERT INTO UserAccount (username,password_hash,role,linked_id) VALUES
('youssef','hash_a','student',1),
('khaled','hash_b','student',2),
('mariam','hash_c','student',3),
('a.reda','hash_d','student',4),
('hassan','hash_e','student',6),
('a.ali','hash_f','instructor',1),
('m.saeed','hash_g','instructor',2),
('o.hassan','hash_h','instructor',3),
('admin','hash_admin','admin',NULL),
('dina','hash_i','instructor',10);

INSERT INTO DepartmentHead (instructor_id,department_id,start_date,end_date) VALUES
(1,1,'2024-01-01',NULL),
(2,2,'2024-01-01',NULL),
(3,1,'2022-01-01','2023-12-31'),
(4,3,'2024-02-01',NULL),
(5,4,'2024-03-01',NULL),
(6,5,'2024-01-01',NULL),
(7,6,'2024-01-01',NULL),
(8,7,'2024-01-01',NULL),
(9,8,'2024-01-01',NULL),
(10,9,'2024-01-01',NULL);