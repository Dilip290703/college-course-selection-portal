# 🎓 University Management System

A full-stack web application built using **Java (JSP + Servlets)**, **MySQL**, and **Apache Tomcat** for managing students, courses, faculty, and admin functionalities.  

## 🚀 Features

### 👨‍🎓 Student Module
- Student Signup & Login  
- Enroll in Courses  
- Drop Courses  
- View Enrolled Courses  
- Change Password  
- Submit Feedback  

### 👩‍💼 Admin Module
- Admin Login  
- Add / Delete Courses  
- Register Students & Faculty  
- Assign Faculty to Courses  
- View All Students & Courses  
- View Feedback Submitted by Students  

## 🛠️ Tech Stack
- **Frontend:** JSP, HTML, CSS  
- **Backend:** Java Servlets  
- **Database:** MySQL  
- **Server:** Apache Tomcat 9 (Port 9090)  
- **IDE:** Eclipse  

## 📂 Project Structure
```
Login/ (Project Root)
│
├── src/main/java/servlet/   # All Java Servlets
│   ├── LoginServlet.java
│   ├── AdminLoginServlet.java
│   ├── EnrollCourseServlet.java
│   ├── DeleteCourseServlet.java
│   ├── StudentSignupServlet.java
│   └── ...
│
├── src/main/webapp/         
│   ├── jsp/                 # JSP Pages
│   │   ├── login.jsp
│   │   ├── signup.jsp
│   │   ├── admin_login.jsp
│   │   ├── view_enrollments.jsp
│   │   ├── admin_dashboard.jsp
│   │   └── ...
│   ├── css/                 # Stylesheets
│   │   └── style.css
│   ├── homepage.jsp         # Home Page
│
└── pom.xml (if using Maven)
```

## 🗄️ Database Setup

Run the following SQL commands in MySQL:

```sql
CREATE DATABASE university_db;
USE university_db;

-- Students Table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

-- Faculty Table
CREATE TABLE faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

-- Courses Table
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) ON DELETE SET NULL
);

-- Enrollments Table
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

-- Feedbacks Table
CREATE TABLE feedbacks (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    feedback_text TEXT,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);

-- Admin Table
CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(100)
);

-- Default Admin
INSERT INTO admin (username, password) VALUES ('admin', 'admin123');
```

## ⚙️ Configuration
- Update **MySQL username & password** inside servlet files (`Connection con = DriverManager.getConnection(...)`).  
- Default Tomcat port is set to **9090**.  
- Place project in Eclipse, configure Tomcat server, and run.  

## ▶️ How to Run
1. Clone this repository:  
   ```bash
   git clone https://github.com/your-username/university-management-system.git
   ```
2. Import project into **Eclipse IDE**.  
3. Configure **Apache Tomcat 9** on port `9090`.  
4. Start MySQL and run provided SQL script.  
5. Run project on server.  
6. Open in browser:  
   ```
   http://localhost:9090/Login/homepage.jsp
   ```

## 📸 Screenshots


## 👨‍💻 Author
- **Your Name (Dilip Choudhary)**  
- 📧 Email: your-email@example.com  
- 🌐 Portfolio/GitHub: [Your GitHub Profile](https://github.com/your-username)
