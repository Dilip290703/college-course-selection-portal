<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("student_id") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
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
            margin-bottom: 20px;
        }

        .message {
            text-align: center;
            margin-bottom: 15px;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 600;
            margin-bottom: 5px;
        }

        input[type="password"] {
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
    <h2>Change Password</h2>

    <div class="message">
        <%
            String error = request.getParameter("error");
            String success = request.getParameter("success");

            if ("invalid".equals(error)) {
        %>
            <p class="error">Old password is incorrect!</p>
        <%
            } else if ("nomatch".equals(error)) {
        %>
            <p class="error">New passwords do not match.</p>
        <%
            } else if ("1".equals(success)) {
        %>
            <p class="success">Password changed successfully!</p>
        <%
            }
        %>
    </div>

    <form method="post" action="../ChangePasswordServlet">
        <label>Old Password:</label>
        <input type="password" name="old_password" required>

        <label>New Password:</label>
        <input type="password" name="new_password" required>

        <input type="submit" value="Change Password">
    </form>

    <div class="nav-link">
        <a href="view_enrollments.jsp">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
