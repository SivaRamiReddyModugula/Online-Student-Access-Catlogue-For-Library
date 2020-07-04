
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String uname = request.getParameter("uname");
String pass = request.getParameter("pass");
int status = Integer.parseInt(request.getParameter("status"));
if(status==1){
if(uname.equalsIgnoreCase("admin")&&pass.equalsIgnoreCase("admin")){
session.setAttribute("uname", uname);
%>
<script>
//  alert("Admin Login successfull....");
//  window.location="AdminHome.jsp";
    window.location="GenerateAdminCode.jsp";
</script>
<%
    }else{
 %>
<script>
    alert("Invalid Username/Password...");
    window.location="index.html";
</script>
<%}
}else if(status==2){
         Connection conn = DBConnection.getConnection();
         Statement st = conn.createStatement();
         ResultSet rs = st.executeQuery("select * from student where htno='"+uname+"' AND pswd='"+pass+"'");
         if(rs.next())
         {
            
            String status1 = rs.getString("status");
            if(status1.equals("Accepted")){
            String htno = rs.getString("htno");
            String email = rs.getString("email");
            String sname = rs.getString("sname");
            session.setAttribute("name", sname);            
            session.setAttribute("htno", htno);
            session.setAttribute("email", email);
            
             %>
                <script>
                    alert("Student Login successfull..");
                    window.location="StudentHome.jsp";
                </script>
        <%
            } else {
                 %>
                <script>
                    alert("Library Card Not Generated..");
                    window.location="index.html";
                </script>
        <%
 }
} else {
                 %>
                <script>
                    alert("Invalid Username/Password");
                    window.location="index.html";
                </script>
        <%
 }

}else if(status==3){
         Connection conn = DBConnection.getConnection();
         Statement st = conn.createStatement();
         ResultSet rs = st.executeQuery("select * from faculty where fid='"+uname+"' AND pswd='"+pass+"'");
         if(rs.next())
         {
            String status1 = rs.getString("status");
            if(status1.equals("Accepted")){            
            String email = rs.getString("email");
            String fname = rs.getString("fname");
            session.setAttribute("name", fname); 
            session.setAttribute("fid", uname); 
            session.setAttribute("email", email);
             %>
                <script>
                    alert("Faculty Login successfull..");
                    window.location="FacultyHome.jsp";
                </script>
        <%
            } else {
                 %>
                <script>
                    alert("Library Card Not Generated..");
                    window.location="index.html";
                </script>
        <%
 }
} else {
                 %>
                <script>
                    alert("Invalid Username/Password");
                    window.location="index.html";
                </script>
        <%
 }

}else{
 %>
<script>
    alert("Invalid Username/Password...");
    window.location="index.html";
</script>
<%}
%>