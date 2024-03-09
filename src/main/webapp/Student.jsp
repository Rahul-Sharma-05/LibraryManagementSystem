<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%@ page import="java.sql.*"%>
<% 

	try{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/test","root","Rahul@earth5");  
		
		String reg=request.getParameter("b1");
		if(reg.equalsIgnoreCase("Submit Form") || reg.equalsIgnoreCase("Add Student")) {
			
		String st1 = request.getParameter("Name");
		String st2 = request.getParameter("Email");
		String st3 = request.getParameter("Password");
		String st4 = request.getParameter("Contact");
		String st5 = request.getParameter("City");
		String st6 = request.getParameter("Gender");
		
		
		PreparedStatement pstm = con.prepareStatement("INSERT INTO Student (StudentName, StudentEmail, Password, StudentContact, StudentCity, Gender) VALUE (?,?,?,?,?,?)"); 
		pstm.setString(1, st1);
		pstm.setString(2, st2);
		pstm.setString(3, st3);
		pstm.setString(4, st4);
		pstm.setString(5, st5);
		pstm.setString(6, st6);
		
		pstm.executeUpdate();
		out.println("<script>alert('User Added Successfully.')</script>");
		}
		
		}catch(Exception e){
		System.out.println(e);
		
	}


%>

</body>
</html>