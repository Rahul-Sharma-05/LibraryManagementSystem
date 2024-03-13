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
	    int id = (int) session.getAttribute("StudentId");
        String bid1 = request.getParameter("BookId");
        int bid = Integer.parseInt(bid1);
        
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Rahul@earth5");

            PreparedStatement pstm = con.prepareStatement("INSERT INTO IssuedBook (BookId, StudentId, IssueDate) VALUES (?,?,?)");
            pstm.setInt(1, bid);
            pstm.setInt(2, id);
            pstm.setString(3, sdf.format(d));
            pstm.executeUpdate();
            
          	//Decreasing Quantity of Book
          	PreparedStatement ptmt = con.prepareStatement("UPDATE Book SET BookQuantity = BookQuantity-1 WHERE BookId="+bid);
          	ptmt.executeUpdate();
          	System.out.println("Update done.");
          	
            // Close the database connection
            con.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }   %>
</body>
</html>