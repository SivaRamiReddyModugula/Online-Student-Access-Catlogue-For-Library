<!DOCTYPE html>
<html lang="en">

<head>
    <script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
        
       
          
    </script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Online Student Access Catalogue for Library</title>
  <link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">
 
</head>

<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">

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
      <form action="SearchBook.jsp" method="post">
    <div class="card mb-4">
          <h5 class="card-header">Search for Book Availability</h5>
          <div class="card-body">
            <div class="input-group">
                <input type="text" name="bookname" class="form-control" placeholder="Enter Book Name or Author Name (Capital Letters)">
              <span class="input-group-btn">
                  &emsp;<button class="btn btn-success" type="submit">Search</button>
              </span>
            </div>
          </div>
        </div>
      </form>

    <!-- Marketing Icons Section -->
    <div class="row">
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Administrator</h4>
          <div class="card-body">
            
              <form action="LoginCheck.jsp" method="post" id="contactForm" novalidate>
          <div class="control-group form-group">
            <div class="controls">
              <label>User Name:</label>
              <input type="text" class="form-control" name="uname" id="name" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>Password:</label>
              <input type="password" name="pass" class="form-control" id="phone" required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>
                  <input type="hidden" value="1" name="status"/>
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton">Login</button>          
        </form>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Faculty</h4>
          <div class="card-body">
            <form action="LoginCheck.jsp" method="post" id="contactForm" novalidate>
          <div class="control-group form-group">
            <div class="controls">
              <label>FID:</label>
              <input type="email" class="form-control" name="uname" id="name" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>Password:</label>
              <input type="password" name="pass" class="form-control" id="phone" required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>
                  <input type="hidden" value="3" name="status"/>
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton">Login</button>          
        </form>
              <p>New Faculty ? <a href="FacultyRegistration.jsp">Click Here!</a> to Register.</p>
          </div>
          
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Student</h4>
          <div class="card-body">
            <form action="LoginCheck.jsp" method="post" id="contactForm" novalidate>
          <div class="control-group form-group">
            <div class="controls">
              <label>Roll Number:</label>
              <input type="text" class="form-control" name="uname" id="name" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>Password:</label>
              <input type="password" name="pass" class="form-control" id="paswd" required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>
                  <input type="hidden" value="2" name="status"/>
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton">Login</button>          
        </form>
              <p>New Student ? <a href="StudentRegistration.jsp">Click Here!</a> to Register.</p>
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
