<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Profile</title>
</head>
<body>
	<h1>Update Student Details</h1>
    
        <form Action="Student.jsp" method="post">
        	<pre><p>Student Id:              <input type="text" size="50" name="id" id="id" value="<%= request.getParameter("t1")%>"></p></pre>
            <pre><p>Name:              <input type="text" size="50" name="Name" id="Name" placeholder="Enter new name"></p></pre>
            <pre><p>E-mail ID:         <input type="email" size="50" name="Email" id="Email" placeholder="Enter new email id"></p></pre>
            <pre><p>Password:          <input type="password" size="15" name="Password" id="Password" placeholder="Enter new password"></p></pre>
            <pre><p>Contact:           <input type="number" min=1000000000 max=9999999999 name="Contact" id="Contact" placeholder="Enter new Contact number"></p></pre>
            <pre><p>City:              <input type="text" size="20" name="City" id="City" placeholder="Enter new City"></p></pre>
            
               
             <input type="SUBMIT" value="Update Student" name="b1">    <input type="RESET" value="RESET">
        </form>
</body>
</html>