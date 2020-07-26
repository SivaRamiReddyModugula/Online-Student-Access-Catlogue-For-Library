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
	String htno = request.getParameter("htno");
	session.setAttribute("htno", htno);
	Connection conn = DBConnection.getConnection(); 
    PreparedStatement ps=conn.prepareStatement("select * from student where htno='"+htno+"' AND status='Accepted'");
    ResultSet rs=ps.executeQuery();
    if(rs.next()){%>
    	<script>
			window.location="DeactivateStudentAccount.jsp";
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