package kz.csse.Servlets;

import kz.csse.db.DBManager;
import kz.csse.db.Language;
import kz.csse.db.News;
import kz.csse.db.Publication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/NewsList")
public class NewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ArrayList<News> news= DBManager.getAllNews();
        request.setAttribute("news",news);
        ArrayList<Publication> publications= DBManager.getAllPublication();
        request.setAttribute("publications",publications);
        ArrayList<Language> languages= DBManager.getAllLanguage();
        request.setAttribute("languages",languages);
        request.getRequestDispatcher("/News.jsp").forward(request,response);
    }
}
