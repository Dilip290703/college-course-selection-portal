package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String feedbackText = request.getParameter("feedback_text");
        
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("student_id") == null) {
            response.sendRedirect("jsp/login.jsp");
            return;
        }
        
        int studentId = (int) session.getAttribute("student_id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003"); // change password if needed

            PreparedStatement ps = con.prepareStatement("INSERT INTO feedbacks (student_id, feedback_text) VALUES (?, ?)");
            ps.setInt(1, studentId);
            ps.setString(2, feedbackText);
            ps.executeUpdate();

            con.close();
            response.sendRedirect("jsp/view_enrollments.jsp"); // After feedback submitted, back to dashboard
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
