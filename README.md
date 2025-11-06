# Student_Course_Registration_System
### Description
A lightweight SQL project demonstrating relational schema design, data modeling, and multi-table querying. This project models a simplified university course registration system.
### Overview
This project showcases core SQL skills required for entry-level data, software, and IT roles. The database simulates a realistic university environment and demonstrates:  
• Creating normalised relational tables.  
• Designing primary and foreign key relationships.  
• Using many-to-many linking tables (Enrollments, Teaches).  
• Writing multi-table JOIN queries.  
• Using aggregations, grouping, filtering, and subqueries.  
• Analysing student performance, professor activity, and department-level data.  

### Schema
##### Students 
Stores student info.  
Columns: student_id, first_name, last_name, email, major, enrollment_year
##### Professors 
Stores professor info.  
Columns: professor_id, first_name, last_name, department
##### Courses 
Stores course/subject details.  
Columns: course_id, course_name, department, credits
##### Enrollments 
Link table connecting students <-> courses with semester + grade info.  
Columns: enrollment_id, student_id, course_id, semester, grade
##### Teaches 
Link table connecting professors <-> courses taught.  
Columns: professor_id, course_id
##### Departments 
Stores department metadata.  
Columns: department_id, department_name, office_location
##### ERD
```markdown
Students ---< Enrollments >--- Courses ---< Teaches >--- Professors
                  ^                 |
                  |                 v
             Departments <------ Courses.department
```
### Usage
##### 1. Create the database in an SQL client: 
```
CREATE DATABASE university_db;
USE university_db;
```  
##### 2. Run the schema: 
```
mysql -u root -p university_db < schema.sql
```
##### 3. Insert sample data:
```
mysql -u root -p university_db < seed.sql
```
##### 4. Execute the example queries:
```
mysql -u root -p university_db < queries.sql
```
##### (Optional) Enter SQL shell to execute custom queries:
```
mysql -u root -p university_db
```
### Example queries
• Show the number of students enrolled per course.  
• Show the number of courses each professor teaches.  
• Show the most common grade per course.  
• Show the number of students taught by each professor.  
• Show the number of courses that have more than 2 students enrolled.   
### Files
schema.sql - Creates all tables and foreign keys.  
seed.sql - Inserts data.  
queries.sql - practice SQL queries.      

