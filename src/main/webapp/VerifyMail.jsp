<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<title>Insert title here</title>
</head>
<body>
<%
Connection conn=DBConnection.getConnection();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
Calendar cal = Calendar.getInstance();
String date = sdf.format(cal.getTime());
PreparedStatement ps=conn.prepareStatement("select * from admin where date='"+date+"'");
ResultSet rs=ps.executeQuery();
if(rs.next()){%>
	<script>window.location="AdminHome.jsp";</script>
<%}else{
	PreparedStatement ps1=conn.prepareStatement("insert into admin(date,status) values(?,?)");
	ps1.setString(1, date);
	ps1.setString(2, "sent");
	int i=ps1.executeUpdate();
	if(i>0){%>
		<script>window.location="MailConfirm.jsp";</script>
		
	<%}else{%>
		<script>window.location="AdminHome.jsp"</script>
	<%}
}
%>
</body>
</html>