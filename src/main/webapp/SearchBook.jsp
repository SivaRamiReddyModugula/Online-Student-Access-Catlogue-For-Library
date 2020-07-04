<%@page import="DBConnection.DBConnection"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

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
                <input type="text" class="form-control" name="bookname" placeholder="Enter Book Name or Author Name(Capital Letters)">
              <span class="input-group-btn">
                  &emsp;<button class="btn btn-success" type="submit">Search</button>
              </span>
            </div>
          </div>
        </div>
      </form>
    <!-- Marketing Icons Section -->
    <div class="card mb-4">
          <h5 class="card-header">Search Result</h5>
          
          <div class="card-body">
            <div class="input-group">
                <table class="table-bordered table-secondary">
                    <tr>
                        <th>Book Name</th>
                        <th>Author Name</th>
                        <th>Publication</th>
                        <th>No of Books</th>
                        <th>Issued</th>
                        <th>Available</th>
                    </tr>
                <%
              String bookname = request.getParameter("bookname");
              Connection conn = DBConnection.getConnection();
              PreparedStatement ps = conn.prepareStatement("select * from book where bname Like'%"+bookname+"%' or author Like'%"+bookname+"%'  ");
              ResultSet rs = ps.executeQuery();
              while(rs.next()){%>
              <tr>
                  <td><%= rs.getString("bname") %></td>
                  <td><%= rs.getString("author") %></td>
                  <td><%= rs.getString("publication") %></td>
                  <td><%= rs.getString("count") %></td>
                  <td><%= rs.getString("issue") %></td>
                  <td><%= rs.getString("available") %></td>
              </tr>
              <%}%></table>
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
