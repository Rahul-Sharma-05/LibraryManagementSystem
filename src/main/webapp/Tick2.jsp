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
	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
	<%
	try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Aaryan@004");

		String btn = request.getParameter("action");
		
		if(btn.equalsIgnoreCase("issue")) {
	    int id = (int) session.getAttribute("StudentId");
        String bid1 = request.getParameter("BookId");
        int bid = Integer.parseInt(bid1);
        
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        
            PreparedStatement pstm = con.prepareStatement("INSERT INTO IssuedBook (BookId, StudentId, IssueDate) VALUES (?,?,?)");
            pstm.setInt(1, bid);
            pstm.setInt(2, id);
            pstm.setString(3, sdf.format(d));
            pstm.executeUpdate();
            
          	//Decreasing Quantity of Book
          	PreparedStatement ptmt = con.prepareStatement("UPDATE Book SET BookQuantity = BookQuantity-1 WHERE BookId="+bid);
          	ptmt.executeUpdate();
          	System.out.println("Update done.");
          	
            
     		out.println("<video width='320' height='240' autoplay muted>");
            out.println("<source src='tick.mp4' type='video/mp4'>");
            out.println("</video>");
            out.println("<p>Thank You! Book Borrowed.</p>");
            out.println("<form action='StudentDashboard.jsp'>");
            out.println("<button type='Submit'>Go To Dashboard</button>");
            out.println("</form>");
            out.println("<form action='Logout'>");
            out.println("<button type='Submit'>Logout</button>");
            out.println("</form>");
            
		}
		
		
		if(btn.equalsIgnoreCase("return")) {
		   
	        String cno1 = request.getParameter("CallNo");
	        int cno = Integer.parseInt(cno1);
	        
	        Date d = new Date();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        
	        
	            PreparedStatement pstm = con.prepareStatement("UPDATE IssuedBook SET ReturnDate = ? WHERE CallNo = ?;");
	            pstm.setString(1, sdf.format(d));
	            pstm.setInt(2, cno);
	            
	            pstm.executeUpdate();
	            
	            PreparedStatement ptmt1 = con.prepareStatement("SELECT BookId FROM IssuedBook WHERE CallNo = ?");
	            ptmt1.setInt(1, cno);
	            ResultSet rs = ptmt1.executeQuery();
	            if (rs.next()) {
	                int bid = rs.getInt("BookId");
	                
	                // Increase quantity of the returned book
	                PreparedStatement ptmt2 = con.prepareStatement("UPDATE Book SET BookQuantity = BookQuantity + 1 WHERE BookId = ?");
	                ptmt2.setInt(1, bid);
	                ptmt2.executeUpdate();
	            }
	            
	          	System.out.println("Update done.");
	          	
	            // Close the database connection
	            con.close();
	     		out.println("<video width='320' height='240' autoplay muted>");
	            out.println("<source src='tick.mp4' type='video/mp4'>");
	            out.println("</video>");
	            out.println("<p>Thank You! Book Returned.</p>");
	            out.println("<form action='StudentDashboard.jsp'>");
	            out.println("<button type='Submit'>Go To Dashboard</button>");
	            out.println("</form>");
	            out.println("<form action='Logout'>");
	            out.println("<button type='Submit'>Logout</button>");
	            out.println("</form>");
	            
	            
	         // Close the database connection
	            con.close();
			}
        } catch (Exception e) {
            e.printStackTrace();
        }   %>
</body>
</html>