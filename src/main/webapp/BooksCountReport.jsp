<%-- 
    Document   : StudentDetailReport
    Created on : 7 Mar, 2020, 12:36:08 PM
    Author     : Siva Rami Reddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
        <title>Book Count Report</title>
    </head>
    <body>
        <%
        {
            try (PrintWriter pw = new PrintWriter(new File("C:\\Library Reports\\Book Count.csv"))) {
                StringBuilder sb=new StringBuilder();
                
                Connection conn=null;
                DBConnection DBConn=new DBConnection();
                conn=DBConnection.getConnection();
                
                String query="Select * from book";
                PreparedStatement ps=conn.prepareStatement(query);
                ResultSet rs=ps.executeQuery();
                sb.append("S,No");
                sb.append(",");
                sb.append("Book Name");
                sb.append(",");
                sb.append("Publication");
                sb.append(",");
                sb.append("No of Count");
                sb.append(",");
                sb.append("No of Books Issued");
                sb.append(",");
                sb.append("No of Books Avalable");
                sb.append("\r\n");
                
                while(rs.next()){
                    sb.append(rs.getString("sno"));
                    sb.append(",");
                    sb.append(rs.getString("bname"));
                    sb.append(",");
                    sb.append(rs.getString("publication"));
                    sb.append(",");
                    sb.append(rs.getString("Count"));
                    sb.append(",");
                    sb.append(rs.getString("issue"));
                    sb.append(",");
                    sb.append(rs.getString("available"));
                    sb.append("\r\n");
                }
                pw.write(sb.toString());
            }
            System.out.println("Fineshed");
        } 
        %>
        <script>
            alert("Report Created Successful");
            window.location="GenerateReports.jsp";
        </script>
    </body>
</html>
