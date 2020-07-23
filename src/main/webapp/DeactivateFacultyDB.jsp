<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String fid = (String)session.getAttribute("fid");
Connection conn=DBConnection.getConnection();
PreparedStatement ps=conn.prepareStatement("update faculty set status='Deactivated' where fid='"+fid+"'");
int i=ps.executeUpdate();
if(i>0){%>
	<script>
		alert("Account Deactivated Successful");
		window.location="AdminHome.jsp";
	</script>
<%}else{%>
	<script>
		alert("Account Deactivated Un-Successful");
		window.location="AdminHome.jsp";
	</script>
<% }
%>
</body>
</html>