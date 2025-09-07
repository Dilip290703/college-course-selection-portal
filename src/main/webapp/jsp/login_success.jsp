<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<%
   
    if (session == null || session.getAttribute("student_id") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html>
<head>
    <title>Login Successful</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <meta http-equiv="refresh" content="2;url=view_enrollments.jsp">
</head>
<body>

    <h2>Login Successful!</h2>
    <p>Redirecting to your dashboard...</p>

</body>
</html>
