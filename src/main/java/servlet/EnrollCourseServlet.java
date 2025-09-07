package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;  

import java.sql.*;

@WebServlet("/EnrollCourseServlet")  // <-- This maps the servlet to URL
public class EnrollCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("course_id"));
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("student_id") == null) {
            response.sendRedirect("jsp/login.jsp");
            return;
        }
        int studentId = (int) session.getAttribute("student_id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003");
            PreparedStatement ps = con.prepareStatement("INSERT INTO enrollments (student_id, course_id) VALUES (?, ?)");
            ps.setInt(1, studentId);
            ps.setInt(2, courseId);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("jsp/view_enrollments.jsp");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
