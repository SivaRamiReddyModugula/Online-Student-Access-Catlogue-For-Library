<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
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
      <a class="navbar-brand" href="AdminHome.jsp"><em>Online Student Access Catalogue for Library</em></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="AdminHome.jsp">Home</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="GenerateReports.jsp">Generate Report</a>
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

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3"></h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="AdminHome.jsp">Home</a></li>
      <li class="breadcrumb-item active"><a href="ShowFaculty.jsp">Show Faculty</a></li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
<!--      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="AdminHome.jsp" class="list-group-item">Home</a>
          <a href="ViewStudents.jsp" class="list-group-item">Add Students</a>
          <a href="ViewFaculty.jsp" class="list-group-item">Add Faculty</a>
          <a href="PayFine.jsp" class="list-group-item">Pay Fine</a>
          <a href="MailConfirm.jsp" class="list-group-item">Send Mails to Students</a>
          <a href="AddBook.jsp" class="list-group-item">Add Book</a>
          <a href="RemoveBook.jsp" class="list-group-item">Remove Book</a>
          <a href="Logout.jsp" class="list-group-item">Logout</a>
        </div>
      </div>-->
      <!-- Content Column -->
      <%Connection conn =DBConnection.getConnection();
      PreparedStatement ps1 = conn.prepareStatement("select count(*) from faculty where status='Accepted'");
      ResultSet rs1 = ps1.executeQuery(); %>
      <div class="col-lg-12 mb-4">
        
      <div class="col-lg-auto mb-4">
        <div class="card h-100">
          <h4 class="card-header">Faculty Details
          <span style="float: right;">
          <%if(rs1.next()){
                  %>
              <h6>Total Registered Faculty: <b  style="color: red"><%=rs1.getInt(1)%></b>.</h6>
              
              <%
              }
              %>
          </span>
          </h4>
          <div class="card-body">
              
              <table align="center" class="table-bordered table-primary">
                  <tr>
                      <th>Roll Number</th>
                      <th>Photo</th>
                      <th>Name</th>
                      <th>Mobile Number</th>
                      <th>Email</th>
                      <th>Department</th>                     
                      <th>Qualification</th>
                      
                  </tr>
                  <%
                  
                  PreparedStatement ps = conn.prepareStatement("select * from faculty where status='Accepted'");
                  ResultSet rs = ps.executeQuery();
                  while(rs.next()){
                  %>
                  
                  <tr>
                      <td><%= rs.getString("fid")%></td>
                      <td><img  src="view.jsp?htno=<%=rs.getString("fid")%>" width="75" height="75" /></td>
                      <td><%= rs.getString("fname")%></td>
                      <td><%= rs.getString("mno")%></td>
                      <td><%= rs.getString("email")%></td>
                      <td><%= rs.getString("dept")%></td>
                      <td><%= rs.getString("course")%></td>
                      
                  </tr>
                  <%}%>
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

</body>

</html>
