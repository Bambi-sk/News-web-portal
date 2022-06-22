<%@ page import="kz.csse.db.Language" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.csse.db.News" %><%--
  Created by IntelliJ IDEA.
  User: бота
  Date: 30.09.2020
  Time: 7:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

    <!--Font Awesome (added because you use icons in your prepend/append)-->
    <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <%@include file="views/template/lib.jsp"%>
    <title>NEWS DETAIL</title>
      <style>
          #nav_publ{
              background-color: #23A38E;color: white;font-weight: 700;margin-bottom: 20px;
          }
      </style>
       
</head>
<body>
<%ArrayList<Language> languages = (ArrayList<Language>) request.getAttribute("languages");%>
<%ArrayList<Publication> publications = (ArrayList<Publication>) request.getAttribute("publications");%>
<% News news = (News)request.getAttribute("new");%>

<div class="container" id="navbar_all" style="background-color: white;">
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" style="font-weight: 700;justify-content: center;color: red;padding-left: 300px;"  href="/home">WORLD NEWS PORTAL</a>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">

            </ul>

            <ul class="navbar-nav ml-auto">

                <li class="nav-item">
                    <a class="nav-link" style="color: black" href="/login">SignUp</a>
                </li>


            </ul>
        </div>
    </nav>
</div>
<div class="container">
    <%@include file="views/template/navs.jsp"%>
</div>
<div class="mt-4 container">
    <div class="row no-gutters">
        <div class="col-sm-6 col-md-8 pr-3">
            <h3><%=news.getTitle()%></h3>
            <p class="pt-3" style="font-size: 13px;"><%=news.getPost_date()%>  <a href="#"><%=news.getPublication().getName()%></a></p>
            <hr>
            <img src="<%=news.getPicture_url()%>" style="max-width: 500px; max-height: 400px;">
            <p class="pt-3" style="font-weight: bolder; font-size: 16px;"><%=news.getShort_content()%></p>
            <p class="pt-4"><%=news.getContent()%></p>
        </div>
        <div class="col-sm-6 col-md-4 ">
            <div class="pl-2 pt-4 pb-4" style="margin-top: 40px; background-color: #23A38E">
                <h2 style="color:white; font-weight: bold;">About <%=news.getPublication().getName()%> </h2>
                <p class="lead" style="color: white;"><%=news.getPublication().getDescription()%></p>
                <p style="font-weight: bolder; color: white; padding-top: 15px;">Rating: <%=news.getPublication().getRating()%></p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
