package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldPassword = request.getParameter("old_password");
        String newPassword = request.getParameter("new_password");
        
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("student_id") == null) {
            response.sendRedirect("jsp/login.jsp");
            return;
        }
        
        int studentId = (int) session.getAttribute("student_id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003"); // update password if needed
            
            // Step 1: Verify Old Password
            PreparedStatement ps1 = con.prepareStatement("SELECT password FROM students WHERE student_id = ?");
            ps1.setInt(1, studentId);
            ResultSet rs = ps1.executeQuery();
            
            if (rs.next()) {
                String currentPassword = rs.getString("password");
                if (currentPassword.equals(oldPassword)) {
                    // Step 2: Update New Password
                    PreparedStatement ps2 = con.prepareStatement("UPDATE students SET password = ? WHERE student_id = ?");
                    ps2.setString(1, newPassword);
                    ps2.setInt(2, studentId);
                    ps2.executeUpdate();
                    
                    con.close();
                    response.sendRedirect("jsp/change_password.jsp?success=1");

                } else {
                	response.sendRedirect("jsp/change_password.jsp?error=invalid");

                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
