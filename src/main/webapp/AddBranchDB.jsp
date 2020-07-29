<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
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
	String branch=request.getParameter("branch").toUpperCase().trim();
	Connection conn=DBConnection.getConnection();
	PreparedStatement ps=conn.prepareStatement("select * from branch where branch='"+branch+"'");
	ResultSet rs=ps.executeQuery();
	if(rs.next()==false){
	PreparedStatement ps1=conn.prepareStatement("insert into branch(branch) values(?)");
	ps1.setString(1, branch);
	int i=ps1.executeUpdate();
	if(i>0){%>
		<script type="text/javascript">
			alert("Branch added Successful.");
			window.location="AdminUpdate.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert("Branch added Un-Successful.");
			window.location="AdminUpdate.jsp";
		</script>
	<%}
	}else{%>
		<script type="text/javascript">
			alert("Branch Already exists.");
			window.location="AdminUpdate.jsp";
		</script>
	<%}
%>
</body>
</html>