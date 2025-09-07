package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/FacultyRegistrationServlet")
public class FacultyRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003"); // change password if needed
            PreparedStatement ps = con.prepareStatement("INSERT INTO faculty (name, email, department) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, department);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("jsp/admin_dashboard.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
