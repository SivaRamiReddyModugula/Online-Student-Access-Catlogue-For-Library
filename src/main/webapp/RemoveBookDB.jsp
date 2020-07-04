<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
String bid = request.getParameter("bid");
Connection conn = DBConnection.getConnection();
PreparedStatement ps4 = conn.prepareStatement("select * from books where bid='"+bid+"'");
ResultSet rs1 = ps4.executeQuery();
if(rs1.next()){
String bname = rs1.getString("bname");

PreparedStatement ps1 = conn.prepareStatement("select * from book where bname='"+bname+"'");
ResultSet rs = ps1.executeQuery();
if(rs.next()){
int  sno = rs.getInt("sno");
int count = rs.getInt("count");
count--;
int available = rs.getInt("available");
available--;
PreparedStatement ps2 = conn.prepareStatement("update book set count='"+count+"',available='"+available+"' where sno='"+sno+"'");
ps2.executeUpdate();
}
PreparedStatement ps = conn.prepareStatement("delete from books where bid='"+bid+"'");
int i = ps.executeUpdate();
if(i>0){
%><script>
    alert("Book Removed Successful");
    window.location="RemoveBook.jsp";
</script><%
}else{
%><script>
    alert("Book Removing Failed");
    window.location="RemoveBook.jsp";
</script><%
}}

%>