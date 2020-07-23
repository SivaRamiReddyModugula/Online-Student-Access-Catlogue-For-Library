<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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
            <a class="nav-link" href="about.html">Accept Students</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="services.html">Accept Faculty</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">Add Book</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.html">Remove Book</a>
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

    <!-- Page Heading/Bread crumbs -->
    <h1 class="mt-4 mb-3"></h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="AdminHome.jsp">Home</a>
        <li class="breadcrumb-item active"><a href="BookIssue.jsp">Book Issue</a></li>
      
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="AdminHome.jsp" class="list-group-item">Home</a>
          <a href="ViewStudents.jsp" class="list-group-item">Add Students</a>
          <a href="ViewFaculty.jsp" class="list-group-item">Add Faculty</a>
          <a href="PayFine.jsp" class="list-group-item">Pay Fine</a>
          <!-- <a href="MailConfirm.jsp" class="list-group-item">Send Mails to Students</a>  -->
          <a href="AddBook.jsp" class="list-group-item">Add Book</a>
          <a href="RemoveBook.jsp" class="list-group-item">Remove Book</a>
          <a href="Deactivate.jsp" class="list-group-item">Deactivate</a>
          <a href="Logout.jsp" class="list-group-item">Logout</a>
        </div>
      </div>
      <!-- Content Column -->
       <div class="col-lg-9 mb-4">
        
      <div class="col-lg-9 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Student Book Issue Details</h4>
          <div class="card-body">
              <%
              // Getting Hallticket number.
              String htno = request.getParameter("htno");
              
              // DB Connection.
              Connection conn = DBConnection.getConnection();
              
              // Getting Details from students.
              PreparedStatement ps1 = conn.prepareStatement("select * from student where htno='"+htno+"' AND status='Accepted'");
              ResultSet rs1 = ps1.executeQuery();
              if(rs1.next()){
            	  
            	  // Getting number of books issued
              PreparedStatement ps = conn.prepareStatement("select count(*) from issue where htno='"+htno+"' and status='issued'");
              ResultSet rs = ps.executeQuery();
              if(rs.next()){
                int count = rs.getInt(1);
                
                // count must be <3.
                if(count<3){
                    %>
                    <!-- If valid issue. -->
                    <form action="IssueBook.jsp" method="post">
          <div class="control-group form-group">
            <div class="controls">
              <label>Book Id:</label>
              <input type="text" name="bid" class="form-control" id="name" required data-validation-required-message="Please enter your name.">
              <input type="hidden" name="htno" value="<%= htno %>"/>
              <p class="help-block"></p>
            </div>
          </div>
          
          
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton">Issue</button>
        </form>
        
        <!-- Show fine for admin. -->
              <%
            PreparedStatement ps2 = conn.prepareStatement("SELECT SUM(fine) FROM issue where htno='"+htno+"' AND fine > 0 ");
            ResultSet rs2 = ps2.executeQuery();
            if(rs2.next()){
      %>
      <br/><h6 align="center">Total fine is Rs. <b  style="color: red"><%=rs2.getInt(1)%>.00</b>\- only.</h6>
      <%}%>
              <%
                    
                }else{
%><h1>  Your Limit is reached </h1><%
                    
                }
                  
              }else{
                  %>
              <form action="IssueBook.jsp" method="post">
          <div class="control-group form-group">
            <div class="controls">
              <label>Book Id:</label>
              <input type="text" name="bid" class="form-control" id="name" required data-validation-required-message="Please enter your name.">
              <input type="hidden" name="htno" value="<%= htno %>"/>
              <p class="help-block"></p>
            </div>
          </div>
          
          
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton">Submit</button>
        </form>
              <%
              }
              }else{%><script>
    alert("Enter Valid Roll Number");
    window.location="AdminHome.jsp";
</script> <%
}
          
              %>    
             
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
        <p class="m-0 text-center text-white">Copyright &copy; <a href="https://github.com/SivaRamiReddyModugula">My Website</a> 2K16-2K20 Batch</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
