<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import ="java.sql.*"%>
	
	<%
	
		
		try{
			// Creating DataBase Connection
			
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con = DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/test","root","Admin@123");  
			
			
			String buttonValue = request.getParameter("b1");
			
			// Start of Add Book
			
			if(buttonValue.equalsIgnoreCase("add")) {
				
				String st1 = request.getParameter("t1");
				int st11 = Integer.parseInt(st1); 
				
				String st2 = request.getParameter("t2");
				String st3 = request.getParameter("t3");
				String st4 = request.getParameter("t4");
				
				int st6 = 0;
				String st5 = request.getParameter("t5");
				if(st5 != ""){
				st6 = Integer.parseInt(st5);
				}
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT BookId FROM Book");
			
			String flag = "red";
			
			while(rs.next()) {
				int val = rs.getInt(1);
				
				if(val != st11){
					flag = "green";
				}else{
					flag = "red";
					
					break;
				}
				
			}
				
				
				if(flag == "green"){
					
					if(st5 == ""){
						String query = "INSERT INTO Book (BookId, BookName , BookAuthor, BookPublication) VALUE(?,?,?,?)";
						
						PreparedStatement pstm = con.prepareStatement(query);
						pstm.setInt(1, st11);
						pstm.setString(2, st2);
						pstm.setString(3, st3);
						pstm.setString(4, st4);
						
						pstm.executeUpdate();
						
						out.println("<script>alert('Book Added Successufully.')</script>");
								
						}else{
							
							String query = "INSERT INTO Book (BookId, BookName , BookAuthor, BookPublication, BookQuantity) VALUE(?,?,?,?,?)";
							
							PreparedStatement pstm = con.prepareStatement(query);
							pstm.setInt(1, st11);
							pstm.setString(2, st2);
							pstm.setString(3, st3);
							pstm.setString(4, st4);
							pstm.setInt(5, st6);
							
							pstm.executeUpdate();
							
							out.println("<script>alert('Book Added Successufully.')</script>");
							%>
							<script>
							window.location.href = "AddBook.html";
							</script>
							<%
							
						}
					
				}else{
					out.println("<script>alert('Book Already Exist.')</script>");
					%>
					<script>
					window.location.href = "AddBook.html";
					</script>
					<%
				}
			}
				
				//End of AddBook
				
				
				// Start of Update Book
				
				if(buttonValue.equalsIgnoreCase("Update")) {
					
					String st1 = request.getParameter("t1");
					int st11 = Integer.parseInt(st1);
					
					String st2 = request.getParameter("t2");
					String st3 = request.getParameter("t3");
					String st4 = request.getParameter("t4");
					
					int st55 = 0;
					String st5 = request.getParameter("t5");
					if(st5 != ""){
					st55 = Integer.parseInt(st5);
					}
					
					
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT BookId FROM Book");
					
					boolean b = false;
					
					while(rs.next()) {
						
						int val = rs.getInt(1);
						
						if(val == st11) {
							
							if(st2 != "") {
								PreparedStatement pstm = con.prepareStatement("UPDATE Book SET BookName = ? WHERE BookId = ?");
								pstm.setString(1, st2);
								pstm.setInt(2, st11);
								pstm.executeUpdate();
							}
							
							if(st3 != "") {
								PreparedStatement pstm = con.prepareStatement("UPDATE Book SET BookAuthor = ? WHERE BookId = ?");
								pstm.setString(1, st3);
								pstm.setInt(2, st11);
								pstm.executeUpdate();
							}
							
							if(st4 != "") {
								PreparedStatement pstm = con.prepareStatement("UPDATE Book SET BookPublication = ? WHERE BookId = ?");
								pstm.setString(1, st4);
								pstm.setInt(2, st11);
								pstm.executeUpdate();
							}
							
							if(st5 != "") {
								PreparedStatement pstm = con.prepareStatement("UPDATE Book SET BookQuantity = ? WHERE BookId = ?");
								pstm.setInt(1, st55);
								pstm.setInt(2, st11);
								pstm.executeUpdate();
							}
							
							out.println("<script>alert('Book Updated Successfully.')</script>");
							b=true;
							%>
							<script>
							window.location.href = "UpdateBook.html";
							</script>
							<%
							break;
						}
					}
					if(b == false){
						out.println("<script>alert('Book Does Not Exist.')</script>");
						%>
						<script>
						window.location.href = "UpdateBook.html";
						</script>
						<%
					}
				}
		
				// End of Update Book
				
				
				//Start of DeleteBook
				
				if(buttonValue.equalsIgnoreCase("Delete")){
					
				String st1 = request.getParameter("t1");
				int st11=Integer.parseInt(st1);
					
				Statement stmt1=con.createStatement();
				ResultSet rs=stmt1.executeQuery("Select BookId from Book");
				
				boolean b=false;
				
				while(rs.next()){
					int val=rs.getInt(1);
					
				
					if(val==st11){
						Statement stmt2=con.createStatement();
						stmt2.executeUpdate("delete from Book where BookId=" +val);
						out.println("<script>alert('Book Deleted Successfully.')</script>");
						b=true;
						%>
						<script>
						window.location.href = "DeleteBook.html";
						</script>
						<%
						break;
					}
					
				}
				if(b==false){
					out.println("<script>alert('Book Does Not Exist.')</script>");
					%>
					<script>
					window.location.href = "DeleteBook.html";
					</script>
					<%
				}
				
				}
				// End of Delete Book
				

		}catch(Exception e){
			e.printStackTrace();
		}
		
		

	
	%>
	

</body>
</html>