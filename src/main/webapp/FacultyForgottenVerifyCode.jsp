<%-- 
    Document   : VerifyCode
    Created on : 10 Apr, 2020, 11:16:47 AM
    Author     : Siva Rami Reddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Student Access Catalogue for Library</title>
        <link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
    </head>
    <body>
        <%
            String finaly=(String)session.getAttribute("finaly");
            String code=request.getParameter("code");
            String fid=(String)session.getAttribute("fid");
            session.setAttribute("fid", fid);
            if(finaly.equals(code)){
                %>
                <script>
                    alert("Verification Successful");
                    window.location="UpdateFacultyPass.jsp";
                </script>
            <%
            }else{
            %>
            <script>
                alert("Verification Un-Successful");
                window.location="index.html";
            </script>
                <%
}
        %>
    </body>
</html>
