<%@page import="java.io.FileReader"%>
<%@page import="com.opencsv.CSVReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
	Part part=request.getPart("file");
	String fileName=part.getSubmittedFileName();
	out.print(fileName);
	
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>