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
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Aaryan@004");

		String btn = request.getParameter("btn");

		// All
		if (btn.equalsIgnoreCase("All")) {
			Statement stmt = con.createStatement();
			String q = "SELECT CallNo, IssuedBook.StudentId, StudentName, StudentContact, StudentCity, BookName, BookAuthor, IssueDate, ReturnDate FROM IssuedBook INNER JOIN Student ON IssuedBook.StudentId = Student.StudentId INNER JOIN Book ON IssuedBook.BookId = Book.BookId";
			ResultSet rs = stmt.executeQuery(q);
	%>
	<table border=1>
		<tr>
			<th>CallNo</th>
			<th>StudentId</th>
			<th>StudentName</th>
			<th>Contact</th>
			<th>City</th>
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
			<th><%=rs.getString(5)%></th>
			<th><%=rs.getString(6)%></th>
			<th><%=rs.getString(7)%></th>
			<th><%=rs.getString(8)%></th>
			<%
			if (rs.getString(9) == null) {
			%>
			<th>To Be Return</th>
			<%
			} else {
			%>
			<th><%=rs.getString(9)%></th>
			<%
			}
			%>

		</tr>
		<%
		}
		%>

	</table>
	<%
	}

	//Return Details

	if (btn.equalsIgnoreCase("Returned")) {
	Statement stmt = con.createStatement();
	String q = "SELECT CallNo, IssuedBook.StudentId, StudentName, StudentContact, StudentCity, BookName, BookAuthor, IssueDate, ReturnDate FROM IssuedBook INNER JOIN Student ON IssuedBook.StudentId = Student.StudentId INNER JOIN Book ON IssuedBook.BookId = Book.BookId";
	ResultSet rs = stmt.executeQuery(q);
	%>
	<table border=1>
		<tr>
			<th>CallNo</th>
			<th>StudentId</th>
			<th>StudentName</th>
			<th>Contact</th>
			<th>City</th>
			<th>BookName</th>
			<th>BookAuthor</th>
			<th>IssuedDate</th>
			<th>ReturnDate</th>
		</tr>
		<%
		while (rs.next()) {
			if (rs.getString(9) != null) {
		%>
		<tr>
			<th><%=rs.getString(1)%></th>
			<th><%=rs.getString(2)%></th>
			<th><%=rs.getString(3)%></th>
			<th><%=rs.getString(4)%></th>
			<th><%=rs.getString(5)%></th>
			<th><%=rs.getString(6)%></th>
			<th><%=rs.getString(7)%></th>
			<th><%=rs.getString(8)%></th>
			<th><%=rs.getString(9)%></th>
		</tr>
		<%
		}
		}
		%>

	</table>
	<%
	}

	//Issued Detrails

	if (btn.equalsIgnoreCase("Issued")) {
	Statement stmt = con.createStatement();
	String q = "SELECT CallNo, IssuedBook.StudentId, StudentName, StudentContact, StudentCity, BookName, BookAuthor, IssueDate, ReturnDate FROM IssuedBook INNER JOIN Student ON IssuedBook.StudentId = Student.StudentId INNER JOIN Book ON IssuedBook.BookId = Book.BookId";
	ResultSet rs = stmt.executeQuery(q);
	%>
	<table border=1>
		<tr>
			<th>CallNo</th>
			<th>StudentId</th>
			<th>StudentName</th>
			<th>Contact</th>
			<th>City</th>
			<th>BookName</th>
			<th>BookAuthor</th>
			<th>IssuedDate</th>
			<th>ReturnDate</th>

		</tr>
		<%
		while (rs.next()) {
			if (rs.getString(9) == null) {
		%>
		<tr>
			<th><%=rs.getString(1)%></th>
			<th><%=rs.getString(2)%></th>
			<th><%=rs.getString(3)%></th>
			<th><%=rs.getString(4)%></th>
			<th><%=rs.getString(5)%></th>
			<th><%=rs.getString(6)%></th>
			<th><%=rs.getString(7)%></th>
			<th><%=rs.getString(8)%></th>
			<th>To Be Return</th>


		</tr>

		<%
		}
		}
		%>

	</table>
	<%
	}

	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>