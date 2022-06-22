<%@ page import="kz.csse.db.Language" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: бота
  Date: 29.09.2020
  Time: 0:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
   
<%@include file="views/template/lib.jsp"%>
</head>
<body>
<% ArrayList<Language> languages=(ArrayList<Language>)request.getAttribute("languages");%>
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
                            Add Language
                        </button>
                    </div>

                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th style="padding-right: 100px;">Id</th>
                            <th style="padding-right: 150px;">Name</th>
                            <th style="padding-right: 200px;">Code</th>
                            <th>Operations</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for(Language language:languages){%>
                        <tr>
                            <th scope="row"><%=language.getId()%></th>
                            <th scope="row"><%=language.getName()%></th>
                            <th scope="row" style="padding-right: 200px;"><%=language.getCode()%></th>
                            <th scope="row" >
                                <div class="row" style="display: flex">
                                    <form action="/deleteLanguage" method="post">
                                        <div class="form-group" style="padding-right: 10px">

                                            <button type="submit" class="btn btn-danger" name="id" value="<%=language.getId()%>">delete</button>
                                        </div>
                                    </form>
                                    <a data-toggle="modal"  href="#Edit<%=language.getId()%>">
                                        <button type="button" class="btn btn-primary">EDIT</button>
                                    </a>
                                </div>


                            </th>

                        </tr>
                        <div class="modal fade" id="Edit<%=language.getId()%>">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel1">Edit  Language</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/editLanguage" method="post">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Name:</label>
                                                <input type="text" class="form-control" name="lan_name" id="exampleInputEmail2" aria-describedby="emailHelp" value="<%=language.getName()%>">

                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">Code</label>
                                                <INPUT type="text" class="form-control"  name="lan_code" id="exampleFormControlTextarea2" rows="3" value="<%=language.getCode()%>">
                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" name="lan_id" value="<%=language.getId()%>">
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
                                <form action="/addLanguage" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Name:</label>
                                        <input type="text" class="form-control" name="lan_name" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Name of Language...">

                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Code</label>
                                        <input type="text" class="form-control"  name="lan_code" id="exampleFormControlTextarea1"  placeholder="Code...">
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
