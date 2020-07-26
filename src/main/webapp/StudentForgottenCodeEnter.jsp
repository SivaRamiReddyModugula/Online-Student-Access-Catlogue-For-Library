<%-- 
    Document   : CodeEnter
    Created on : 10 Apr, 2020, 10:59:49 AM
    Author     : Siva Rami Reddy
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConnection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

<link rel="shortcut icon" type="image/x-icon" href="images/logo.ico" >
  <title>Student Forgotten Code Verification</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>
    <%@include file="fine.jsp" %>
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
  <%
          String finaly=(String)session.getAttribute("finaly");
          session.setAttribute("finaly",finaly);
          String htno=(String)session.getAttribute("htno");
          session.setAttribute("htno", htno);
          Connection connection=DBConnection.getConnection();
          PreparedStatement ps1=conn.prepareStatement("select * from student where htno='"+htno+"'");
          ResultSet rs1=ps1.executeQuery();
          String sname="";
          String email="";
          if(rs1.next()){
        	  email=rs1.getString("email");
        	  sname=rs1.getString("sname");
          }
          else{%>
        	  <!-- //System.out.print("DBerror"); -->
        	  <script>
				alert("Error occured. Try again after some time.");
				window.location="index.html";
        	  </script>
          <%}
          
      %>

    <!-- Page Heading/Breadcrumbs -->
    <h2 class="mt-4 mb-3" style="color: red;"><%=sname %></h2>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
        <li class="breadcrumb-item active"><a href=StudentForgottenCodeEnter.jsp>Enter Code</a></li>
      </li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <!--<div class="col-lg-3 mb-4">
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
      
      
      <div class="col-lg-9 mb-4">
        <div class="row">
      <div class="col-7 offset-4 mb-4">
        <div class="card h-100">
          <h4 class="card-header">Enter Code</h4>
          <div class="card-body">
            
              <form action="StudentForgottenVerifyCode.jsp" method="post" id="contactForm" novalidate>
          <div class="control-group form-group">
            <div class="controls">
            <p style="color: blue; align:center;">A OTP has been sent to <b style="color: red;"><%=email %></b> account. Please check and verify.</p>
              <label>Enter Code:</label>
              <input type="text" class="form-control" name="code" id="name" required data-validation-required-message="Please enter your name.">
              <p class="help-block"></p>
            </div>
          </div>
          
          <div id="success"></div>
          <!-- For success/fail messages -->
          <button type="submit" class="btn btn-primary" id="sendMessageButton">Verify</button>
        </form>
          </div>
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

