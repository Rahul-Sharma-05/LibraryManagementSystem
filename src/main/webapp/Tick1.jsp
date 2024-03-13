<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrowing</title>
<!-- Include jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<%
    String bid = request.getParameter("BookId");
%>

<script type="text/javascript">
    // JavaScript code for confirmation dialog
    var result = confirm("Press a button!");
    if (result) {
        // Send a POST request to Tick2.jsp with the bookId parameter
        $.post('Tick2.jsp', { BookId: <%= bid %> });
        window.location.href = "Tick3.html";
    } else {
    	var st = "Search All";
    	window.location.href = "IssueBook.jsp?b1="+ st;
    }
</script>

</body>
</html>
