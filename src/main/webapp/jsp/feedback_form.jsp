<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("student_id") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Feedback</title>
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
            text-align: center;
            color: #7d2ae8;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        textarea {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            resize: vertical;
            font-size: 14px;
            line-height: 1.5;
            min-height: 120px;
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
    <h2>Submit Your Feedback</h2>

    <form method="post" action="../FeedbackServlet">
        <textarea name="feedback_text" placeholder="Write your feedback here..." required></textarea>
        <input type="submit" value="Submit Feedback">
    </form>

    <div class="nav-link">
        <a href="view_enrollments.jsp">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
