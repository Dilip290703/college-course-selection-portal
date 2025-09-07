<%
    session.invalidate(); // destroy session
    response.sendRedirect("login.jsp"); // redirect to login page
%>
