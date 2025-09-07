<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
    }
%>
<%
    String error = request.getParameter("error");
    if ("course_in_use".equals(error)) {
%>
    <p style="color:red; text-align:center;">Cannot delete: students are enrolled in this course.</p>
<%
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            display: flex;
            height: 100vh;
            background-color: #f4f4f4;
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            background-color: #7d2ae8;
            color: white;
            display: flex;
            flex-direction: column;
            padding: 30px 20px;
            gap: 15px;
            box-shadow: 2px 0 8px rgba(0,0,0,0.1);
        }

        .sidebar h2 {
            margin-top: 0;
            font-size: 22px;
            border-bottom: 1px solid rgba(255,255,255,0.3);
            padding-bottom: 10px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            margin: 8px 0;
        }

        .sidebar a button {
            width: 100%;
            background-color: transparent;
            border: 1px solid #fff;
            padding: 10px 12px;
            font-size: 16px;
            border-radius: 6px;
            color: white;
            cursor: pointer;
            transition: background 0.3s;
        }

        .sidebar a button:hover {
            background-color: rgba(255,255,255,0.1);
        }

        /* Main content */
        .main-content {
            flex: 1;
            padding: 30px 40px;
            overflow-y: auto;
        }

        h3 {
            color: #5a00b1;
        }

        form {
            margin-top: 15px;
        }

        form input[type="text"] {
            padding: 10px;
            margin-right: 10px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 6px;
            cursor: pointer;
        }
        .stats-panel {
    display: flex;
    gap: 25px;
    margin: 25px 0;
    flex-wrap: wrap;
}

.stat-box {
    background: #fff;
    border-left: 5px solid #7d2ae8;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    flex: 1;
    min-width: 180px;
    text-align: center;
}

.stat-box h4 {
    margin: 0;
    color: #5a00b1;
}

.stat-box p {
    font-size: 24px;
    margin: 8px 0 0;
    font-weight: bold;
}
        

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 12px 16px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #7d2ae8;
            color: white;
        }

        td input[type="submit"] {
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
        }

        td input[type="submit"]:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="homepage.jsp"><button>Home</button></a>
    <a href="adminLogout.jsp"><button>Logout</button></a>
    <hr style="border-color: rgba(255,255,255,0.2);">
    <a href="student_registration.jsp"><button>Register Student</button></a>
        <a href="view_students.jsp"><button>Manage Students</button></a>
    <a href="faculty_registration.jsp"><button>Register Faculty</button></a>
    <a href="assign_faculty.jsp"><button>Assign Faculty</button></a>
    <a href="view_feedbacks.jsp"><button>View Feedbacks</button></a>
</div>
<%
    int totalStudents = 0, totalFaculty = 0, totalCourses = 0, totalEnrollments = 0;
    Connection con = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003");

        Statement stat = con.createStatement();

        ResultSet rs1 = stat.executeQuery("SELECT COUNT(*) FROM students");
        if (rs1.next()) totalStudents = rs1.getInt(1);

        ResultSet rs2 = stat.executeQuery("SELECT COUNT(*) FROM faculty");
        if (rs2.next()) totalFaculty = rs2.getInt(1);

        ResultSet rs3 = stat.executeQuery("SELECT COUNT(*) FROM courses");
        if (rs3.next()) totalCourses = rs3.getInt(1);

        ResultSet rs4 = stat.executeQuery("SELECT COUNT(*) FROM enrollments");
        if (rs4.next()) totalEnrollments = rs4.getInt(1);

        rs1.close(); rs2.close(); rs3.close(); rs4.close();
        stat.close();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (con != null) con.close();
    }
%>

<!-- Main content -->
<div class="main-content">
    <h2>Welcome Admin</h2>
    <div class="stats-panel">
    <div class="stat-box">
        <h4>Total Students</h4>
        <p><%= totalStudents %></p>
    </div>
    <div class="stat-box">
        <h4>Total Faculty</h4>
        <p><%= totalFaculty %></p>
    </div>
    <div class="stat-box">
        <h4>Total Courses</h4>
        <p><%= totalCourses %></p>
    </div>
    <div class="stat-box">
        <h4>Total Enrollments</h4>
        <p><%= totalEnrollments %></p>
    </div>
</div>
    

    <h3>Add New Course</h3>
    <form method="post" action="../AddCourseServlet">
        <input type="text" name="course_name" placeholder="Course Name" required />
        <input type="text" name="course_description" placeholder="Course Description" />
        <input type="submit" value="Add Course" />
    </form>

    <h3>All Courses</h3>
    
    <table>
        <tr>
            <th>Course ID</th>
            <th>Course Name</th>
            <th>Course Description</th>
            <th>Faculty Assigned</th>
            <th>Action</th>
        </tr>

        <%
           
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003");

                String sql = "SELECT c.course_id, c.course_name, c.course_description, f.name AS faculty_name " +
                             "FROM courses c " +
                             "LEFT JOIN faculty_course_assignment fca ON c.course_id = fca.course_id " +
                             "LEFT JOIN faculty f ON fca.faculty_id = f.faculty_id";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();

                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("course_id") %></td>
                <td><%= rs.getString("course_name") %></td>
                <td><%= rs.getString("course_description") %></td>
                <td><%= (rs.getString("faculty_name") != null) ? rs.getString("faculty_name") : "Not Assigned" %></td>
                <td>
                    <form method="post" action="../DeleteCourseServlet">
                        <input type="hidden" name="course_id" value="<%= rs.getInt("course_id") %>" />
                        <input type="submit" value="Delete" />
                    </form>
                </td>
            </tr>
        <%
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            }
        %>
    </table>
</div>

</body>
</html>
