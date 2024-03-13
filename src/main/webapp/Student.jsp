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
		
		String btn=request.getParameter("b1");
		
		// Start of Add Student
		
		if(btn.equalsIgnoreCase("Submit Form") || btn.equalsIgnoreCase("Add Student")) {
			
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
		if(btn.equalsIgnoreCase("Submit Form")){
		out.println("<script>alert('Registration Completed.')</script>");
		%>
		<script>
		window.location.href = "StudentLogin.html";
		</script>
		<%
		}else{
		out.println("<script>alert('Student Added Successfully.')</script>");
		%>
		<script>
		window.location.href = "AddStudent.html";
		</script>
		<%
		}
		
		
		}
		
		// End of Add Student
		
		// Start of Delete Student
		
		if(btn.equalsIgnoreCase("Delete")){
			
			String st1 = request.getParameter("t1");
			int st11=Integer.parseInt(st1);
				
			Statement stmt1=con.createStatement();
			ResultSet rs=stmt1.executeQuery("Select StudentId from Student");
			
			boolean b=false;
			
			while(rs.next()){
				int val=rs.getInt(1);
				
			
				if(val==st11){
					Statement stmt2=con.createStatement();
					stmt2.executeUpdate("delete from Student where StudentId=" +val);
					out.println("<script>alert('Student Deleted Successfully.')</script>");
					b=true;
					%>
					<script>
					window.location.href = "DeleteStudent.html";
					</script>
					<%
					break;
				}
				
			}
			if(b==false){
				
			
				
			out.println("<script>alert('Student Id Does Not Exist.')</script>");
				
				%>
				<script>
				window.location.href = "DeleteStudent.html";
				</script>
				<%
			}
			
			}
		
			// End of Delete Student
		
		
			// Start of Update Student by Student
			
			if(btn.equalsIgnoreCase("Update")) {
				
				int id = (int) session.getAttribute("StudentId");
				String name = request.getParameter("Name");
				String email = request.getParameter("Email");
				String password = request.getParameter("Password");
				String contact = request.getParameter("Contact");
				String city = request.getParameter("City");
				
				if(name != "") {
					PreparedStatement pstm = con.prepareStatement("UPDATE Student SET StudentName = ? WHERE StudentId = ?");
					pstm.setString(1, name);
					pstm.setInt(2, id);
					pstm.executeUpdate();
				}
				
				if(email != "") {
					PreparedStatement pstm = con.prepareStatement("UPDATE Student SET StudentEmail = ? WHERE StudentId = ?");
					pstm.setString(1, email);
					pstm.setInt(2, id);
					pstm.executeUpdate();
				}
				
				if(password != "") {
					PreparedStatement pstm = con.prepareStatement("UPDATE Student SET password = ? WHERE StudentId = ?");
					pstm.setString(1, password);
					pstm.setInt(2, id);
					pstm.executeUpdate();
				}
				
				if(contact != "") {
					PreparedStatement pstm = con.prepareStatement("UPDATE Student SET StudentContact = ? WHERE StudentId = ?");
					pstm.setString(1, contact);
					pstm.setInt(2, id);
					pstm.executeUpdate();
				}
				
				if(city != "") {
					PreparedStatement pstm = con.prepareStatement("UPDATE Student SET StudentCity = ? WHERE StudentId = ?");
					pstm.setString(1, city);
					pstm.setInt(2, id);
					pstm.executeUpdate();
				}
				
				out.println("<script>alert('Profile Updated Successfully.')</script>");
				
				%>
				<script>
				window.location.href = "StudentDashboard.jsp";
				</script>
				<%
		}
	
			// End of Update Student by Student
		
		
			// Start of Update Student by Admin
			
			if(btn.equalsIgnoreCase("Update Student")) {
				
				String sid = request.getParameter("id");
				int id = Integer.parseInt(sid);
				String name = request.getParameter("Name");
				String email = request.getParameter("Email");
				String password = request.getParameter("Password");
				String contact = request.getParameter("Contact");
				String city = request.getParameter("City");
				
				if(name != "") {
					PreparedStatement pstm = con.prepareStatement("UPDATE Student SET StudentName = ? WHERE StudentId = ?");
					pstm.setString(1, name);
					pstm.setInt(2, id);
					pstm.executeUpdate();
				}
				
				if(email != "") {
					PreparedStatement pstm = con.prepareStatement("UPDATE Student SET StudentEmail = ? WHERE StudentId = ?");
					pstm.setString(1, email);
					pstm.setInt(2, id);
					pstm.executeUpdate();
				}
				
				if(password != "") {
					PreparedStatement pstm = con.prepareStatement("UPDATE Student SET password = ? WHERE StudentId = ?");
					pstm.setString(1, password);
					pstm.setInt(2, id);
					pstm.executeUpdate();
				}
				
				if(contact != "") {
					PreparedStatement pstm = con.prepareStatement("UPDATE Student SET StudentContact = ? WHERE StudentId = ?");
					pstm.setString(1, contact);
					pstm.setInt(2, id);
					pstm.executeUpdate();
				}
				
				if(city != "") {
					PreparedStatement pstm = con.prepareStatement("UPDATE Student SET StudentCity = ? WHERE StudentId = ?");
					pstm.setString(1, city);
					pstm.setInt(2, id);
					pstm.executeUpdate();
				}
				
				out.println("<script>alert('Student Details Updated Successfully.')</script>");
				
				%>
				
				<script>
				window.location.href = "AdminDashboard.jsp";
				</script>
				<%
		}
	
			// End of Update Student by Admin
			
		}catch(Exception e){
		System.out.println(e);
		
	}


%>

</body>
</html>