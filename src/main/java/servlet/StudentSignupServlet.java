package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/StudentSignupServlet")
public class StudentSignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003"); // update password if needed

            PreparedStatement ps = con.prepareStatement("INSERT INTO students (name, email, password) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.executeUpdate();

            con.close();
            // After signup, go back to login page
            response.sendRedirect("jsp/login.jsp");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
