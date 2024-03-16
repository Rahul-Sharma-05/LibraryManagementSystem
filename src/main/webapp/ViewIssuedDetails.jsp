<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Rahul@earth5");
	
		String btn = request.getParameter("btn");
		
		// All
		if(btn.equalsIgnoreCase("All")) {
			Statement stmt = con.createStatement();
			String q = "SELECT CallNo, IssuedBook.StudentId, StudentName, StudentContact, StudentCity, BookName, BookAuthor, IssueDate, ReturnDate FROM IssuedBook INNER JOIN Student ON IssuedBook.StudentId = Student.StudentId INNER JOIN Book ON IssuedBook.BookId = Book.BookId";
			ResultSet rs = stmt.executeQuery(q);
		}
	
	
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>