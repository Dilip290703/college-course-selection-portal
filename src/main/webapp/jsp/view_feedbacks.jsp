<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Student Feedbacks</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f4f4;
            margin: 0;
        }

        .container {
            max-width: 900px;
            margin: 60px auto;
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #7d2ae8;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #7d2ae8;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .nav-link {
            margin-top: 25px;
            text-align: center;
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
    <h2>All Student Feedbacks</h2>

    <table>
        <tr>
            <th>Feedback ID</th>
            <th>Student Name</th>
            <th>Feedback</th>
        </tr>

        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003");

                String sql = "SELECT f.feedback_id, s.name AS student_name, f.feedback_text " +
                             "FROM feedbacks f " +
                             "JOIN students s ON f.student_id = s.student_id";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();

                boolean hasFeedback = false;
                while (rs.next()) {
                    hasFeedback = true;
        %>
            <tr>
                <td><%= rs.getInt("feedback_id") %></td>
                <td><%= rs.getString("student_name") %></td>
                <td><%= rs.getString("feedback_text") %></td>
            </tr>
        <%
                }
                if (!hasFeedback) {
        %>
            <tr>
                <td colspan="3">No feedback received yet.</td>
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

    <div class="nav-link">
        <a href="admin_dashboard.jsp">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
