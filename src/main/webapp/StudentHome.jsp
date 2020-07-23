<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

<link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
  <title>Online Student Access Catalogue for Library</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="StudentHome.jsp"><em>Online Student Access Catalogue for Library</em></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="StudentHome.jsp">Home</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="Logout.jsp">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
<header>

    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url(images/slide.png)">          
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url(images/slide1.png)">          
        </div>
       
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>

  </header>
  <!-- Page Content -->
  <div class="container">
      <h4>Welcome Miss./Mr. <%= session.getAttribute("name") %></h4>
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3"></h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="StudentHome.jsp">Home</a>
      </li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="StudentHome.jsp" class="list-group-item">Home</a>
          <a href="StudentProfile.jsp" class="list-group-item">My Profile</a>
          <a href="Logout.jsp" class="list-group-item">Logout</a>
        </div>
      </div>
      <!-- Content Column -->
      <%String htno = (String)session.getAttribute("htno");
      Connection conn = DBConnection.getConnection();
            PreparedStatement ps1 = conn.prepareStatement("SELECT SUM(fine) FROM issue where htno='"+htno+"' AND fine > 0 ");
            ResultSet rs1 = ps1.executeQuery();
            if(rs1.next()){
      %>
                <div class="col-lg-9 mb-4">
        
      <div class="col-lg-12 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Student Transaction Details<span style="float: right"><h6>Total fine is Rs. <b  style="color: red;"><%=rs1.getInt(1)%>.00</b>\- only.</h6></span>
      <%}%>
      </h4>
          <div class="card-body">
              
      <br/>
              <table class="table-bordered table-primary">  
                  <tr>
                      <th>Book ID</th>
                      <th>Book Name</th>
                      <th>Author Name</th>
                      <th>Issued Date</th>
                      <th>Submit Date</th>
                      <th>Submitted Date</th>
                      <th>Status</th>
                      <th>Fine</th>
                  </tr>
              <%
      PreparedStatement ps = conn.prepareStatement("select * from issue where htno='"+htno+"' ORDER BY status asc");
      ResultSet rs = ps.executeQuery();
      while(rs.next()){
           String s =rs.getString("status") ;
              %>
     
      <tr>
                      <td><%= rs.getString("bid")%></td>
                      <td><%= rs.getString("bname")%></td>
                      <td><%= rs.getString("author")%></td>
                      <td><%= rs.getString("issue")%></td>
                      <td><%= rs.getString("submit")%></td>
                      <td><%if(s.equals("issued")){
                          %>Not Submitted<%
                      }else{%><%= rs.getString("submitted")%><%}%></td>
                      <td><%= rs.getString("status")%></td>
                      <td><%= rs.getInt("fine")%></td>
                  </tr>
      <%}
      
      %>
              </table>
           <!--   <%
            PreparedStatement ps3 = conn.prepareStatement("SELECT SUM(fine) FROM issue where htno='"+htno+"' AND fine > 0 ");
            ResultSet rs3 = ps3.executeQuery();
            if(rs3.next()){
      %>
      <br/><h6>Total fine is <b><%=rs1.getInt(1)%></b> Rupees.</h6>
      <%}%>-->
          </div>
        </div>
      </div>
      </div>
   
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  <%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
    String Date = sdf.format(cal.getTime());
    PreparedStatement ps2 = conn.prepareStatement("select * from issue where htno='"+htno+"' AND status='issued'");
    ResultSet rs2 = ps2.executeQuery();
    if(rs2.next()){
        String submit=rs2.getString("submit");
        if(Date.equals(submit)){%>
        <script>
            alert("Dear Student,\n\t\t You have to submit the \"Library Book\".This is the last day for you Submission.");
//            window.location="StudentHome.jsp";
        </script><%
            
        }
    }
  %>

  <!-- Footer -->
  <footer class="py-3 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; <a href="https://github.com/SivaRamiReddyModugula">My Website</a> 2K16-2K20 Batch</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
