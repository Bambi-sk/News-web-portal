<%@ page import="kz.csse.db.News" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.csse.db.Language" %>
<%@ page import="kz.csse.db.Publication" %><%--
  Created by IntelliJ IDEA.
  User: бота
  Date: 29.09.2020
  Time: 0:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News</title>
    <%@include file="views/template/lib.jsp"%>
</head>
<body>
<% ArrayList<News> news=(ArrayList<News>)request.getAttribute("news");%>
<% ArrayList<Language> languages=(ArrayList<Language>)request.getAttribute("languages");%>
<%ArrayList<Publication> publications=(ArrayList<Publication>)request.getAttribute("publications");%>
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
                            <th >Title</th>
                            <th>Language</th>
                            <th>Added Date</th>
                            <th>Publication</th>
                            <th>Details</th>
                            <th>Operations</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%for(News news1:news){%>
                        <tr >
                            <th scope="row" style="font-weight: 500;"><%=news1.getId()%></th>
                            <th scope="row" style="font-weight: 500;"><%=news1.getTitle()%></th>
                            <th scope="row" style="font-weight: 500;"><%=news1.getLanguage().getName()%></th>
                            <th scope="row" style="font-weight: 500;" ><%=news1.getPost_date()%></th>
                            <th scope="row" style="font-weight: 500;"><%=news1.getPublication().getName()%></th>

                            <th scope="row" style="font-weight: 500;">
                                <a data-toggle="modal"  href="#Details<%=news1.getId()%>">
                                <button type="button" class="btn btn-primary">Details</button>
                            </a></th>
                            <th scope="row" >
                                <div class="row" style="display: flex">
                                    <form action="/deleteNews" method="post">
                                        <div class="form-group" style="padding-right: 10px">

                                            <button type="submit" class="btn btn-danger" name="id" value="<%=news1.getId()%>">delete</button>
                                        </div>
                                    </form>
                                    <a data-toggle="modal"  href="#Edit<%=news1.getId()%>">
                                        <button type="button" class="btn btn-primary">EDIT</button>
                                    </a>
                                </div>


                            </th>

                        </tr>
                        <div class="modal fade" id="Edit<%=news1.getId()%>">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel1">Edit  News</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/editNews" method="post">
                                            <div class="form-group">
                                                <label >Title:</label>
                                                <input type="text" class="form-control" name="n_title" id="exampleInputEmail2" aria-describedby="emailHelp" value="<%=news1.getTitle()%>">

                                            </div>
                                            <div class="form-group">
                                                <label >SHORT CONTENT</label>
                                                <textarea type="text" class="form-control"  name="n_scontent" id="exampleFormControlTextarea2" rows="3" value="<%=news1.getShort_content()%>"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail3">Content</label>
                                                <input type="text"  class="form-control" name="content" id="exampleInputEmail3" aria-describedby="emailHelp" value="<%=news1.getContent()%>">

                                            </div>
                                            <div class="form-group">
                                                <label >Language:</label>
                                                <select class="custom-select" name="language_id">
                                                    <%for (Language lang : languages){%>
                                                    <option value="<%=lang.getId()%>"><%=lang.getCode()%></option>
                                                    <%}%>
                                                </select>

                                            </div>
                                            <div class="form-group">
                                                <label>Publications : </label>
                                                <select class="custom-select" name="publication_id">
                                                    <%for (Publication pub : publications){%>
                                                    <option value="<%=pub.getId()%>"><%=pub.getName()%></option>
                                                    <%}%>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label>PICTURE URL : </label>
                                                <input type="text" class="form-control" name="picture_url">
                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" name="news_id" value="<%=news1.getId()%>">
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
                        <div class="modal fade" id="Details<%=news1.getId()%>">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel12">Detail  News</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">

                                            <div class="form-group">
                                                <label >Title:</label>
                                                <p><%=news1.getTitle()%></p>

                                            </div>
                                            <div class="form-group">
                                                <label >Short Content:</label>
                                                <p><%=news1.getShort_content()%></p>

                                            </div>
                                            <div class="form-group">
                                                <label >Content</label>
                                                <p><%=news1.getContent()%></p>

                                            </div>
                                            <div class="form-group">
                                                    <label >Image:</label>

                                                    <img style="width: 200px;" class="rounded mx-auto d-block" src="<%=news1.getPicture_url()%>">

                                            </div>
                                            <div class="form-group">
                                                <label >Language:</label>
                                                <p><%=news1.getLanguage().getName()%></p>
                                            </div>
                                            <div class="form-group">
                                                    <label >Publication:</label>
                                                    <p><%=news1.getPublication().getName()%></p>
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
                                <h5 class="modal-title" id="exampleModalLabel">Add  News</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="/addNews" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail5">Title:</label>
                                        <input type="text" class="form-control" name="n_title" id="exampleInputEmail5" aria-describedby="emailHelp">

                                    </div>
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea3">SHORT CONTENT</label>
                                        <textarea type="text" class="form-control"  name="n_scontent" id="exampleFormControlTextarea3" rows="3"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail7">Content</label>
                                        <textarea type="text"  class="form-control" name="content" id="exampleInputEmail7" aria-describedby="emailHelp"></textarea>

                                    </div>
                                    <div class="form-group">
                                        <label >Language:</label>
                                        <select class="custom-select" name="language_id">
                                            <%for (Language lang : languages){%>
                                            <option value="<%=lang.getId()%>"><%=lang.getCode()%></option>
                                            <%}%>
                                        </select>

                                    </div>
                                    <div class="form-group">
                                        <label>Publications : </label>
                                        <select class="custom-select" name="publication_id">
                                            <%for (Publication pub : publications){%>
                                            <option value="<%=pub.getId()%>"><%=pub.getName()%></option>
                                            <%}%>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>PICTURE URL : </label>
                                        <input type="text" class="form-control" name="picture_url">
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
