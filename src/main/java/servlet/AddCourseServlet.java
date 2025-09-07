package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseName = request.getParameter("course_name");
        String courseDescription = request.getParameter("course_description");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003"); // change if needed
            PreparedStatement ps = con.prepareStatement("INSERT INTO courses (course_name, course_description) VALUES (?, ?)");
            ps.setString(1, courseName);
            ps.setString(2, courseDescription);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("jsp/admin_dashboard.jsp");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
