
<%@page import="Action.Mails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Action.MailUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="shortcut icon" type="image/x-icon" href="images/logo.ico">
<title>sending mails</title>
</head>
<body>
	<%
		Thread t = new Thread(new Mails());
	t.start();
	t.setName("Thread-Mailing Student");
	%>
	<script>
		alert("Mails Sent Successefull");
		window.location = "AdminHome.jsp";
	</script>

</body>
</html>
