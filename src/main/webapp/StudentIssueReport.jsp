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
        <title>JSP Page</title>
    </head>
    <body>
        <%
        {
            try (PrintWriter pw = new PrintWriter(new File("C:\\Reports\\Student Pending Issue.csv"))) {
                StringBuilder sb=new StringBuilder();
                
                Connection conn=null;
                DBConnection DBConn=new DBConnection();
                conn=DBConnection.getConnection();
                
                String query="Select * from issue where status='issued'";
                PreparedStatement ps=conn.prepareStatement(query);
                ResultSet rs=ps.executeQuery();
                
                sb.append("Book ID");
                sb.append(",");
                sb.append("Book Name");
                sb.append(",");
                sb.append("Author");
                sb.append(",");
                sb.append("Hall-ticket Number");
                sb.append(",");
                sb.append("Student Name");
                sb.append(",");
                sb.append("Issued Date");
                sb.append(",");
                sb.append("Submite Date");
                sb.append("\r\n");
                
                while(rs.next()){
                    sb.append(rs.getString("bid"));
                    sb.append(",");
                    sb.append(rs.getString("bname"));
                    sb.append(",");
                    sb.append(rs.getString("author"));
                    sb.append(",");
                    sb.append(rs.getString("htno"));
                    sb.append(",");
                    sb.append(rs.getString("sname"));
                    sb.append(",");
                    sb.append(rs.getString("issue"));
                    sb.append(",");
                    sb.append(rs.getString("submit"));
                    sb.append("\r\n");
                }
                pw.write(sb.toString());
            }
            System.out.println("Fineshed");
        } 
        %>
        <%
        {
            try (PrintWriter pw = new PrintWriter(new File("C:\\Reports\\Student Issue.csv"))) {
                StringBuilder sb=new StringBuilder();
                
                Connection conn=null;
                DBConnection DBConn=new DBConnection();
                conn=DBConnection.getConnection();
                
                String query="Select * from issue";
                PreparedStatement ps=conn.prepareStatement(query);
                ResultSet rs=ps.executeQuery();
                
                sb.append("Book ID");
                sb.append(",");
                sb.append("Book Name");
                sb.append(",");
                sb.append("Author");
                sb.append(",");
                sb.append("Hall-ticket Number");
                sb.append(",");
                sb.append("Student Name");
                sb.append(",");
                sb.append("Issued Date");
                sb.append(",");
                sb.append("Submite Date");
                sb.append("\r\n");
                
                while(rs.next()){
                    sb.append(rs.getString("bid"));
                    sb.append(",");
                    sb.append(rs.getString("bname"));
                    sb.append(",");
                    sb.append(rs.getString("author"));
                    sb.append(",");
                    sb.append(rs.getString("htno"));
                    sb.append(",");
                    sb.append(rs.getString("sname"));
                    sb.append(",");
                    sb.append(rs.getString("issue"));
                    sb.append(",");
                    sb.append(rs.getString("submit"));
                    sb.append(",");
                    sb.append(rs.getString("status"));
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
