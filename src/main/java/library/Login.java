package library;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("AdminLogin".equalsIgnoreCase(action)) {
            adminLogin(request, response);
        } else if ("StudentLogin".equalsIgnoreCase(action)) {
            studentLogin(request, response);
        } else {
            // Handle invalid action
        }
    }

    private void adminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("t1");
        int id = Integer.parseInt(idStr);
        String givenPass = request.getParameter("t2");
        PrintWriter out = response.getWriter();

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Rahul@earth5")) {
            PreparedStatement pstm = con.prepareStatement("SELECT password FROM Admin WHERE AdminId=?");
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                String pass = rs.getString("password");
                if (givenPass.equals(pass)) {
                    out.println("<script>alert('Login Successful..')</script>");
                    response.sendRedirect("AdminDashboard.html");
                } else {
                    out.println("<script>alert('Login Failed. User Id or Password Mismatched.')</script>");
                }
            } else {
                out.println("<script>alert('User Id Not Found.')</script>");
            }
        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace();
        }
    }

    private void studentLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("t1");
        int id = Integer.parseInt(idStr);
        String givenPass = request.getParameter("t2");
        PrintWriter out = response.getWriter();

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Rahul@earth5")) {
            PreparedStatement pstm = con.prepareStatement("SELECT Password FROM Student WHERE StudentId=?");
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                String pass = rs.getString("password");
                if (givenPass.equals(pass)) {
                    
                    out.println("<script>alert('Login Successful..')</script>");
                    
                } else {
                    out.println("<script>alert('Login Failed. User Id or Password Mismatched.')</script>");
                }
            } else {
                out.println("<script>alert('User Id Not Found.')</script>");
            }
        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace();
        }
    }
}

