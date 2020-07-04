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
        <title>JSP Page</title>
    </head>
    <body>
        <%
        {
            try (PrintWriter pw = new PrintWriter(new File("C:\\Reports\\Faculty Pending Issue.csv"))) {
                StringBuilder sb=new StringBuilder();
                
                Connection conn=null;
                DBConnection DBConn=new DBConnection();
                conn=DBConnection.getConnection();
                
                String query="Select * from factissue where status='issued'";
                PreparedStatement ps=conn.prepareStatement(query);
                ResultSet rs=ps.executeQuery();
                
                sb.append("Book ID");
                sb.append(",");
                sb.append("Book Name");
                sb.append(",");
                sb.append("Author");
                sb.append(",");
                sb.append("Faculty ID");
                sb.append(",");
                sb.append("Faculty Name");
                sb.append(",");
                sb.append("Issued Date");
                sb.append(",");
                sb.append("Submit Date");
                sb.append("\r\n");
                
                while(rs.next()){
                    sb.append(rs.getString("bid"));
                    sb.append(",");
                    sb.append(rs.getString("bname"));
                    sb.append(",");
                    sb.append(rs.getString("author"));
                    sb.append(",");
                    sb.append(rs.getString("fid"));
                    sb.append(",");
                    sb.append(rs.getString("fname"));
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
            try (PrintWriter pw = new PrintWriter(new File("C:\\Reports\\Faculty Issue.csv"))) {
                StringBuilder sb=new StringBuilder();
                
                Connection conn=null;
                DBConnection DBConn=new DBConnection();
                conn=DBConnection.getConnection();
                
                String query="Select * from factissue";
                PreparedStatement ps=conn.prepareStatement(query);
                ResultSet rs=ps.executeQuery();
                
                sb.append("Book ID");
                sb.append(",");
                sb.append("Book Name");
                sb.append(",");
                sb.append("Author");
                sb.append(",");
                sb.append("Faculty ID");
                sb.append(",");
                sb.append("Faculty Name");
                sb.append(",");
                sb.append("Issued Date");
                sb.append(",");
                sb.append("Submit Date");
                sb.append("\r\n");
                
                while(rs.next()){
                    sb.append(rs.getString("bid"));
                    sb.append(",");
                    sb.append(rs.getString("bname"));
                    sb.append(",");
                    sb.append(rs.getString("author"));
                    sb.append(",");
                    sb.append(rs.getString("fid"));
                    sb.append(",");
                    sb.append(rs.getString("fname"));
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
