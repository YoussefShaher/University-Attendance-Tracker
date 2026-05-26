IF OBJECT_ID('dbo.Attendance','U') IS NOT NULL DROP TABLE dbo.Attendance;
IF OBJECT_ID('dbo.Enrollment','U') IS NOT NULL DROP TABLE dbo.Enrollment;
IF OBJECT_ID('dbo.AttendanceType','U') IS NOT NULL DROP TABLE dbo.AttendanceType;
IF OBJECT_ID('dbo.UserAccount','U') IS NOT NULL DROP TABLE dbo.UserAccount;
IF OBJECT_ID('dbo.DepartmentHead','U') IS NOT NULL DROP TABLE dbo.DepartmentHead;
IF OBJECT_ID('dbo.Schedule','U') IS NOT NULL DROP TABLE dbo.Schedule;
IF OBJECT_ID('dbo.Room','U') IS NOT NULL DROP TABLE dbo.Room;
IF OBJECT_ID('dbo.Course','U') IS NOT NULL DROP TABLE dbo.Course;
IF OBJECT_ID('dbo.Instructor','U') IS NOT NULL DROP TABLE dbo.Instructor;
IF OBJECT_ID('dbo.Student','U') IS NOT NULL DROP TABLE dbo.Student;
IF OBJECT_ID('dbo.Semester','U') IS NOT NULL DROP TABLE dbo.Semester;
IF OBJECT_ID('dbo.Program','U') IS NOT NULL DROP TABLE dbo.Program;
IF OBJECT_ID('dbo.Department','U') IS NOT NULL DROP TABLE dbo.Department;

CREATE TABLE Department (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Program (
    program_id INT IDENTITY(1,1) PRIMARY KEY,
    program_name VARCHAR(100) NOT NULL,
    degree_type VARCHAR(30) NOT NULL
);

CREATE TABLE Semester (
    semester_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE
);

CREATE TABLE Instructor (
    instructor_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Student (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    department_id INT,
    program_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id),
    FOREIGN KEY (program_id) REFERENCES Program(program_id)
);

CREATE TABLE Course (
    course_id INT IDENTITY(1,1) PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL,
    course_name VARCHAR(150) NOT NULL,
    credit_hours INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Room (
    room_id INT IDENTITY(1,1) PRIMARY KEY,
    building VARCHAR(100),
    room_number VARCHAR(20),
    capacity INT
);

CREATE TABLE Schedule (
    schedule_id INT IDENTITY(1,1) PRIMARY KEY,
    room_id INT NOT NULL,
    day_of_week VARCHAR(15),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

CREATE TABLE Enrollment (
    enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    enroll_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
);

CREATE TABLE AttendanceType (
    type_id INT IDENTITY(1,1) PRIMARY KEY,
    type_name VARCHAR(30),
);

CREATE TABLE Attendance (
    attendance_id INT IDENTITY(1,1) PRIMARY KEY,
    schedule_id INT NOT NULL,
    student_id INT NOT NULL,
    attendance_date DATE,
    type_id INT NOT NULL,
    remark VARCHAR(200),
    FOREIGN KEY (schedule_id) REFERENCES Schedule(schedule_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (type_id) REFERENCES AttendanceType(type_id)
);

CREATE TABLE UserAccount (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL, -- 'student','instructor','admin'
    linked_id INT NULL -- can store student_id or instructor_id depending on role
);

CREATE TABLE DepartmentHead (
    head_id INT IDENTITY(1,1) PRIMARY KEY,
    instructor_id INT NOT NULL,
    department_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);