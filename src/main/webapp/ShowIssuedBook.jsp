<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <p> Welcome  <%= session.getAttribute("StudentName")%></p>
	<p> Your Student Id is : <%= session.getAttribute("StudentId")%></p>

	<%@ page import="java.sql.*"%>
	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>

	<%try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Admin@123");
	
		String btn = request.getParameter("btn");
		int sid = (int) session.getAttribute("StudentId");
	
		if (btn.equalsIgnoreCase("ShowIssue")) {

		
		PreparedStatement pstm = con.prepareStatement(
		"select CallNo, BookName, BookAuthor, IssueDate, ReturnDate from IssuedBook inner join Book on IssuedBook.BookId=Book.BookId inner join Student on IssuedBook.StudentId=Student.StudentId where IssuedBook.StudentId=?");
		pstm.setInt(1, sid);
		ResultSet rs = pstm.executeQuery();
	%>
	<table border=1>
		<tr>
			<th>CallNo</th>
			<th>BookName</th>
			<th>BookAuthor</th>
			<th>IssuedDate</th>
			<th>ReturnDate</th>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<th><%=rs.getString(1)%></th>
			<th><%=rs.getString(2)%></th>
			<th><%=rs.getString(3)%></th>
			<th><%=rs.getString(4)%></th>
			<%
			if (rs.getString(5) != null) {
			%>
			<th><%=rs.getString(5)%></th>
			<%
			} else {
			%>
			<th><a href="Tick1.jsp?CallNo=<%= rs.getInt(1) %>&action=return1" >return</a></th>
		</tr>
		<%
		}
		%>
		<%
		}
		%>
	</table>
	<%
	}
	
	
	
	if (btn.equalsIgnoreCase("Return")) {
		
		PreparedStatement pstm = con.prepareStatement(
		"select CallNo, BookName, BookAuthor, IssueDate, ReturnDate from IssuedBook inner join Book on IssuedBook.BookId=Book.BookId inner join Student on IssuedBook.StudentId=Student.StudentId where (IssuedBook.StudentId=? AND ReturnDate IS NULL)");
		pstm.setInt(1, sid);
		ResultSet rs = pstm.executeQuery();
	%>
	<table border=1>
		<tr>
			<th>CallNo</th>
			<th>BookName</th>
			<th>BookAuthor</th>
			<th>IssuedDate</th>
			<th>ReturnDate</th>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<th><%=rs.getString(1)%></th>
			<th><%=rs.getString(2)%></th>
			<th><%=rs.getString(3)%></th>
			<th><%=rs.getString(4)%></th>
			<%
			if (rs.getString(5) != null) {
			%>
			<th><%=rs.getString(5)%></th>
			<%
			} else {
			%>
			<th><a href="Tick1.jsp?CallNo=<%= rs.getInt(1) %>&action=return2" >return</a></th>
		</tr>
		<%
		}
		%>
		<%
		}
		%>
	</table>
	<%
	}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>
	
	
</body>
</html>