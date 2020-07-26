<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
<link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
  <title>Add Book Details</title>

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
      <li class="breadcrumb-item active"><a href="AddBook.jsp">Add Book</a></li>
    </ol>
    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
<!--      <div class="col-lg-3 mb-4">
        <div class="list-group">
          <a href="AdminHome.jsp" class="list-group-item">Home</a>
          <a href="ViewStudents.jsp" class="list-group-item">Add Students</a>
          <a href="ViewFaculty.jsp" class="list-group-item">Add Faculty</a>
          <a href="AddBook.jsp" class="list-group-item">Add Book</a>
          <a href="RemoveBook.jsp" class="list-group-item">Remove Book</a>
          <a href="Logout.jsp" class="list-group-item">Logout</a>
        </div>
      </div>-->
      <!-- Content Column -->
      <div class="col-lg-9 mb-10">
        
        
       <div class="col-lg-9 mb-10">
        <div class="card h-100">
          <h4 class="card-header">Add Book</h4>
          <div class="card-body">
            
              <form action="AddBookDB.jsp" method="post" id="contactForm" novalidate>
                  <div class="control-group form-group">
            <div class="controls">
              <label>Book Id:</label>
              <input type="text" class="form-control" name="bid" id="name" required="required" data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>Call Number:</label>
              <input type="text" class="form-control" name="callno" id="name" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>Book Name:</label>
              <input type="text" class="form-control" name="bname" id="name" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>Author:</label>
              <input type="text" name="author" class="form-control" id="phone" required data-validation-required-message="Please enter Author Name.">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>Publication:</label>
              <input type="text" name="publication" class="form-control" id="phone" required data-validation-required-message="Please enter Author Name.">
            </div>
          </div>
                  <div class="control-group form-group">
            <div class="controls">
              <label>Year of Publication:</label>
              <input type="text" class="form-control" name="yearofpublication" id="name" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
                  <div class="control-group form-group">
            <div class="controls">
              <label>Vendor or Donor:</label>
              <input type="text" class="form-control" name="vendorordoner" id="name" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>Invoice Number and Date:</label>
              <input type="text" class="form-control" name="invoiceno" id="name" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>Pages:</label>
              <input type="text" class="form-control" name="pages" id="name" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
                  <div class="control-group form-group">
            <div class="controls">
              <label>Edition:</label>
              <input type="text" class="form-control" name="edition" id="name" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
                  <div class="control-group form-group">
            <div class="controls">
              <label>price:</label>
              <input type="text" class="form-control" name="price" id="name" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>Course:</label>
              <input type="text" name="course" class="form-control" id="phone" required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>Branch:</label>
              <input type="text" name="branch" class="form-control" id="phone" required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>
<!--          <div class="control-group form-group">
            <div class="controls">
              <label>Year:</label>
              <input type="text" name="year" class="form-control" id="phone" required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>
          <div class="control-group form-group">
            <div class="controls">
              <label>Semester:</label>
              <input type="text" name="sem" class="form-control" id="phone" required data-validation-required-message="Please enter your phone number.">
            </div>
          </div>-->
<br>
            
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton">Add Book</button>
        </form>
              
              
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
