package servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003"
            );

            PreparedStatement ps = con.prepareStatement(
                "UPDATE students SET name=?, email=? WHERE student_id=?"
            );
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setInt(3, id);

            ps.executeUpdate();
            ps.close();
            con.close();

            response.sendRedirect("jsp/view_students.jsp"); // update path if needed

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating student: " + e.getMessage());
        }
    }
}
