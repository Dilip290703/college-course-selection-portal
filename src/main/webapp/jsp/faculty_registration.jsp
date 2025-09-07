<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Faculty Registration</title>
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
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            background-color: #7d2ae8;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #5a00b1;
        }

        .nav-links {
            margin-top: 20px;
            text-align: center;
        }

        .nav-links a {
            text-decoration: none;
            color: #7d2ae8;
            font-weight: bold;
        }

        .nav-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Register New Faculty</h2>

    <form method="post" action="../FacultyRegistrationServlet">
        <label>Name:</label>
        <input type="text" name="name" required>

        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Department:</label>
        <input type="text" name="department" required>

        <input type="submit" value="Register Faculty">
    </form>

    <div class="nav-links">
        <a href="admin_dashboard.jsp">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
