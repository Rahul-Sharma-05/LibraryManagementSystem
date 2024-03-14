package com.library;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String btn = request.getParameter("btn");
		if(btn.equalsIgnoreCase("slogout")) {
			HttpSession s = request.getSession();	
			    s.removeAttribute("StudentId");
			    s.removeAttribute("StudentName");
				RequestDispatcher rd = request.getRequestDispatcher("/StudentLogin.html");
				rd.forward(request, response);
				
			}
			
	}
}
