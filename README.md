# University Attendance Tracker

A comprehensive schedule and attendance management system that integrates a polished JavaFX desktop interface with a robust SQL Server database backend. This application securely manages student records, dynamically organizes class timetables, and efficiently tracks weekly attendance.

## Table of Contents

- [Features](#features)
- [Technology Stack](#technology-stack)
- [Database Schema](#database-schema)
- [Installation & Setup](#installation--setup)
- [Database Tables](#database-tables)
- [Core Functionality](#core-functionality)
- [Usage](#usage)
- [Query Examples](#query-examples)
- [Contributing](#contributing)

## Features

✅ **Student Management** - Maintain comprehensive student profiles with department and program information  
✅ **Instructor Management** - Manage instructor records with departmental assignments  
✅ **Schedule Management** - Create and organize class timetables with room assignments  
✅ **Attendance Tracking** - Record and track student attendance with multiple attendance types  
✅ **Enrollment Management** - Handle student course enrollments efficiently  
✅ **Department Management** - Organize departments and assign department heads  
✅ **User Authentication** - Role-based access control (Student, Instructor, Admin)  
✅ **JavaFX Desktop Interface** - Modern, user-friendly GUI  
✅ **SQL Server Backend** - Secure, scalable database backend  

## Technology Stack

- **Frontend**: JavaFX Desktop Application
- **Backend**: SQL Server / SQL Database
- **Language**: Java (with SQL)
- **Architecture**: Desktop Application with Database Integration

## Database Schema

### Entity Relationship Overview

```
Department
├── Program
├── Instructor
│   └── DepartmentHead
├── Student
├── Course
└── Room
    └── Schedule
        └── Attendance
            ├── AttendanceType
            └── Enrollment
UserAccount
```

## Installation & Setup

### Prerequisites

- Java Development Kit (JDK 11 or higher)
- SQL Server (2016 or higher)
- JavaFX SDK

### Database Setup

1. Create a new database in SQL Server
2. Execute `SQLQuery6.sql` to create the database schema
3. Execute `SQLQuery13.sql` to populate initial data
4. Verify the setup by running `SQLQuery14.sql`

### Application Setup

1. Clone the repository
2. Configure SQL Server connection strings in the application
3. Add JavaFX SDK to your project classpath
4. Build and run the application

## Database Tables

### Core Tables

#### **Department**
Stores department information for the university.

```sql
CREATE TABLE Department (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
```

#### **Program**
Academic programs offered by the university.

```sql
CREATE TABLE Program (
    program_id INT IDENTITY(1,1) PRIMARY KEY,
    program_name VARCHAR(100) NOT NULL,
    degree_type VARCHAR(30) NOT NULL
);
```

#### **Semester**
Academic semester information with start and end dates.

```sql
CREATE TABLE Semester (
    semester_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE
);
```

#### **Instructor**
Faculty member information linked to departments.

```sql
CREATE TABLE Instructor (
    instructor_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
```

#### **Student**
Student information with program and department enrollment.

```sql
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
```

#### **Course**
Course information with credit hours and department assignment.

```sql
CREATE TABLE Course (
    course_id INT IDENTITY(1,1) PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL,
    course_name VARCHAR(150) NOT NULL,
    credit_hours INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
```

#### **Room**
Classroom information with capacity and location.

```sql
CREATE TABLE Room (
    room_id INT IDENTITY(1,1) PRIMARY KEY,
    building VARCHAR(100),
    room_number VARCHAR(20),
    capacity INT
);
```

#### **Schedule**
Class schedules with room assignments and time slots.

```sql
CREATE TABLE Schedule (
    schedule_id INT IDENTITY(1,1) PRIMARY KEY,
    room_id INT NOT NULL,
    day_of_week VARCHAR(15),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);
```

#### **Enrollment**
Student course enrollments with enrollment dates.

```sql
CREATE TABLE Enrollment (
    enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    enroll_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);
```

#### **AttendanceType**
Types of attendance records (Present, Absent, Late, Excused, Sick, etc.).

```sql
CREATE TABLE AttendanceType (
    type_id INT IDENTITY(1,1) PRIMARY KEY,
    type_name VARCHAR(30)
);
```

#### **Attendance**
Attendance records for students linked to schedules.

```sql
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
```

#### **UserAccount**
User authentication and role management.

```sql
CREATE TABLE UserAccount (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL, -- 'student','instructor','admin'
    linked_id INT NULL -- can store student_id or instructor_id depending on role
);
```

#### **DepartmentHead**
Department head assignments with tenure periods.

```sql
CREATE TABLE DepartmentHead (
    head_id INT IDENTITY(1,1) PRIMARY KEY,
    instructor_id INT NOT NULL,
    department_id INT NOT NULL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
```

## Core Functionality

### User Roles

- **Student**: View personal schedule and attendance records
- **Instructor**: Manage courses, track attendance, view class rosters
- **Admin**: Full system access, manage users, departments, and courses

### Main Features

1. **Attendance Management**
   - Record attendance with multiple types (Present, Absent, Late, Excused, Sick, etc.)
   - Add remarks and notes for attendance records
   - View attendance history and statistics

2. **Schedule Management**
   - Create and edit class schedules
   - Assign rooms and time slots
   - Manage instructor and student assignments

3. **Student Information**
   - Maintain student profiles
   - Track program and department enrollment
   - Manage student contact information

4. **Reporting & Analytics**
   - Generate attendance reports
   - View enrollment statistics
   - Track course capacities

## Usage

### Login

The application supports three user roles:
- **Students**: Use student credentials to access personal attendance and schedule
- **Instructors**: Use instructor credentials to manage courses and attendance
- **Admins**: Use admin credentials for full system access

### Common Tasks

#### View Schedule
1. Login with your credentials
2. Navigate to "Schedule" section
3. View all assigned classes with times and locations

#### Record Attendance
1. Select a class schedule
2. View enrolled students
3. Mark attendance status for each student
4. Add remarks if necessary

#### Generate Reports
1. Navigate to "Reports" section
2. Select report type (Attendance, Enrollment, etc.)
3. Choose date range and filters
4. Export or view results

## Query Examples

### Basic Queries

```sql
-- View all departments ordered by name
SELECT * FROM Department ORDER BY name;

-- Find students in Computer Science department
SELECT * FROM Student WHERE department_id = 1;

-- View all Monday schedules
SELECT * FROM Schedule ORDER BY day_of_week, start_time
WHERE day_of_week = 'Monday';
```

### Join Queries

```sql
-- Instructors with their departments
SELECT i.instructor_id, i.first_name, i.last_name, d.name AS department_name
FROM Instructor i
INNER JOIN Department d ON i.department_id = d.department_id;

-- Students and their enrollment records
SELECT s.student_id, s.first_name, s.last_name, e.enrollment_id
FROM Student s
LEFT JOIN Enrollment e ON s.student_id = e.student_id;

-- Attendance records with types
SELECT a.attendance_id, a.attendance_date, at.type_name
FROM Attendance a
FULL OUTER JOIN AttendanceType at ON a.type_id = at.type_id;
```

### Aggregate Functions

```sql
-- Total enrollments
SELECT COUNT(*) AS total_enrollments FROM Enrollment;

-- Total room capacity
SELECT SUM(capacity) AS total_capacity FROM Room;

-- Average credit hours per course
SELECT AVG(credit_hours) AS avg_credit_hours FROM Course;

-- Earliest semester
SELECT MIN(start_date) AS earliest_semester FROM Semester;

-- Latest attendance record
SELECT MAX(attendance_date) AS latest_attendance FROM Attendance;
```

## License

This project is provided as-is for educational and institutional use.

## Support

For issues, questions, or suggestions, please reach out to the development team or create an issue in the repository.

---

**Version**: 1.0  
**Last Updated**: May 2026  
**Author**: Youssef Shaher
