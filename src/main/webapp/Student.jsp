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
		out.println("<script>alert('User Added Successfully.')</script>");
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
		
		
		
		
		
		}catch(Exception e){
		System.out.println(e);
		
	}


%>

</body>
</html>