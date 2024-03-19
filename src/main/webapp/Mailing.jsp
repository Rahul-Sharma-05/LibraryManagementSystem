<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ page import = "java.sql.*"%>
	<%@ page import = "javax.mail.internet.*"%>
	<%@ page import = "java.util.Properties"%>
	<%@ page import = "javax.mail.*"%>
	<%
	
	String st2 = request.getParameter("Email");
	
	int sid = 0;
	String st1 = null;
	String st3 = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "Admin@123");

		// getting Student Id
		Statement stmt1 = con.createStatement();
		ResultSet rs = stmt1.executeQuery("SELECT StudentId, StudentName, Password from Student WHERE StudentEmail =" + st2);
		
		while (rs.next()) {
			sid = rs.getInt(1);
			st1 = rs.getString(2);
			st3 = rs.getString(3);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	// Sending email

	// Sender's email address
	String senderEmail = "libcocas777@gmail.com";
	String senderPassword = "Lib@COCAS#777";

	// Recipient's email addresss
	String recipientEmail = st2;

	// SMTP server details
	String smtpHost = "smtp.gmail.com";
	int smtpPort = 587; // or any other port

	// Set up JavaMail properties
	Properties props = new Properties();
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", smtpHost);
	props.put("mail.smtp.port", smtpPort);

	// Create a session with authentication
	Session ss = Session.getInstance(props, new Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(senderEmail, senderPassword);
		}
	});
	try {
		// Create a default MimeMessage object
		Message message = new MimeMessage(ss);

		// Set From: header field of the header
		message.setFrom(new InternetAddress(senderEmail));

		// Set To: header field of the header
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));

		// Set Subject: header field
		message.setSubject("Stack Lib Registration Successful");

		// Now set the actual message
		message.setText("Dear " + st1
				+ ",\n\nCongratulations..\nNow, You are the valuable member of StackLib.\n\nYour Student Id : "
				+ sid + "/n/nLogin Password : " + st3
				+ "\n\nKindly use this creditials to Login into StackLib.\nPlease keep the Id and Password safe.");

		// Send message
		Transport.send(message);

		System.out.println("Email sent successfully!");
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>