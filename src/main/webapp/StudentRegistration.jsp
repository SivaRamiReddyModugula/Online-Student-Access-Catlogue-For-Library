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
      <div class="col-7 offset-2 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Student Registration</h4>
          <div class="card-body">
         <!--            <form>
  <div class="row">
    <div class="col">
      <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    <div class="col">
      <input type="password" class="form-control" placeholder="Enter password" name="pswd">
    </div>
      <div class="col">
      <input type="password" class="form-control" placeholder="Enter password" name="pswd">
    </div>
  </div>
                <br/>
                  <div class="row">
    <div class="col">
      <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    <div class="col">
      <input type="password" class="form-control" placeholder="Enter password" name="pswd">
    </div>
      <div class="col">
      <input type="password" class="form-control" placeholder="Enter password" name="pswd">
    </div>
  </div>
</form>-->   
        <form action="StudentRegistration" method="post" enctype="multipart/form-data" id="contactForm" >
          <div class="control-group form-group">
            <div class="controls">
            <p><input type="text" name="htno" class="form-control" placeholder="Enter Your Roll Number" required="required" ></p>
            <p><input type="text" name="sname" class="form-control" placeholder="Enter Your Full Name" required="required"></p>
            <p><input type="email" name="semail"  class="form-control" placeholder="Enter Your Email Address" required="required"></p>
            <p>
            <div class="input-group">
            <input type="password" name="pswd" class="form-control" placeholder="Enter Your Password" required="required" id="studentPswd">
            <div class="input-group-prepend">
              	<div class="input-group-text">
              		<a href="#" class="text-dark" id="student-icon-click">
              		<i class="fas fa-eye" id="student-icon"></i>
              		</a>
              	</div>
              </div>
            </div>
            </p>
            <p><input type="text" name="mno" class="form-control" placeholder="Enter Your Mobile Number" required="required"></p>
            <p><input type="text" name="branch" class="form-control" placeholder="Enter Your Branch" required="required"></p>
            <p><input type="text" name="course" class="form-control" placeholder="Enter Your Course" required="required"></p>
            <p><label class="form-check-label" style="color: blue">"Upload your passport-size photo below. It's mandatory. You can't change-it later.</label></p>
            <p><input type='file' name='file' placeholder="Select Profile Picture." onchange="onFileSelected(event)" required="required"></p>
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
        <p class="m-0 text-center text-white">Copyright &copy; My  <a href="https://github.com/SivaRamiReddyModugula">GitHub</a> 2K16-2K20 Batch</p>
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
//Student icon JQuary.
$(document).ready(function(){
	$("#student-icon-click").click(function() {
		$("#student-icon").toggleClass('fa-eye-slash');
		var x = document.getElementById("studentPswd");
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
