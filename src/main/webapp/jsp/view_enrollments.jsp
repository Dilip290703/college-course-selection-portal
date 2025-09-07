<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("student_id") == null) {
        response.sendRedirect("login.jsp");
    }

    int studentId = (int) session.getAttribute("student_id");
    String studentName = (String) session.getAttribute("student_name");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
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
            color: white;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            margin: 6px 0;
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

        h2, h3 {
            color: #5a00b1;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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

        form input[type="submit"] {
            background-color: #ff4d4d;
            color: white;
            border: none;
            padding: 6px 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        form input[type="submit"]:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Student Dashboard</h2>
    <a href="homepage.jsp"><button>Home</button></a>
    <a href="enroll_course.jsp"><button>Enroll in Course</button></a>
     <a href="feedback_form.jsp"><button>Submit Feedback</button></a>
      <a href="change_password.jsp"><button>Change Password</button></a>
    <a href="logout.jsp"><button>Logout</button></a>
   
    
   
</div>

<!-- Main Content -->
<div class="main-content">
    <h2>Welcome, <%= studentName %> (ID: <%= studentId %>)</h2>
    <h3>Your Enrolled Courses:</h3>

    <table>
        <tr>
            <th>Course Name</th>
            <th>Course Description</th>
            <th>Action</th>
        </tr>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003");

                String sql = "SELECT c.course_id, c.course_name, c.course_description " +
                             "FROM enrollments e " +
                             "JOIN courses c ON e.course_id = c.course_id " +
                             "WHERE e.student_id = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, studentId);
                rs = ps.executeQuery();

                boolean hasCourses = false;
                while (rs.next()) {
                    hasCourses = true;
        %>
        <tr>
            <td><%= rs.getString("course_name") %></td>
            <td><%= rs.getString("course_description") %></td>
            <td>
                <form method="post" action="../DropCourseServlet" style="display:inline;">
                    <input type="hidden" name="course_id" value="<%= rs.getInt("course_id") %>">
                    <input type="submit" value="Drop">
                </form>
            </td>
        </tr>
        <%
                }
                if (!hasCourses) {
        %>
        <tr>
            <td colspan="3">No courses enrolled yet.</td>
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
