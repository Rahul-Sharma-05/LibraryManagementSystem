<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> Welcome  <%= session.getAttribute("StudentName")%></p>
	<p> Your Student Id is : <%= session.getAttribute("StudentId")%></p>
	
	<a href="UpdateProfile.html">Update Profile</a>
</body>
</html>