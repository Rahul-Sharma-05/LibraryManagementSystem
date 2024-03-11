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
	
	<script>
		function confirmAction(par1) {
			int bid = par1;
			var result = confirm("Are you sure you want to proceed?");
			if (result) {
			<%	
				int id = (int) session.getAttribute("StudentId");
				String bi ="<script>document.writeln(bid)</script>";
		//		String bid1 = request.getParameter("bookId");
				//int bid = Integer.parseInt(bid1);
		//		System.out.println("Student id : " +id);
		//		System.out.println("Book id : " +bid1);
				Date d = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Rahul@earth5");

					PreparedStatement pstm = con.prepareStatement("INSERT INTO IssuedBook (BookId, StudentId, IssueDate) VALUES (?,?,?)");
					pstm.setString(1, bi);
					pstm.setInt(2, id);
					pstm.setString(3, sdf.format(d));
					pstm.executeUpdate();
					
					
					
				}catch (Exception e) {
					e.getStackTrace();
				}
				
				
				%>
				//window.location.href = "Tick1.jsp";
			}else{
				
			}
		}
	</script>
	<%
	String bt = request.getParameter("b1");

	if (bt.equalsIgnoreCase("Search")) {
		String BookId1 = request.getParameter("t1");
		int BookId = Integer.parseInt(BookId1);

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Rahul@earth5");

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
			<th></th>
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
				<button onclick="confirmAction()" type="submit" name="bookId"
					value="<%=rs.getString(1)%>" <%if (rs.getInt(5) <= 0) {%>
					disabled <%}%>>Issue</button>
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
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Rahul@earth5");

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
			<th></th>
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
			<button onclick="confirmAction(${ rs.getInt(1)})" type="submit"
				name="bookId" value="<%= rs.getInt(1) %>"
					<%if (rs.getInt(5) <= 0) {%> disabled <%}%>>Issue</button>
					
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