<%-- 
    Document   : GenerateAdminCode
    Created on : 10 Apr, 2020, 10:40:18 AM
    Author     : Siva Rami Reddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@page import="Action.MailUtil"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
        <title>Generate Admin Code</title>
    </head>
    <body>
        <%
        int length=6;
        String letters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        String numbers="1234567890";
        String email="sivaramireddy9553@gmail.com";
        
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
        String sub="Login Code";
        String msg="<head><meta charset=“UTF-8”></head><p><b>Dear Admin,</b> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Your activation code is <b style=\"color: green\">'"+finaly+"'</b>. Please Login and access your account. <br><p style=\"color: red\">Please delete this message after login.</p></p><br><br><h3 align=\"center\">Thank You!! &#x1F60a;</h3>";
                    //sending mail
        if(new MailUtil().sendMail(mail, mail, sub, msg)){
           System.out.println("Activation mail sent successful");
           session.setAttribute("finaly",finaly);
        %>
           <script>
               alert("Code Generated Successfull. Sent to mail. \nCheck your mail and login.");
               window.location="CodeEnter.jsp";
           </script>
           
        <%
        }
                   else{
                       System.out.println("Activation mail sent un-successful");%>
                       <script>
                           alert("Code Generated Un-Successfull.Please try again later after sometime.");
                           window.location="index.html";
                       </script>
                       <%
                   }
        %>
    </body>
</html>
