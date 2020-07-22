
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Action.MailUtil"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
        <title>sending mails</title>
    </head>
    <body>
          <%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
    String Date = sdf.format(cal.getTime());
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps2 = conn.prepareStatement("select * from issue where status='issued'");
    ResultSet rs2 = ps2.executeQuery();
    while(rs2.next()){
        
        String htno=rs2.getString("htno");
        PreparedStatement ps3 = conn.prepareStatement("select * from student where htno='"+htno+"'");
    ResultSet rs3 = ps3.executeQuery();
        if(rs3.next()){
            String sname=rs3.getString("sname");
          String email=rs3.getString("email");  
        String submit=rs2.getString("submit");
        String issue=rs2.getString("issue");
        if(Date.equals(submit)){
            
            String bname=rs2.getString("bname");
            String[] mail=new String[]{email};
            String sub="Library Book Return..";
            String msg="<head><meta charset=“UTF-8”></head><p><b>Dear "+sname+",</b> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; You need to submit <b>\"<i>"+bname+"</i>\"</b> book. Issued on <b>\"<i>"+issue+"</i>\"</b>. Submit the book Fast with-in time...</p><br><br><h3 align=\"center\">Thank You!! &#x1F60a;</h3>";
            System.out.println("Sending mail to \""+email+"\". You need to submit \""+bname+"\". Issued on \""+issue+"\".");
            new MailUtil().sendMail(mail,mail,sub,msg);
            System.out.println("sent successful");
        }  
        }
    }
  %>
  <script>
      alert("Mails Sent Successefull");
      window.location="AdminHome.jsp";
  </script>
  
    </body>
</html>
