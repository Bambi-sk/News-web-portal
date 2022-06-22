<%@ page import="kz.csse.db.Publication" %><%--
  Created by IntelliJ IDEA.
  User: бота
  Date: 29.09.2020
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar" id="nav_publ" style="font-weight: 700;margin-bottom: 20px;">
    <ul class="nav justify-content-center" style="padding-left: 20px;">
        <%for (Publication p : publications){%>
        <li class="nav-item">
            <a class="nav-link" ><%=p.getName()%></a>
        </li>
        <%}%>

    </ul>

</nav>
