<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("student_id") == null) {
        response.sendRedirect("login.jsp");
    }

    int studentId = (int) session.getAttribute("student_id");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Enroll in New Course</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f4f4;
            margin: 0;
        }

        .container {
            max-width: 450px;
            margin: 80px auto;
            background: white;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #7d2ae8;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 600;
            margin-bottom: 5px;
        }

        select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        input[type="submit"] {
            background-color: #7d2ae8;
            color: white;
            border: none;
            padding: 12px;
            font-size: 15px;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #5a00b1;
        }

        .nav-link {
            text-align: center;
            margin-bottom: 25px;
        }

        .nav-link a {
            text-decoration: none;
            color: #7d2ae8;
            font-weight: bold;
        }

        .nav-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Enroll in a New Course</h2>

    <div class="nav-link">
        <a href="view_enrollments.jsp">Back to My Enrollments</a>
    </div>

    <form method="post" action="../EnrollCourseServlet">
        <label>Select Course:</label>
        <select name="course_id" required>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003");

                    String sql = "SELECT * FROM courses WHERE course_id NOT IN (SELECT course_id FROM enrollments WHERE student_id = ?)";
                    ps = con.prepareStatement(sql);
                    ps.setInt(1, studentId);
                    rs = ps.executeQuery();

                    while (rs.next()) {
            %>
                <option value="<%= rs.getInt("course_id") %>"><%= rs.getString("course_name") %></option>
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
        </select>

        <input type="submit" value="Enroll">
    </form>
</div>
</body>
</html>
