<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = "", email = "";

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003");
    PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE student_id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        name = rs.getString("name");
        email = rs.getString("email");
    }
    rs.close(); ps.close(); con.close();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 30px 40px;
            background-color: #f4f4f4;
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

        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            max-width: 500px;
            margin-top: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<div class="header">
    <h2>Edit Student</h2>
    <a href="admin_dashboard.jsp" class="dashboard-btn">Go to Dashboard</a>
</div>

<div class="form-container">
    <form method="post" action="../UpdateStudentServlet">
        <input type="hidden" name="id" value="<%= id %>">

        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= name %>" required>

        <label for="email">Email:</label>
        <input type="text" name="email" value="<%= email %>" required>

        <input type="submit" value="Update">
    </form>
</div>

</body>
</html>
