<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>
</head>
<body>
	<p> Welcome  <%= session.getAttribute("StudentName")%></p>
	<p> Your Student Id is : <%= session.getAttribute("StudentId")%></p>
	
	<a href="UpdateProfile.html">Update Profile</a><br>
	<a href="SearchBookStudent.html">Search Book</a><br>
	<a href="IssueBook.jsp?b1=Search All">Issue Book</a><br>
	<a href="ShowIssuedBook.jsp?btn=ShowIssue" >Show Issued Book</a><br>
	<a href="ShowIssuedBook.jsp?btn=Return" name="b1">Return Book</a><br>
	
	<form action="Login" method="post">
		<button type="submit" value="StudentLogin" name="btn">Login</button>
	</form>
	<form action="Logout" method="post">
		<button type="submit" value ="slogout" name="btn">Logout</button>
	</form>
	
</body>
</html>