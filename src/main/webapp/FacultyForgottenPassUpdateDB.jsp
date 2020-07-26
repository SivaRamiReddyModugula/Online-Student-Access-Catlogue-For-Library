<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Student Access Catalogue for Library</title>
<link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
</head>
<body>
<%
String pswd=request.getParameter("pswd");
String fid=(String)session.getAttribute("fid");
Connection connection=DBConnection.getConnection();
PreparedStatement ps=connection.prepareStatement("update faculty set pswd='"+pswd+"' where fid='"+fid+"'");
int i=ps.executeUpdate();
if(i>0){
	//System.out.println("Password updated successful");
	%>
	<script>
		alert("Password Updated Successful");
		window.location="index.html";
	</script>
<%}else{%>
	<script>
		alert("Password updated Un-Successful");
		window.location="index.html";
	</script>
<%}
%>
</body>
</html>