<%@ page import="kz.csse.db.Publication" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: бота
  Date: 29.09.2020
  Time: 0:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Publication</title>
    <%@include file="views/template/lib.jsp"%>
</head>
<body>
<% ArrayList<Publication> publications=(ArrayList<Publication>)request.getAttribute("publications");%>
<%@include file="views/template/header_admin.jsp"%>
<div class="container-fluid">
    <div class="row">
        <%@include file="views/template/left_block_admin.jsp"%>
        <div class="content" style="width: 85%">
            <div class="card">
                <div class="card-header" style="border:none; background: none;">
                    <div class="row"  >
                        <h2 style="width: 85%;padding-left: 20px;margin-right: 20px;">Languages</h2>
                        <button type="button" style="float: right" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
                            Add Publication
                        </button>
                    </div>

                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th >Name</th>
                            <th style="width: 65%;">Description</th>
                            <th>Rating</th>
                            <th>Operations</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for(Publication publication:publications){%>
                        <tr >
                            <th scope="row" style="font-weight: 500;"><%=publication.getId()%></th>
                            <th scope="row" style="font-weight: 500;"><%=publication.getName()%></th>
                            <th scope="row" style="font-weight: 500;"><%=publication.getDescription()%></th>
                            <th scope="row" style="font-weight: 500;" ><%=publication.getRating()%></th>
                            <th scope="row" >
                                <div class="row" style="display: flex">
                                    <form action="/deletePublication" method="post">
                                        <div class="form-group" style="padding-right: 10px">

                                            <button type="submit" class="btn btn-danger" name="id" value="<%=publication.getId()%>">delete</button>
                                        </div>
                                    </form>
                                    <a data-toggle="modal"  href="#Edit<%=publication.getId()%>">
                                        <button type="button" class="btn btn-primary">EDIT</button>
                                    </a>
                                </div>


                            </th>

                        </tr>
                        <div class="modal fade" id="Edit<%=publication.getId()%>">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel1">Edit  Language</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/editPublication" method="post">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Name:</label>
                                                <input type="text" class="form-control" name="publ_name" id="exampleInputEmail2" aria-describedby="emailHelp" value="<%=publication.getName()%>">

                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">Description</label>
                                                <textarea type="text" class="form-control"  name="publ_descr" id="exampleFormControlTextarea2" rows="3" value="<%=publication.getDescription()%>"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail3">Rating</label>
                                                <input type="number" step="0.1" class="form-control" name="rating" id="exampleInputEmail3" aria-describedby="emailHelp" value="<%=publication.getRating()%>">

                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" name="publ_id" value="<%=publication.getId()%>">
                                            </div>
                                            <div class="form-group">

                                                <button type="submit" class="btn btn-primary">save</button>
                                            </div>
                                        </form>


                                    </div>
                                    <div class="modal-footer">

                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>

                                    </div>
                                </div>
                            </div>
                        </div>


                        <%}%>
                        </tbody>
                    </table>
                </div>

                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add New League</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="/addPublication" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Name:</label>
                                        <input type="text" class="form-control" name="publ_name" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Name of Publication...">

                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Description</label>
                                        <textarea type="text" class="form-control"  name="publ_descr" id="exampleFormControlTextarea1"  placeholder="Description..."></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea3">Rating</label>
                                        <input type="number" step="0.1" class="form-control"  name="rating" id="exampleFormControlTextarea3"  placeholder="Rating...">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">ADD</button>
                                    </div>
                                </form>

                            </div>
                            <div class="modal-footer">

                                <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
