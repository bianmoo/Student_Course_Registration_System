CREATE DATABASE IF NOT EXISTS Student_Course_Registration_System;
USE Student_Course_Registration_System;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Teaches;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Professors;
DROP TABLE IF EXISTS Departments;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    major VARCHAR(100) NOT NULL,
    enrollment_year YEAR NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    credits INT NOT NULL
);

CREATE TABLE Professors (
    professor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(100) NOT NULL
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester VARCHAR(20) NOT NULL,
    grade VARCHAR(2),
    CONSTRAINT uq_enrollment UNIQUE (student_id, course_id, semester),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) UNIQUE,
    office_location VARCHAR(100) NOT NULL
);

CREATE TABLE Teaches (
    professor_id INT NOT NULL,
    course_id INT NOT NULL,
    semester VARCHAR(20) NOT NULL,
    PRIMARY KEY (professor_id, course_id, semester),
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);