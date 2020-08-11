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
        <style type="text/css" media="screen">
  	.loader {
    position: fixed;
    z-index: 99;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: white;
    display: flex;
    justify-content: center;
    align-items: center;
}

.loader > img {
    width: 600px;
}

.loader.hidden {
    animation: fadeOut 1s;
    animation-fill-mode: forwards;
}

@keyframes fadeOut {
    100% {
        opacity: 0;
        visibility: hidden;
    }
}
  </style>
    </head>
    <body>
    <div class="loader">
	<img alt="Sending..." src="gif/sending.gif" />
</div>
    
        <script>
            var sendMail=confirm("Do You want to send the mails to Students?");
            if(sendMail===true){
                window.location="SendMail.jsp";
            }
            else{
                window.location="AdminHome.jsp";
            }
            window.addEventListener("load",function(){
            	const loader=document.querySelector(".loader");
            	loader.className+=" hidden";
            });
        </script>
    </body>
</html>
