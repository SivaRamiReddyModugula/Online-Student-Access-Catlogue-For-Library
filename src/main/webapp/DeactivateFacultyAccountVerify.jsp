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
	String fid = request.getParameter("fid");
	session.setAttribute("fid", fid);
	Connection conn = DBConnection.getConnection(); 
    PreparedStatement ps=conn.prepareStatement("select * from faculty where fid='"+fid+"' AND status='Accepted'");
    ResultSet rs=ps.executeQuery();
    if(rs.next()){%>
    	<script>
			window.location="DeactivateFacultyAccount.jsp";
    	</script>
    <%}else{%>
    	<script>
			alert("Account already Deactivated");
			window.location="Deactivate.jsp";
    	</script>
    <%}
	%>
</body>
</html>