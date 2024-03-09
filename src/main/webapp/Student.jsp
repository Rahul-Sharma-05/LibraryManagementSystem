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
		"jdbc:mysql://localhost:3306/test","root","Aaryan@004");  
		
		String reg=request.getParameter("SUBMIT");
		
		PreparedStatement pstm = con.prepareStatement("INSERT INTO Student values(StudentName, StudentEmail, Password, StudentContact, StudentCity)"); 
		pstm.setInt(1, id);
		ResultSet rs = pstm.executeQuery();
	}catch(Exception e)
	{
		System.out.println(e);
		
	}
%>

</body>
</html>