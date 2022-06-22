<%--
  Created by IntelliJ IDEA.
  User: бота
  Date: 29.09.2020
  Time: 0:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.csse.db.News" %>
<%@ page import="kz.csse.db.Language" %>
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
    <title>NEWS</title>
    <%String style = (String) request.getAttribute("style");%>
    <style>
        <%if(style.equals("1")){%>
        <%@include file="views/css/style2.css"%>
        <%}else if(style.equals("2")){%>
        <%@include file="views/css/style3.css"%>
        <%}else if(style.equals("3")){%>
        <%@include file="views/css/style4.css"%>
        <%}else if(style.equals("4")){%>
        <%@include file="views/css/style5.css"%>
        <%}else if(style.equals("5")){%>
        <%@include file="views/css/style6.css"%>
        <%}else if(style.equals("6")){%>
        <%@include file="views/css/style7.css"%>
        <%}else if(style.equals("9")){%>
        <%@include file="views/css/style9.css"%>
        <%}else if(style.equals("10")){%>
        <%@include file="views/css/style10.css"%>
        <%}else{%>
        <%@include file="views/css/style1.css"%>
        <%}%>
    </style>


</head>
<body>
<%ArrayList<Language> languages = (ArrayList<Language>) request.getAttribute("languages");%>
<%ArrayList<Publication> publications = (ArrayList<Publication>) request.getAttribute("publications");%>
<%ArrayList<News> news = (ArrayList<News>) request.getAttribute("news");%>

<div class="container" id="navbar_all">
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" style="font-weight: 700;" href="#">WORLD NEWS PORTAL</a>

    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <%for (Language language:languages){%>
            <li class="nav-item">
                <form action="/setCookie?id=<%=language.getId()%>" method="post">
                    <button type="submit"  id="nav_lan" class="dropdown-item"><%=language.getCode()%></button>
                </form>

            </li>
            <%}%>

        </ul>

        <ul class="navbar-nav ml-auto">

            <li class="nav-item">
                <a class="nav-link" href="/login">SignUp</a>
            </li>


        </ul>
    </div>
    <div class="btn-group dropleft">
        <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Style
        </button>
        <div class="dropdown-menu dropdown-menu-right">
            <form action="/setCookieStyle?style=7" method="post"><button class="dropdown-item" type="submit">Default</button></form>
            <form action="/setCookieStyle?style=1" method="post"><button class="dropdown-item" type="submit">Light</button></form>
            <form action="/setCookieStyle?style=2" method="post"><button class="dropdown-item" type="submit">Dark</button></form>
            <form action="/setCookieStyle?style=3" method="post"><button class="dropdown-item" type="submit">Monochrome</button></form>
            <form action="/setCookieStyle?style=4" method="post"><button class="dropdown-item" type="submit">Monochrome Inverse</button></form>
            <form action="/setCookieStyle?style=5" method="post"><button class="dropdown-item" type="submit">Facebook</button></form>
            <form action="/setCookieStyle?style=6" method="post"><button class="dropdown-item" type="submit">Instagram</button></form>
            <form action="/setCookieStyle?style=9" method="post"><button class="dropdown-item" type="submit">Large</button></form>
            <form action="/setCookieStyle?style=10" method="post"><button class="dropdown-item" type="submit">Small</button></form>
        </div>
    </div>

</nav>
</div>
<div class="container">
<%@include file="views/template/navs.jsp"%>
</div>


<div class="container">
    <div class="row">
        <div class = "text-center" style="    display: flex;flex-direction: column; float: left;">
            <h1>
                All World News
            </h1>
            <br>
            <h5 style="font-weight: 300;float: left;padding-left: 100px;">You can read news in different languages</h5>
        </div>
    </div>



    <div class="card-data">
        <% for(News n:news){ %>
        <div class="card" style="width: 45%;margin-right: 20px;margin-bottom: 20px;margin-left: 10px;" >
            <img class="card-img-top" src="<%=n.getPicture_url()%>" alt="Card image cap">
            <div class="card-body">
                <small class="publication"><%=n.getPublication().getName()%></small>
                <h5 class="card-title">
                    <%=n.getTitle()%>
                    <br>
                    <small class="post-date"><%=n.getPost_date()%></small>
                </h5>

                <p class="card-text"><%=n.getShort_content()%></p>
                <a href="/detailsNews?news_id=<%=n.getId()%>" id="btn_read_more" class="btn ">Read More</a>
            </div>
        </div>
        <%}%>

    </div>
</div>






</body>
</html>