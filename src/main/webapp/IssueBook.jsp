<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String htno = request.getParameter("htno");
    String bid = request.getParameter("bid");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
    Calendar cal = Calendar.getInstance();
    String oldDate = sdf.format(cal.getTime());
    cal.add(Calendar.DAY_OF_MONTH, 14);
    String newDate = sdf.format(cal.getTime());
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("select * from student where htno='"+htno+"'");
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
        PreparedStatement ps1 = conn.prepareStatement("select * from issue where bid='"+bid+"' AND status='issued'");
        ResultSet rs1 = ps1.executeQuery();
        PreparedStatement ps6 = conn.prepareStatement("select * from factissue where bid='"+bid+"' AND status='issued'");
        ResultSet rs6 = ps6.executeQuery();
        if(rs1.next()||rs6.next()){
                %><h1>Book Already Issued</h1><%
        }else{
            PreparedStatement ps2 = conn.prepareStatement("select * from books where bid='"+bid+"'");
            ResultSet rs2 = ps2.executeQuery();
            if(rs2.next()){
                String bname = rs2.getString("bname");
                String author = rs2.getString("author");
                String sname = rs.getString("sname");
                PreparedStatement ps4 = conn.prepareStatement("select * from book where bname='"+bname+"' AND author='"+author+"'");
                ResultSet rs3 = ps4.executeQuery();
                if(rs3.next()){
                    int available = rs3.getInt("available");                    
                    int issue = rs3.getInt("issue");
                    

                PreparedStatement ps3 = conn.prepareStatement("insert into issue(bid, bname, author, htno, sname, issue, submit)values(?,?,?,?,?,?,?)");
                ps3.setString(1, bid);
                ps3.setString(2, bname);
                ps3.setString(3, author);
                ps3.setString(4, htno);
                ps3.setString(5, sname);
                ps3.setString(6, oldDate);
                ps3.setString(7, newDate);
                int i = ps3.executeUpdate();
                
                if(i>0){
                    issue++;
                    available--;
                    PreparedStatement ps5 = conn.prepareStatement("update book set available='"+available+"',issue='"+issue+"' where bname='"+bname+"' AND author='"+author+"'");
                    ps5.executeUpdate();
                %><script>
                    alert("Book Issued succesfull..");
                    window.location="AdminHome.jsp";
                    </script> <%

                }else{
                    out.println("ERROR");
                }
            }
        }else{%><script>
                    alert("Please Valid BookId");
                    window.location="AdminHome.jsp";
                    </script> <% }          
    }
}


%>