<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrowing</title>
<!-- Include jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<%
	String btn = request.getParameter("action");
	%>

	<script type="text/javascript">
		var btn = "<%=btn%>";

		if (btn === "issue") {
			<%
			String bid = request.getParameter("BookId");
			%>
			var result = confirm("Press a button!");
			if (result) {
				window.location.href = "Tick2.jsp?action=issue&BookId=" +<%=bid%>;
			} else {
				var st = "Search All";
				window.location.href = "IssueBook.jsp?b1=" + st;
			}
		}
		
		if (btn === "return1") {
			<%
			String cno1 = request.getParameter("CallNo");
			%>
			var result = confirm("Press a button!");
			if (result) {
				window.location.href = "Tick2.jsp?action=return&CallNo=" +<%=cno1%>;
			} else {
				var st = "ShowIssue";
				window.location.href = "ShowIssuedBook.jsp?btn=" + st;
			}
		}
		
		if (btn === "return2") {
			<%
			String cno2 = request.getParameter("CallNo");
			%>
			var result = confirm("Press a button!");
			if (result) {
				window.location.href = "Tick2.jsp?action=return&CallNo=" +<%=cno2%>;
			} else {
				var st = "return";
				window.location.href = "ShowIssuedBook.jsp?btn=" + st;
			}
		}
	</script>

</body>
</html>
