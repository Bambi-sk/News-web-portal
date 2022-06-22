package kz.csse.Servlets;

import kz.csse.db.DBManager;
import kz.csse.db.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/detailsNews")
public class detailsNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        News news=null;
        try {
             news=DBManager.getNews(Long.parseLong(request.getParameter("news_id")));
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("new", news);
        request.setAttribute("languages", DBManager.getAllLanguage());
        request.setAttribute("publications", DBManager.getAllPublication());
        request.getRequestDispatcher("/newsDetail.jsp").forward(request, response);
    }
}
