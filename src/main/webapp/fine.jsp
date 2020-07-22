<%-- 
    Document   : fine
    Created on : 15 Dec, 2019, 2:17:07 PM
    Author     : Prudvi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
        <title>Fine</title>
    </head>
    <body>
        <%
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("update issue set submitted=(select CURDATE()) where status='issued'");
            int i = ps.executeUpdate();
            if(i>0){
                PreparedStatement ps1 = conn.prepareStatement("select * from issue where status='issued'");
                ResultSet rs = ps1.executeQuery();
                while(rs.next()){
                    int sno = rs.getInt("sno");
                    PreparedStatement ps2 = conn.prepareStatement("update issue set fine=(SELECT DATEDIFF('"+rs.getDate("submitted")+"', '"+rs.getDate("submit")+"') AS 'Result') where sno='"+sno+"'");
                    ps2.executeUpdate();
                }
                
            }
        %>
    </body>
</html>
