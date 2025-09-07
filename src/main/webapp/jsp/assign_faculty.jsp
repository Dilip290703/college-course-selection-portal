<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Assign Faculty to Course</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f4f4;
            margin: 0;
        }

        .container {
            max-width: 500px;
            margin: 80px auto;
            background: white;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        h2 {
            color: #7d2ae8;
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 600;
            margin: 10px 0 5px;
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
            margin-top: 20px;
            text-align: center;
        }

        .nav-link a {
            color: #7d2ae8;
            text-decoration: none;
            font-weight: bold;
        }

        .nav-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Assign Faculty to Course</h2>

    <form method="post" action="../AssignFacultyServlet">
        <label>Faculty:</label>
        <select name="faculty_id" required>
            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003");

                    ps = con.prepareStatement("SELECT * FROM faculty");
                    rs = ps.executeQuery();
                    while (rs.next()) {
            %>
                <option value="<%= rs.getInt("faculty_id") %>"><%= rs.getString("name") %> ( <%= rs.getString("department") %> )</option>
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

        <label>Course:</label>
        <select name="course_id" required>
            <%
                con = null;
                ps = null;
                rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003");

                    ps = con.prepareStatement("SELECT * FROM courses");
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

        <input type="submit" value="Assign">
    </form>

    <div class="nav-link">
        <a href="admin_dashboard.jsp">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
