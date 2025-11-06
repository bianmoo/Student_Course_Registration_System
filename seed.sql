START TRANSACTION;

INSERT INTO Students (first_name, last_name, email, major, enrollment_year) VALUES
('Alice', 'Nguyen', 'alice.nguyen@example.com', 'Computer Science', 2023),
('Benjamin', 'Smith', 'ben.smith@example.com', 'Information Systems', 2022),
('Chloe', 'Patel', 'chloe.patel@example.com', 'Mathematics', 2024),
('Daniel', 'Li', 'daniel.li@example.com', 'Computer Science', 2023),
('Emma', 'Brown', 'emma.brown@example.com', 'Engineering', 2021),
('Felix', 'Tran', 'felix.tran@example.com', 'Cybersecurity', 2024),
('Grace', 'Wilson', 'grace.wilson@example.com', 'Mathematics', 2022),
('Henry', 'Park', 'henry.park@example.com', 'Computer Science', 2021),
('Isabella', 'Chen', 'isabella.chen@example.com', 'Data Analytics', 2023),
('Jack', 'Taylor', 'jack.taylor@example.com', 'Engineering', 2024);

INSERT INTO Courses (course_name, department, credits) VALUES
('Database Systems', 'Computer Science', 3), 
('Network Security', 'Cybersecurity', 3),
('Linear Algebra', 'Mathematics', 6),
('Software Engineering', 'Computer Science', 6),
('Thermodynamics', 'Engineering', 6),
('Information Management', 'Information Systems', 3),
('Data Mining', 'Data Analytics', 3),
('Algorithms and Complexity', 'Computer Science', 6);

INSERT INTO Professors (first_name, last_name, department) VALUES
('Sarah', 'Lee', 'Computer Science'),
('Tom', 'Anderson', 'Mathematics'),
('Olivia', 'Carter', 'Engineering'),
('Michael', 'Zhang', 'Information Systems'),
('Karen', 'Patel', 'Cybersecurity'),
('James', 'Wong', 'Computer Science');

INSERT INTO Departments (department_name, office_location) VALUES
('Computer Science', 'Building A, Room 210'),
('Mathematics', 'Building B, Room 105'),
('Engineering', 'Building C, Room 330'),
('Information Systems', 'Building D, Room 120'),
('Cybersecurity', 'Building A, Room 305'),
('Data Analytics', 'Building E, Room 250');

INSERT INTO Teaches (professor_id, course_id, semester)
SELECT p.professor_id, c.course_id, 'Spring 2025' FROM Professors p JOIN Courses c ON p.last_name='Lee'  AND c.course_name='Database Systems'
UNION ALL
SELECT p.professor_id, c.course_id, 'Autumn 2025' FROM Professors p JOIN Courses c ON p.last_name='Lee'  AND c.course_name='Algorithms and Complexity'
UNION ALL
SELECT p.professor_id, c.course_id, 'Spring 2025' FROM Professors p JOIN Courses c ON p.last_name='Lee'  AND c.course_name='Data Mining'
UNION ALL
SELECT p.professor_id, c.course_id, 'Spring 2025' FROM Professors p JOIN Courses c ON p.last_name='Wong' AND c.course_name='Software Engineering'
UNION ALL
SELECT p.professor_id, c.course_id, 'Autumn 2025' FROM Professors p JOIN Courses c ON p.last_name='Wong' AND c.course_name='Software Engineering'
UNION ALL
SELECT p.professor_id, c.course_id, 'Spring 2025' FROM Professors p JOIN Courses c ON p.last_name='Anderson' AND c.course_name='Linear Algebra'
UNION ALL
SELECT p.professor_id, c.course_id, 'Spring 2025' FROM Professors p JOIN Courses c ON p.last_name='Carter'   AND c.course_name='Thermodynamics'
UNION ALL
SELECT p.professor_id, c.course_id, 'Spring 2025' FROM Professors p JOIN Courses c ON p.last_name='Zhang'    AND c.course_name='Information Management'
UNION ALL
SELECT p.professor_id, c.course_id, 'Spring 2025' FROM Professors p JOIN Courses c ON p.last_name='Patel'    AND c.course_name='Network Security';

INSERT INTO Enrollments (student_id, course_id, semester, grade)
SELECT s.student_id, c.course_id, 'Spring 2025', 'A' FROM Students s, Courses c WHERE s.first_name='Alice' AND s.last_name='Nguyen' AND c.course_name='Database Systems'
UNION ALL
SELECT s.student_id, c.course_id, 'Spring 2025', 'B' FROM Students s, Courses c WHERE s.first_name='Alice' AND s.last_name='Nguyen' AND c.course_name='Software Engineering'
UNION ALL
SELECT s.student_id, c.course_id, 'Spring 2025', 'A' FROM Students s, Courses c WHERE s.first_name='Benjamin' AND s.last_name='Smith' AND c.course_name='Database Systems'
UNION ALL
SELECT s.student_id, c.course_id, 'Spring 2025', 'B' FROM Students s, Courses c WHERE s.first_name='Benjamin' AND s.last_name='Smith' AND c.course_name='Information Management'
UNION ALL
SELECT s.student_id, c.course_id, 'Spring 2025', 'A' FROM Students s, Courses c WHERE s.first_name='Chloe' AND s.last_name='Patel' AND c.course_name='Linear Algebra'
UNION ALL
SELECT s.student_id, c.course_id, 'Autumn 2025', NULL FROM Students s, Courses c WHERE s.first_name='Chloe' AND s.last_name='Patel' AND c.course_name='Database Systems'
UNION ALL
SELECT s.student_id, c.course_id, 'Spring 2025', 'A' FROM Students s, Courses c WHERE s.first_name='Daniel' AND s.last_name='Li' AND c.course_name='Database Systems'
UNION ALL
SELECT s.student_id, c.course_id, 'Autumn 2025', NULL FROM Students s, Courses c WHERE s.first_name='Daniel' AND s.last_name='Li' AND c.course_name='Algorithms and Complexity'
UNION ALL
SELECT s.student_id, c.course_id, 'Spring 2025', 'C' FROM Students s, Courses c WHERE s.first_name='Emma' AND s.last_name='Brown' AND c.course_name='Thermodynamics'
UNION ALL
SELECT s.student_id, c.course_id, 'Spring 2025', 'A' FROM Students s, Courses c WHERE s.first_name='Felix' AND s.last_name='Tran' AND c.course_name='Network Security'
UNION ALL
SELECT s.student_id, c.course_id, 'Autumn 2025', 'B' FROM Students s, Courses c WHERE s.first_name='Grace' AND s.last_name='Wilson' AND c.course_name='Linear Algebra'
UNION ALL
SELECT s.student_id, c.course_id, 'Spring 2025', 'B' FROM Students s, Courses c WHERE s.first_name='Henry' AND s.last_name='Park' AND c.course_name='Database Systems'
UNION ALL
SELECT s.student_id, c.course_id, 'Autumn 2025', 'A' FROM Students s, Courses c WHERE s.first_name='Henry' AND s.last_name='Park' AND c.course_name='Software Engineering'
UNION ALL
SELECT s.student_id, c.course_id, 'Spring 2025', 'A' FROM Students s, Courses c WHERE s.first_name='Isabella' AND s.last_name='Chen' AND c.course_name='Network Security'
UNION ALL
SELECT s.student_id, c.course_id, 'Spring 2025', 'A' FROM Students s, Courses c WHERE s.first_name='Isabella' AND s.last_name='Chen' AND c.course_name='Data Mining'
UNION ALL
SELECT s.student_id, c.course_id, 'Spring 2025', 'B' FROM Students s, Courses c WHERE s.first_name='Jack' AND s.last_name='Taylor' AND c.course_name='Thermodynamics'
UNION ALL
SELECT s.student_id, c.course_id, 'Autumn 2025', NULL FROM Students s, Courses c WHERE s.first_name='Alice' AND s.last_name='Nguyen' AND c.course_name='Algorithms and Complexity'
UNION ALL
SELECT s.student_id, c.course_id, 'Autumn 2025', NULL FROM Students s, Courses c WHERE s.first_name='Benjamin' AND s.last_name='Smith' AND c.course_name='Linear Algebra'
UNION ALL
SELECT s.student_id, c.course_id, 'Spring 2025', 'A' FROM Students s, Courses c WHERE s.first_name='Grace' AND s.last_name='Wilson' AND c.course_name='Data Mining'
UNION ALL
SELECT s.student_id, c.course_id, 'Autumn 2025', NULL FROM Students s, Courses c WHERE s.first_name='Felix' AND s.last_name='Tran' AND c.course_name='Information Management';

COMMIT;