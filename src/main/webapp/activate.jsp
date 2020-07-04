

<%@page import="DBConnection.DBConnection"%>
<%@page import="Action.MailUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String htno = request.getParameter("htno");
String email = request.getParameter("email");
try {
			//DataBase Connection
            Connection con = DBConnection.getConnection();            
            PreparedStatement ps = con.prepareStatement("update student set status='Accepted' where htno='"+htno+"' and status='Waiting'");
            //sending mail
            String[] mail=new String[]{email};
            String sub="Account Activation";
            //message
            String msg="<head><meta charset=“UTF-8”></head><p><b>Dear Student,</b> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Your Library Account has been <b style=\"color:green\">'Activated'</b> by the Librarian. Please Login and access your account.</p><br><br><h3 align=\"center\">Thank You!! &#x1F60a;</h3>";
            //sending mail
            if(new MailUtil().sendMail(mail, mail, sub, msg)){
                //updating student
                int i = ps.executeUpdate();
                if(i>0){    
                %>
                <!-- Redirection -->
                  <script>
                      alert("Account Activated.. and mail send Successful");
                      window.location="ViewStudents.jsp";
                  </script>
                    <%  
                }
                else{            
            %>
                  <script>
                      alert("Account Activatation Un-Successful..");
                      window.location="ViewStudents.jsp";
                  </script>
                    <% 
                }
            }else{%>
                    <script>
                      alert("Account Activatation mail sent Un-Successful.. and cant activate the account");
                      window.location="ViewStudents.jsp";
                  </script>
                  <%}
            
        } catch (Exception e) {
            e.printStackTrace();            
        }
%>
