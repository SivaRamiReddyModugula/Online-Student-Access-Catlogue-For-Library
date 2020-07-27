<%-- 
    Document   : GenerateAdminCode
    Created on : 10 Apr, 2020, 10:40:18 AM
    Author     : Siva Rami Reddy
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@page import="Action.MailUtil"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
        <title>Generate Student Forgotten Code</title>
    </head>
    <body>
        <%
        String htno=request.getParameter("htno");
        session.setAttribute("htno", htno);
        Connection conn=DBConnection.getConnection();
        PreparedStatement ps=conn.prepareStatement("select * from student where htno='"+htno+"' and status='Accepted'");
        ResultSet rs=ps.executeQuery();
        if(rs.next()){
        int length=6;
        String letters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        String numbers="1234567890";
        String email=rs.getString("email");
        String sname=rs.getString("sname");
        String pwd=letters+numbers;
        Random r=new Random();
        char[] newPass=new char[length];
        String finaly="";
        for(int i=0;i<length;i++){
            newPass[i]=pwd.charAt(r.nextInt(pwd.length()));
            finaly=finaly+newPass[i];
        }
        finaly=finaly;
        String[] mail=new String[]{email};
        String sub="Forgotten Code";
        String msg="<head><meta charset=“UTF-8”></head><p><b>Dear "+sname+",</b> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Your forgotten code is <b style=\"color: green\">'"+finaly+"'</b>. Please verify and access your account. <br><p style=\"color: red\">Please delete this message after login.</p></p><br><br><h3 align=\"center\">Thank You!! &#x1F60a;</h3>";
                    //sending mail
        if(new MailUtil().sendMail(mail, mail, sub, msg)){
           //System.out.println("Forgotten mail sent successful");
           session.setAttribute("finaly",finaly);
        %>
           <script>
               alert("Code Generated Successfull. Sent to mail. \nCheck your mail and login.");
               window.location="StudentForgottenCodeEnter.jsp";
           </script>
           
        <%
        }
                   else{
                       //System.out.println("Activation mail sent un-successful");%>
                       <script>
                           alert("Code Generated Un-Successfull.Please try again later after sometime.");
                           window.location="index.html";
                       </script>
                       <%
                   }
        }
        else{%>
        <script>
			alert("Error in the DBConnection, Invalied User, or Account already Deactivated");
			window.location="index.html";
        </script>
        <%//System.out.println("Error in DB Connection");
        }
        %>
    </body>
</html>
