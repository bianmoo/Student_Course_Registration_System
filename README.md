# Student_Course_Registration_System
### Description
A mini SQL project demonstrating relational schema design, data modeling, and multi-table querying. This project models a simplified university course registration system.
### Overview

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
```mermaid
erDiagram
    STUDENTS {
        INT student_id PK
        VARCHAR first_name
        VARCHAR last_name
        VARCHAR email UNIQUE
        VARCHAR major
        INT enrollment_year
    }

    PROFESSORS {
        INT professor_id PK
        VARCHAR first_name
        VARCHAR last_name
        VARCHAR department
    }

    DEPARTMENTS {
        INT department_id PK
        VARCHAR department_name UNIQUE
        VARCHAR office_location
    }

    COURSES {
        INT course_id PK
        VARCHAR course_name
        VARCHAR department
        INT credits
    }

    ENROLLMENTS {
        INT enrollment_id PK
        INT student_id FK
        INT course_id FK
        VARCHAR semester
        VARCHAR grade
    }

    TEACHES {
        INT professor_id FK
        INT course_id FK
    }

    %% Relationships
    STUDENTS ||--o{ ENROLLMENTS : enrolls
    COURSES  ||--o{ ENROLLMENTS : has
    PROFESSORS ||--o{ TEACHES : teaches
    COURSES  ||--o{ TEACHES : is_taught_by
    DEPARTMENTS ||--o{ PROFESSORS : houses
    DEPARTMENTS ||--o{ COURSES : offers
```
