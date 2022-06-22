<%--
  Created by IntelliJ IDEA.
  User: бота
  Date: 29.09.2020
  Time: 0:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>International Uni</title>
    <style>
        .collapse:not(.show) {
            display: none;
        }

        @media (min-width:768px) {
            .navbar-expand-md .navbar-collapse {
                display: flex!important;
                flex-basis: auto;
            }
        }
        .navbar-light .navbar-brand:focus, .navbar-light .navbar-brand:hover {
            color: rgba(0,0,0,.9);
        }

        .navbar-brand {

            display: inline-block;
            padding-top: .3125rem;
            padding-bottom: .3125rem;
            margin-right: 1rem;
            font-size: 1.25rem;
            line-height: inherit;
            white-space: nowrap;
        }

        .navigation-clean-button {
            background: #fff;
            padding-top: .75rem;
            padding-bottom: .75rem;
            color: #333;
            border-radius: 0;
            box-shadow: none;
            border: none;
            margin-bottom: 0;
        }

        .navigation-clean-button.navbar .navbar-nav .nav-link {
            padding-left: 18px;
            padding-right: 18px;
        }

        .navbar-light .navbar-nav .active > .nav-link, .navbar-light .navbar-nav .nav-link.active, .navbar-light .navbar-nav .nav-link.show, .navbar-light .navbar-nav .show > .nav-link {
            color: rgba(0,0,0,.9);
        }

        .navbar-light .navbar-nav .nav-link:focus, .navbar-light .navbar-nav .nav-link:hover {
            color: rgba(0,0,0,.7);
        }

        .navigation-clean-button .navbar-nav a.active, .navigation-clean-button .navbar-nav > .show > a {
            background: none;
            box-shadow: none;
        }

        .navigation-clean-button .navbar-nav a.active, .navigation-clean-button .navbar-nav > .show > a {
            background: none;
            box-shadow: none;
        }
        .navbar-light .navbar-nav .nav-link {
            color: rgba(0,0,0,.5);
        }

        .nav-link {
            display: block;
            padding: .5rem 1rem;
        }



        .navigation-clean-button .navbar-brand {
            font-weight: bold;
            color: inherit;
        }


        .navbar-collapse {

            flex-basis: 100%;
            flex-grow: 1;
            align-items: center;
        }


        .navigation-clean-button {
            background: #fff;
            padding-top: .75rem;
            padding-bottom: .75rem;
            color: #333;
            border-radius: 0;
            box-shadow: none;
            border: none;
            margin-bottom: 0;
        }
    </style>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                Worlds News Portal
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">

                    <li class="nav-item">
                        <a class="nav-link" href="/">Sign Out</a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
