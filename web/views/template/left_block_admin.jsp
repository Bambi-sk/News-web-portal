<%--
  Created by IntelliJ IDEA.
  User: бота
  Date: 29.09.2020
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<style>
        .sidebar .nav-link a:hover {
            color: dodgerblue;
        }
        a {
            color: black;
            text-decoration: none;
        }

</style>

<div class="sidebar" style="width: 15%; background-color: rgba(0,0,0,.03); padding-top: 10px;padding-left: 20px;">
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link active"  style=" font-weight: bold ">Admin Panel</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" style="font-weight: bold" href="/languagesServlet">Languages</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" style=";font-weight: bold" href="/publicationList">Publications</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" style="font-weight: bold" href="/NewsList">News</a>
        </li>

    </ul>
</div>

