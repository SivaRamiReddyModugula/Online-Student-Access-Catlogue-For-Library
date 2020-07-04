<%-- 
    Document   : UpdateFineInDB
    Created on : Jan 30, 2020, 10:27:17 AM
    Author     : Siva Rami Reddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String htno=(String)session.getAttribute("htno");
        Connection conn = DBConnection.getConnection();
        PreparedStatement ps=conn.prepareStatement("update issue set fine='0' where htno='"+htno+"' and status='submitted'");
        int i=ps.executeUpdate();
        if(i>0){%>
        <script>
            alert("Fine updated successful");
            window.location="AdminHome.jsp";
        </script>
        <%}else{%>
        <script>
            alert("Fine updated Un-successful");
            window.location="AdminHome.jsp";
        </script>
        <%}
         %>
        
        
    </body>
</html>
