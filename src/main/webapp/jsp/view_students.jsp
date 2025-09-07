<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Students</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background-color: #f4f4f4;
            padding: 30px 40px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .header h2 {
            color: #5a00b1;
            margin: 0;
        }

        .dashboard-btn {
            background-color: #7d2ae8;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
        }

        .dashboard-btn:hover {
            background-color: #5a00b1;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
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

        form {
            display: inline;
        }

        form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
        }

        form input[type="submit"]:hover {
            background-color: #388e3c;
        }

        .delete-btn {
            background-color: #ff4d4d;
        }

        .delete-btn:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body>

<div class="header">
    <h2>All Students</h2>
    <a href="admin_dashboard.jsp" class="dashboard-btn">Go to Dashboard</a>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003");
        ps = con.prepareStatement("SELECT * FROM students");
        rs = ps.executeQuery();
        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("student_id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td>
            <form method="get" action="edit_student.jsp">
                <input type="hidden" name="id" value="<%= rs.getInt("student_id") %>" />
                <input type="submit" value="Edit" />
            </form>
            <form method="post" action="../DeleteStudentServlet">
                <input type="hidden" name="id" value="<%= rs.getInt("student_id") %>" />
                <input type="submit" value="Delete" class="delete-btn" onclick="return confirm('Delete this student?')" />
            </form>
        </td>
    </tr>
<%
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
</table>

</body>
</html>
