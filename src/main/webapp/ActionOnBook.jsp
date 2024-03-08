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
			
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con = DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/test","root","Aaryan@004");  
			
			String bt1 = request.getParameter("b1");
			
			if(bt1.equalsIgnoreCase("add")) {
				
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
							
						}
					
				}else{
					out.println("<script>alert('Book Already Exist.')</script>");
				}
			}
				
				//End of AddBook
				
				
				//Start of DeleteBook
				
				String b3=request.getParameter("b1");
				
				if(b3.equalsIgnoreCase("Delete")){
					String t1 = request.getParameter("t1");
					int st1=Integer.parseInt(t1);
					
				Statement stmt1=con.createStatement();
				ResultSet rs=stmt1.executeQuery("Select BookId from Book");
				
				boolean b=false;
				while(rs.next()){
					int val=rs.getInt(1);
					
				
					if(val==st1){
						Statement stmt2=con.createStatement();
						stmt2.executeUpdate("delete from Book where BookId=" +val);
						out.println("<script>alert('Book Deleted Successfully.')</script>");
						b=true;
						break;
					}
					
				}
				if(b==false){
					out.println("<script>alert('Book Does Not Exist.')</script>");
				}
				
				}
				
				
		
	
					
		}catch(Exception e){
			e.printStackTrace();
		}
		
		

	
	%>
	

</body>
</html>