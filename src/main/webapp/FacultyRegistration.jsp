<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<html lang="en">

<head>
<script src="https://kit.fontawesome.com/3d79e937ce.js" crossorigin="anonymous"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
  <title>Online Student Access Catalogue for Library</title>
  <!-- FontAwesome Core CSS -->
  <link href="vendor/fontawesome/css/all.css" rel="stylesheet">

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html"><em>Online Student Access Catalogue for Library</em></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="index.html">Home</a>
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

    <h1 class="my-4"></h1>

    <!-- Marketing Icons Section -->
    <div class="row">
      <div class="col-7 offset-3 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Faculty Registration</h4>
          <div class="card-body">
            
        <form action="FacultyRegistration" method="post" enctype="multipart/form-data" id="contactForm" >
          <div class="control-group form-group">
            <div class="controls">
            <p><input type="text" name="fid" class="form-control" placeholder="Enter Your Faculty Id" required="required"></p>
            <p><input type="text" name="fname" class="form-control" placeholder="Enter Your Full Name" required="required"></p>
            <p><input type="email" name="email"  class="form-control" placeholder="Enter Your Email Address" required="required"></p>
            <p>
            <div class="input-group">
            	<input type="password" name="pswd" class="form-control" placeholder="Enter Your Password" required="required" id="facultyPswd">
            	<div class="input-group-prepend">
              	<div class="input-group-text">
              		<a href="#" class="text-dark" id="faculty-icon-click">
              		<i class="fas fa-eye" id="faculty-icon"></i>
              		</a>
              	</div>
              </div>
            </div>
            </p>
            <p><input type="text" name="mno" class="form-control" placeholder="Enter Your Mobile Number" required="required"></p>
            <p><select class="form-control" name="dept" required="required">
            	<option value="-1">--Select Department--</option>
            	<%
            	Connection conn=DBConnection.getConnection();
            	PreparedStatement ps=conn.prepareStatement("select * from branch");
            	ResultSet rs=ps.executeQuery();
            	while(rs.next()){%>
            		<option value="<%=rs.getString("branch")%>"><%=rs.getString("branch") %></option>
            	<%}
            	%>
            </select></p>
            <p><select class="form-control" name="course" required="required">
            	<option value="-1">--Select Qualification--</option>
            	<%
            		PreparedStatement ps1=conn.prepareStatement("select * from course");
            		ResultSet rs1=ps1.executeQuery();
            		while(rs1.next()){%>
            			<option value="<%=rs1.getString("course")%>"><%=rs1.getString("course") %></option>
            		<%}
            	%>
            </select></p>
            <!-- <p><input type="text" name="dept" class="form-control" placeholder="Enter Your Department" required="required"></p>
            <p><input type="text" name="course" class="form-control" placeholder="Enter Your Qualification" required="required"></p> -->
            <p><label class="form-check-label" style="color: blue">"Upload your passport-size photo below. It's mandatory. You can't change-it later.</label></p>
            <p><input type='file' name='file' placeholder='Select Profile Pic' onchange="onFileSelected(event)" required="required"></p>
            <img id="myimage" height="200" width="200">
            </div>
          </div>
          
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton">Register</button>          
        </form>
              <p>Already Registered ? <a href="index.html">Click Here!</a> to Login.</p>
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
        <p class="m-0 text-center text-white">Copyright &copy; My  <a href="https://github.com/SivaRamiReddyModugula" target="_blank">GitHub</a> 2K16-2K20 Batch</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
            function onFileSelected(event) {
  var selectedFile = event.target.files[0];
  var reader = new FileReader();

  var imgtag = document.getElementById("myimage");
  imgtag.title = selectedFile.name;

  reader.onload = function(event) {
    imgtag.src = event.target.result;
  };

  reader.readAsDataURL(selectedFile);
}

</script>
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
