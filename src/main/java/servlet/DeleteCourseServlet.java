package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/DeleteCourseServlet")
public class DeleteCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("course_id"));
        Connection con = null;
        PreparedStatement psCheck = null;
        PreparedStatement psDelete = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003");

            // Step 1: Check if students are enrolled in this course
            String checkSql = "SELECT COUNT(*) FROM enrollments WHERE course_id = ?";
            psCheck = con.prepareStatement(checkSql);
            psCheck.setInt(1, courseId);
            rs = psCheck.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                // Students are enrolled, do not delete
                response.sendRedirect("jsp/admin_dashboard.jsp?error=course_in_use");
                return;
            }

            // Step 2: Delete the course
            String deleteSql = "DELETE FROM courses WHERE course_id = ?";
            psDelete = con.prepareStatement(deleteSql);
            psDelete.setInt(1, courseId);
            psDelete.executeUpdate();

            response.sendRedirect("jsp/admin_dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (psCheck != null) psCheck.close();
                if (psDelete != null) psDelete.close();
                if (con != null) con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
