<%
    session.invalidate(); // destroy session
    response.sendRedirect("admin_login.jsp"); // redirect to login page
%>
