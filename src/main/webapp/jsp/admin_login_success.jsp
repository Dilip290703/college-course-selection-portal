<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<%
    
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("admin_login.jsp");
    }
%>

<html>
<head>
    <title>Admin Login Successful</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <meta http-equiv="refresh" content="2;url=admin_dashboard.jsp">
</head>
<body>

    <h2>Admin Login Successful!</h2>
    <p>Redirecting to Admin Dashboard...</p>

</body>
</html>
