<%-- 
    Document   : RejectFaculty
    Created on : 11 Apr, 2020, 11:51:56 AM
    Author     : Siva Rami Reddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="Action.MailUtil"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
        <title>Reject Faculty</title>
    </head>
    <body>
        <%
            String fid = request.getParameter("fid");
            String email = request.getParameter("email");
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps=conn.prepareStatement("delete from faculty where fid='"+fid+"'");
            
            String[] mail=new String[]{email};
            String sub="Account Rejection";
            String msg="<head><meta charset=“UTF-8”></head><p><b>Respected Teacher,</b> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Your Library Account has been <b style=\"color:red\">'Rejectied'</b> by the Librarian. Some of the columns are missing. Please Try again without any missing columns.</p><br><br><h3 align=\"center\">Thank You!! &#x1F60a;</h3>";
                    //sending mail
            if(new MailUtil().sendMail(mail, mail, sub, msg)){
                int i = ps.executeUpdate();
                if(i>0){    
                %>
                  <script>
                      alert("Account Rejected.. and mail send Successful");
                      window.location="ViewFaculty.jsp";
                  </script>
                    <%  
                }
                else{            
            %>
                  <script>
                      alert("Account Rejection Un-Successful..");
                      window.location="ViewFaculty.jsp";
                  </script>
                    <% 
                }
            }else{%>
                    <script>
                      alert("Account Rejection mail sent Un-Successful.. and cant Reject the account");
                      window.location="ViewFaculty.jsp";
                  </script>
                  <%}
        %>
    </body>
</html>
