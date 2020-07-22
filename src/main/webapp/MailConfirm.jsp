<%-- 
    Document   : MailConfirm
    Created on : Feb 15, 2020, 9:28:19 PM
    Author     : Siva Rami Reddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
        <title>Confirm to send mail</title>
    </head>
    <body>
        <script>
            var sendMail=confirm("Do You want to send the mails to Students?");
            if(sendMail===true){
                window.location="SendMail.jsp";
            }
            else{
                window.location="AdminHome.jsp";
            }
        </script>
    </body>
</html>
