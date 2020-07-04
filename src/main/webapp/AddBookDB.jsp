<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
// Getting Paramenters.
String bid = request.getParameter("bid");
String callno = request.getParameter("callno");
String bname = request.getParameter("bname");
String author = request.getParameter("author");
String publication = request.getParameter("publication");
String yearofpublication = request.getParameter("yearofpublication");
String vendorordoner = request.getParameter("vendorordoner");
String invoiceno = request.getParameter("invoiceno");
String pages = request.getParameter("pages");
String edition = request.getParameter("edition");
String price = request.getParameter("price");
String course = request.getParameter("course");
String branch = request.getParameter("branch");
//String year = request.getParameter("year");
//String sem = request.getParameter("sem");

// Database Connection
Connection conn = DBConnection.getConnection();

// inserting into books database.
PreparedStatement ps = conn.prepareStatement("insert into books(bid,callno, bname, author, publication,yearofpublication,vendorordoner,invoiceno,pages,edition,price, course, branch)values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
ps.setString(1, bid);
ps.setString(2, callno);
ps.setString(3, bname);
ps.setString(4, author);
ps.setString(5,publication);
ps.setString(6, yearofpublication);
ps.setString(7, vendorordoner);
ps.setString(8, invoiceno);
ps.setString(9, pages);
ps.setString(10, edition);
ps.setString(11, price);
ps.setString(12, course);
ps.setString(13, branch);
//ps.setString(6, year);
//ps.setString(7, sem);

int i = ps.executeUpdate();
PreparedStatement ps1 = conn.prepareStatement("select * from book where bname='"+bname+"' and publication='"+publication+"' and author='"+author+"'");
ResultSet rs = ps1.executeQuery();
if(rs.next()){
	// Updating count of books
int  sno = rs.getInt("sno");
int count = rs.getInt("count");
count++;
int available = rs.getInt("available");
available++;
// Update in Database if count increases.
PreparedStatement ps2 = conn.prepareStatement("update book set count='"+count+"',available='"+available+"' where sno='"+sno+"'");
ps2.executeUpdate();
}else{
	//insert into book database.
 PreparedStatement ps3 = conn.prepareStatement("insert into book( bname, author, publication)values('"+bname+"','"+author+"','"+publication+"')");
 ps3.executeUpdate();
}
if(i>0){
%>
<!-- Redirection -->
<script>
    alert("Book Added Successful");
    window.location="AddBook.jsp";
</script><%
}else{
%><script>
    alert("Book Adding Failed");
    window.location="AddBook.jsp";
</script><%
}
%>