<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login_jsp</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
	String bt = request.getParameter("b1");
	
	if(bt.equalsIgnoreCase("Login")) {
		
		String id1 = request.getParameter("t1");
		int id = Integer.parseInt(id1);
		String givenPass = request.getParameter("t2");
	
			
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/test","root","Rahul@earth5");  
		
		PreparedStatement pstm = con.prepareStatement("SELECT password FROM Admin WHERE AdminId=?"); 
		pstm.setInt(1, id);
		ResultSet rs = pstm.executeQuery();
		
		if (rs.next()) {
			String pass = rs.getString("password");
			if(givenPass.equals(pass)) {
				out.println("<script>alert('Login Successfull..')</script>");
			}else {
				out.println("<script>alert('Login Faild. User Id or Password Mismachted.')</script>");
			}
		}else {
			out.println("<script>alert('User id Not found.')</script>");
		}
			
			
		}catch(Exception e){
			System.out.println(e);
	}
	
	}
	
	%>
</body>
</html>