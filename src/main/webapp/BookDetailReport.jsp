<%-- 
    Document   : StudentDetailReport
    Created on : 7 Mar, 2020, 12:36:08 PM
    Author     : Siva Rami Reddy
--%>
<!-- Importing necessary packages. -->
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
        <title>Book Detail Report</title>
    </head>
    <body>
        <%
        {
        	// Creating the csv file for total books.
            try (PrintWriter pw = new PrintWriter(new File("C:\\Library Reports\\Total Book Details.csv"))) {
                StringBuilder sb=new StringBuilder();
                
                // Database connection.
                Connection conn=null;
                DBConnection DBConn=new DBConnection();
                conn=DBConnection.getConnection();
                
                // Getting details form database.
                String query="Select * from books";
                PreparedStatement ps=conn.prepareStatement(query);
                ResultSet rs=ps.executeQuery();
                
                // Header section in CSV file.
                sb.append("Book id");
                sb.append(",");
                sb.append("Call No");
                sb.append(",");
                sb.append("Title of The Book");
                sb.append(",");
                sb.append("Publication");
                sb.append(",");
                sb.append("Year of Publication");
                sb.append(",");
                sb.append("Vendor or Doner");
                sb.append(",");
                sb.append("Invoice No");
                sb.append(",");
                sb.append("Pages");
                sb.append(",");
                sb.append("Edition");
                sb.append(",");
                sb.append("Price");
                sb.append(",");
                sb.append("Course");
                sb.append(",");
                sb.append("Branch");
                sb.append("\r\n");
                
                //Body section in CSV file.
                while(rs.next()){
                    sb.append(rs.getString("bid"));
                    sb.append(",");
                    sb.append(rs.getString("callno"));
                    sb.append(",");
                    sb.append(rs.getString("bname"));
                    sb.append(",");
                    sb.append(rs.getString("publication"));
                    sb.append(",");
                    sb.append(rs.getString("yearofpublication"));
                    sb.append(",");
                    sb.append(rs.getString("vendorordoner"));
                    sb.append(",");
                    sb.append(rs.getString("invoiceno"));
                    sb.append(",");
                    sb.append(rs.getString("pages"));
                    sb.append(",");
                    sb.append(rs.getString("edition"));
                    sb.append(",");
                    sb.append(rs.getString("price"));
                    sb.append(",");
                    sb.append(rs.getString("course"));
                    sb.append(",");
                    sb.append(rs.getString("branch"));
                    sb.append("\r\n");
                }
                // Write to the CSV file.
                pw.write(sb.toString());
            }
            System.out.println("Fineshed");
        } 
        %>
        <!-- Redirection -->
        <script>
            alert("Report Created Successful");
            window.location="GenerateReports.jsp";
        </script>
    </body>
</html>
