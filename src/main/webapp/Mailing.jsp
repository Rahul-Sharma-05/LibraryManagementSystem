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
	
	//String st2 = request.getParameter("Email");
	
	

	// Sending email

	// Sender's email address
	String senderEmail = "libcocas777@gmail.com";
	String senderPassword = "tskjoolsdegahrnh";

	// Recipient's email addresss
	//String recipientEmail = st2;

	// SMTP server details
	String smtpHost = "smtp.gmail.com";
	int smtpPort = 587; // or any other port

	// Set up JavaMail properties
	Properties props = new Properties();
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.ssl.enable", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", smtpHost);
	props.put("mail.smtp.port", smtpPort);

	props.put("mail.smtp.ssl.protocols", "TLSv1.2");
	props.put("mail.smtp.ssl.ciphersuites", "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256");
	
	props.put("mail.debug", "true");


	// Create a session with authentication
	Session ss = Session.getInstance(props, new Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(senderEmail, senderPassword);
		}
	});
	try {
		// Create a default MimeMessage object
		MimeMessage message = new MimeMessage(ss);

		// Set From: header field of the header
		message.setFrom(senderEmail);

		// Set To: header field of the header
		message.addRecipient(Message.RecipientType.TO, new InternetAddress("rahulkumar219209200@gmail.com"));
		
		// Set Subject: header field
		message.setSubject("Stack Lib Registration Successful");

		// Now set the actual message
		message.setText("Hello....Send Successfully..");

		// Send message
		Transport.send(message);

		System.out.println("Email sent successfully!");
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>