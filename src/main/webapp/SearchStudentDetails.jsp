<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Details</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
	String bt = request.getParameter("b1");
	
	if(bt.equalsIgnoreCase("Search")) {
		String StId1 = request.getParameter("t1");
		int StId = Integer.parseInt(StId1);
		
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/test","root","Rahul@earth5");  
			
			PreparedStatement pstm = con.prepareStatement("SELECT * FROM Student WHERE StudentId=?"); 
			pstm.setInt(1, StId);
			ResultSet rs = pstm.executeQuery();
			
			%>
			<table border=1>
				<tr>
					<th>StudentId</th>
					<th>StudentName</th>
					<th>Email</th>
					<th>Gender</th>
					<th>Contact</th>
					<th>City</th>
					
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<th><%=rs.getString(1)%></th>
					<th><%=rs.getString(2)%></th>
					<th><%=rs.getString(3)%></th>
					<th><%=rs.getString(7)%></th>
					<th><%=rs.getString(5)%></th>
					<th><%=rs.getString(6)%></th>
				</tr>
				<%
				}
				%>
				
			</table>
			<%
						
			}catch(Exception e){
				System.out.println(e);
		}
	}
	%>	
	
	<%
	String bt2 = request.getParameter("b1");
	
	if(bt2.equalsIgnoreCase("Search All")) {
		
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/test","root","Rahul@earth5");  
			
			PreparedStatement pstm = con.prepareStatement("SELECT * FROM Student");
			ResultSet rs = pstm.executeQuery();
			
			%>
			<table border=1>
				<tr>
					<th>StudentId</th>
					<th>StudentName</th>
					<th>Email</th>
					<th>Gender</th>
					<th>Contact</th>
					<th>City</th>
					
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<th><%=rs.getString(1)%></th>
					<th><%=rs.getString(2)%></th>
					<th><%=rs.getString(3)%></th>
					<th><%=rs.getString(7)%></th>
					<th><%=rs.getString(5)%></th>
					<th><%=rs.getString(6)%></th>
				</tr>
				<%
				}
				%>
				
			</table>
			<%
						
			}catch(Exception e){
				System.out.println(e);
		}
	}
	%>
	
</body>
</html>