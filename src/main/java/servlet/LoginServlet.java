package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/university_db", "root", "MITDc@29072003");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("student_id", rs.getInt("student_id"));
                session.setAttribute("student_name", rs.getString("name")); 
                response.sendRedirect("jsp/login_success.jsp");
            } else {
                response.getWriter().println("Invalid credentials");
            }
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("jsp/login.jsp"); 
    }
}
