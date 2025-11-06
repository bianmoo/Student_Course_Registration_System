# Show the number of students enrolled per course.
SELECT Courses.course_id, course_name, COUNT(student_id) AS Students_Enrolled
FROM Enrollments INNER JOIN Courses ON Enrollments.course_id = Courses.course_id
GROUP BY Courses.course_id;

# Show the number of courses each professor teaches.
SELECT Professors.professor_id, first_name, last_name, COUNT(course_Id) AS Number_of_Courses
FROM Professors INNER JOIN Teaches ON Professors.professor_id = Teaches.professor_id
GROUP BY Professors.professor_id;

# Show the most common grade per course.
SELECT t.course_id, t.course_name, t.grade AS Most_Common_Grade
FROM 
(
    SELECT Courses.course_id, Courses.course_name, Enrollments.grade, COUNT(Enrollments.grade) AS grade_counts, ROW_NUMBER() OVER (PARTITION BY Courses.course_id ORDER BY COUNT(Enrollments.grade) DESC) AS `rank`
    FROM Enrollments INNER JOIN Courses ON Enrollments.course_id = Courses.course_id
    WHERE Enrollments.grade IS NOT NULL
    GROUP BY Courses.course_id, Enrollments.grade
) AS t
WHERE t.rank = 1;

# Show the number of students taught by each professor.
SELECT professor_id, COUNT(student_id) AS Student_Count
FROM Teaches INNER JOIN Enrollments ON Teaches.course_id = Enrollments.course_id AND Teaches.semester = Enrollments.semester 
GROUP BY professor_id;

# Show the number of courses that have more than 2 students enrolled.
SELECT course_id, COUNT(student_id) AS Student_Count
FROM Enrollments
GROUP BY course_id
HAVING COUNT(student_id) > 2;