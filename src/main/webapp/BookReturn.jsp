<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String bid = request.getParameter("bid");
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("select * from issue where bid='"+bid+"' AND status='issued'");
        ResultSet rs = ps.executeQuery();
        if(rs.next()){ 
                String bname = rs.getString("bname");
                String author = rs.getString("author");
                PreparedStatement ps4 = conn.prepareStatement("select * from book where bname='"+bname+"' AND author='"+author+"'");
                ResultSet rs3 = ps4.executeQuery();
                if(rs3.next()){
                    int available = rs3.getInt("available");                    
                    int issue = rs3.getInt("issue");
                    available++;
                    issue--;
                    PreparedStatement ps5 = conn.prepareStatement("update book set available='"+available+"',issue='"+issue+"' where bname='"+bname+"' AND author='"+author+"'");
                    int i = ps5.executeUpdate();
                    PreparedStatement ps2 = conn.prepareStatement("update issue set status='submitted' where bid='"+bid+"' AND status='issued'");
                    int j = ps2.executeUpdate();
                    if(i>0&&j>0){
                        %><script>
                    alert("Book Return Successfull");
                    window.location="AdminHome.jsp";
                    </script> <%
                        
                    }
        }
    }else{
            %><script>
                    alert("Please Valid BookId");
                    window.location="AdminHome.jsp";
                    </script> <%
        }

%>