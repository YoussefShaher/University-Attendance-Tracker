-- Department
SELECT * FROM Department ORDER BY name;
SELECT * FROM Department WHERE name LIKE '%Computer%';

-- Program
SELECT * FROM Program ORDER BY degree_type DESC;
SELECT * FROM Program WHERE program_name LIKE '%Business%';

-- Semester
SELECT * FROM Semester ORDER BY start_date DESC;
SELECT * FROM Semester WHERE start_date > '2025-01-01';

-- Instructor
SELECT * FROM Instructor ORDER BY last_name;
SELECT * FROM Instructor WHERE email LIKE '%@uni.edu';

-- Student
SELECT * FROM Student ORDER BY last_name, first_name;
SELECT * FROM Student WHERE department_id = 1;

-- Course
SELECT * FROM Course ORDER BY course_code;
SELECT * FROM Course WHERE credit_hours >= 3;

-- Room
SELECT * FROM Room ORDER BY capacity DESC;
SELECT * FROM Room WHERE building = 'CS Building';

-- Schedule
SELECT * FROM Schedule ORDER BY day_of_week, start_time;
SELECT * FROM Schedule WHERE day_of_week = 'Monday';

-- Enrollment
SELECT * FROM Enrollment ORDER BY enroll_date DESC;
SELECT * FROM Enrollment WHERE student_id = 1;

-- AttendanceType
SELECT * FROM AttendanceType ORDER BY type_name;
SELECT * FROM AttendanceType WHERE type_name LIKE 'P%';

-- Attendance
SELECT * FROM Attendance ORDER BY attendance_date DESC;
SELECT * FROM Attendance WHERE type_id = 2; -- absent

-- UserAccount
SELECT * FROM UserAccount ORDER BY role, username;
SELECT * FROM UserAccount WHERE role = 'instructor';

-- DepartmentHead
SELECT * FROM DepartmentHead ORDER BY start_date DESC;
SELECT * FROM DepartmentHead WHERE instructor_id = 1;

--Like
SELECT * FROM Student WHERE email LIKE '%@student.uni.edu';
SELECT * FROM Instructor WHERE last_name LIKE 'H%';
SELECT * FROM Course WHERE course_name LIKE '%Intro%';
SELECT * FROM Room WHERE building LIKE '%Science%';
SELECT * FROM UserAccount WHERE username LIKE '_a%'; -- usernames beginning with any char then 'a'

-- All Joins

-- Inner Join Instructor - Department
SELECT i.instructor_id,i.first_name,i.last_name,d.name AS department_name
FROM Instructor i
INNER JOIN Department d ON i.department_id = d.department_id;

-- Left Join Student - Enrollment 
SELECT s.student_id, s.first_name, s.last_name, e.enrollment_id
FROM Student s
LEFT JOIN Enrollment e ON s.student_id = e.student_id;

-- Right Join Schedule - Room  

SELECT r.room_id, r.building, r.room_number, s.schedule_id, s.day_of_week
FROM Schedule s
RIGHT JOIN Room r ON s.room_id = r.room_id;

-- Full Outer Join Attendance - AttendanceType
SELECT a.attendance_id,a.attendance_date,at.type_id,at.type_name
FROM Attendance a
FULL OUTER JOIN AttendanceType at ON a.type_id = at.type_id;

-- 5 functions 

-- COUNT enrollments
SELECT COUNT(*) AS total_enrollments FROM Enrollment;

-- SUM room capacities
SELECT SUM(capacity) AS total_capacity FROM Room;

-- AVG credit hours
SELECT AVG(credit_hours) AS avg_credit_hours FROM Course;

-- MIN semester start date
SELECT MIN(start_date) AS earliest_semester FROM Semester;

-- MAX attendance date
SELECT MAX(attendance_date) AS latest_attendance FROM Attendance;