package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/AssignFacultyServlet")
public class AssignFacultyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int facultyId = Integer.parseInt(request.getParameter("faculty_id"));
        int courseId = Integer.parseInt(request.getParameter("course_id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003"); // change password if needed

            PreparedStatement ps = con.prepareStatement("INSERT INTO faculty_course_assignment (faculty_id, course_id) VALUES (?, ?)");
            ps.setInt(1, facultyId);
            ps.setInt(2, courseId);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("jsp/admin_dashboard.jsp");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
