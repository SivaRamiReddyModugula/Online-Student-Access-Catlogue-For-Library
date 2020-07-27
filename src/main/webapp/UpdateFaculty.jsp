<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<script src="https://kit.fontawesome.com/3d79e937ce.js" crossorigin="anonymous"></script>
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
      <a class="navbar-brand" href="FacultyHome.jsp"><em>Online Student Access Catalogue for Library</em></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
              <a class="nav-link" href="FacultyHome.jsp">Home</a>
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
          <a href="FacultyHome.jsp">Home</a>
      </li>
      <li class="breadcrumb-item active">
          <a href="FacultyProfile.jsp">My Profile</a>
      </li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
            <a href="FacultyHome.jsp" class="list-group-item">Home</a>
            <a href="FacultyProfile.jsp" class="list-group-item">My Profile</a>
          <a href="Logout.jsp" class="list-group-item">Logout</a>
        </div>
      </div>
      <!-- Content Column -->
                <div class="col-lg-9 mb-4">
        
      <div class="col-lg-12 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Faculty Details</h4>
          <div class="card-body">
              <table class="table-bordered table-primary"> 
                  <form action="FactUpdateInDB.jsp" method="post">
              <%
          String fid = (String)session.getAttribute("fid");
      Connection conn = DBConnection.getConnection();
      PreparedStatement ps = conn.prepareStatement("select * from faculty where fid='"+fid+"'");
      ResultSet rs = ps.executeQuery();
      if(rs.next()){
              session.setAttribute("fid",fid);
              %>
      <tr><td rowspan="8"><img  src="view1.jsp?fid=<%=rs.getString("fid")%>" width="200" height="200" /></td></tr>
      <tr><th>Roll Number</th><td><%= rs.getString("fid")%></td></tr>
      <tr><th>Name</th><td><%= rs.getString("fname")%></td></tr>
      <tr><th>Email</th><td><input type="text" required="required" class="form-control" name="email" value="<%= rs.getString("email")%>"/></td></tr>
      <tr><th>Password</th>
      <td>
      <div class="input-group">
      <input type="password" required="required" class="form-control" name="pswd" value="<%=rs.getString("pswd")%>" id="facultyPswd">
      <div class="input-group-prepend">
              	<div class="input-group-text">
              		<a href="#" class="text-dark" id="faculty-icon-click">
              		<i class="fas fa-eye" id="faculty-icon"></i>
              		</a>
              	</div>
              </div>
      </div>
      </td></tr>
      <tr><th>Mobile Number</th><td><input type="text" required="required" class="form-control" name="mno" value="<%=rs.getString("mno")%>"></td></tr>
      <tr><th>Branch</th><td><%= rs.getString("dept")%></td></tr>
      <tr><th>Course</th><td><%= rs.getString("course")%></td></tr>
      <tr><td colspan="3" align="center"><span class="input-group-btn">
                  &emsp;<button class="btn btn-success" type="submit">Update</button>
              </span></td></tr>
      <%}%>
                  </form>
              </table>
              
          </div>
        </div>
      </div>
      </div>
   
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-3 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; My  <a href="https://github.com/SivaRamiReddyModugula">GitHub</a> 2K16-2K20 Batch</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
//Faculty icon JQuary.
  $(document).ready(function(){
  	$("#faculty-icon-click").click(function() {
  		$("#faculty-icon").toggleClass('fa-eye-slash');
  		var x = document.getElementById("facultyPswd");
  		  if (x.type === "password") {
  		    x.type = "text";
  		  } else {
  		    x.type = "password";
  		  }
  	});
  });
  </script>

</body>

</html>
