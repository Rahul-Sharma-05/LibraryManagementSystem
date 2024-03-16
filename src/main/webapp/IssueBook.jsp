<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Section</title>

</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
	
	
	<%
	String bt = request.getParameter("b1");

	if (bt.equalsIgnoreCase("Search")) {
		String BookId1 = request.getParameter("t1");
		int BookId = Integer.parseInt(BookId1);

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Aaryan@004");

			PreparedStatement pstm = con.prepareStatement("SELECT * FROM Book WHERE BookId=?");
			pstm.setInt(1, BookId);
			ResultSet rs = pstm.executeQuery();
	%>
	<table border=1>
		<tr>
			<th>BookId</th>
			<th>BookName</th>
			<th>BookAuthor</th>
			<th>BookPublication</th>
			<th>BookQuantity</th>
			<th>Link To Issue</th>
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
			<th>
			<%if(rs.getInt(5) > 0){ %>
			<a href="Tick1.jsp?BookId=<%= rs.getInt(1) %>" >Issue</a>
			<% }else { %>Book Not Available<% } %>
			</th>
		</tr>
		<%
		}
		%>

	</table>
	<%
	} catch (Exception e) {
	System.out.println(e);
	}
	}
	%>

	<%
	String bt2 = request.getParameter("b1");

	if (bt2.equalsIgnoreCase("Search All")) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Aaryan@004");

			PreparedStatement pstm = con.prepareStatement("SELECT * FROM Book");
			ResultSet rs = pstm.executeQuery();
	%>
	<table border=1>
		<tr>
			<th>BookId</th>
			<th>BookName</th>
			<th>BookAuthor</th>
			<th>BookPublication</th>
			<th>BookQuantity</th>
			<th>Link To Issue</th>
		</tr>
		<%
		while (rs.next()) {
			int bookid = rs.getInt(1);
		%>
		<tr>
			<th><%=rs.getString(1)%></th>
			<th><%=rs.getString(2)%></th>
			<th><%=rs.getString(3)%></th>
			<th><%=rs.getString(4)%></th>
			<th><%=rs.getString(5)%></th> 
			<th>
			<%if(rs.getInt(5) > 0){ %>
			<a href="Tick1.jsp?BookId=<%= rs.getInt(1) %>&action=issue" >Issue</a>
			<% }else { %>Book Not Available<% } %>
			</th>
		</tr>
		<%
		}
		%>

	</table>
	<%
	} catch (Exception e) {
	System.out.println(e);
	}
	}
	%>
	 
</body>
</html>