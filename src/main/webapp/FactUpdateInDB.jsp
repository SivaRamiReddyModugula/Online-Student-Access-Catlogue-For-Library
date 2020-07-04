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
        <title>Faculty update</title>
    </head>
    <body>
        <%
            String fid=(String)session.getAttribute("fid");
            String email=request.getParameter("email");
            String mno=request.getParameter("mno");
            String pswd=request.getParameter("pswd");
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps=conn.prepareStatement("update faculty set email='"+email+"',mno='"+mno+"',pswd='"+pswd+"' where fid='"+fid+"'");
            int i=ps.executeUpdate();
            if(i>0){%>
            <script>
                alert("Details updated successful");
            window.location="FacultyProfile.jsp";
            </script>
        <%}else{%>
        <script>
            alert("Details updated Un-successful");
            window.location="FacltyProfile.jsp";
        </script>
            <%}
        %>
    </body>
</html>
