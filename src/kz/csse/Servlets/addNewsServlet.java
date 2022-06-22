package kz.csse.Servlets;

import kz.csse.db.DBManager;
import kz.csse.db.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/addNews")
public class addNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String title=request.getParameter("n_title");
        String short_content= request.getParameter("n_scontent");
        String content=request.getParameter("content");
        Long lan_id=Long.parseLong(request.getParameter("language_id"));
        Long publ_id=Long.parseLong(request.getParameter("publication_id"));
        String p_url=request.getParameter("picture_url");

        News news=new News();
        news.setTitle(title);
        news.setShort_content(short_content);
        news.setContent(content);
        news.setLanguage(DBManager.getLanguage(lan_id));
        news.setPublication(DBManager.getPublication(publ_id));
        news.setPicture_url(p_url);


        DBManager.addNews(news);

        response.sendRedirect("/NewsList");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
