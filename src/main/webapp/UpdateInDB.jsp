<%-- 
    Document   : UpdateInDB
    Created on : 5 Mar, 2020, 8:11:14 PM
    Author     : Siva Rami Reddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String htno=(String)session.getAttribute("htno");
            String email=request.getParameter("email");
            String mno=request.getParameter("mno");
            String pswd=request.getParameter("pswd");
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps=conn.prepareStatement("update student set email='"+email+"',mno='"+mno+"',pswd='"+pswd+"' where htno='"+htno+"'");
            int i=ps.executeUpdate();
            if(i>0){%>
            <script>
                alert("Details updated successful");
            window.location="StudentProfile.jsp";
            </script>
        <%}else{%>
        <script>
            alert("Details updated Un-successful");
            window.location="StudentProfile.jsp";
        </script>
            <%}
        %>
    </body>
</html>
