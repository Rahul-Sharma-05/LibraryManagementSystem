package com.library;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Issue")
public class Issue extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	HttpSession hs = request.getSession();
    	int id = (int) hs.getAttribute("StudentId");
    	int bid = Integer.parseInt(request.getParameter("bookId"));
    	System.out.println(bid);
		
		System.out.println(bid);
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Rahul@earth5");

			PreparedStatement pstm = con.prepareStatement("INSERT INTO IssuedBood (BookId, StudentId, IssueDate) VALUES (?,?,?)");
			pstm.setInt(1, bid);
			pstm.setInt(2, id);
			pstm.setString(3, sdf.format(d));
			pstm.executeUpdate();
			
			System.out.println("Issued successfully.");
			
		}catch (Exception e) {
			e.getStackTrace();
		}
    	
    	
    	
    }
}
