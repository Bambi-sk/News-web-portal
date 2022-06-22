package kz.csse.Servlets;

import kz.csse.db.DBManager;
import kz.csse.db.Language;
import kz.csse.db.News;
import kz.csse.db.Publication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ArrayList<News> news= DBManager.getAllNews();
        Cookie cookie[]=request.getCookies();
        String myCookieValue="1";
        String myStyleCookie="7";
        if(cookie!=null){
            for(Cookie c :cookie){
                if(c.getName().equals("language")){
                    myCookieValue=c.getValue();
                    break;
                }
            }
        }
        if(cookie!=null){
            for(Cookie c :cookie){
                if(c.getName().equals("style")){
                    myStyleCookie=c.getValue();
                    break;
                }
            }
        }
        request.setAttribute("style", myStyleCookie);
        try {
            request.setAttribute("news", DBManager.getNewsbyLan(Long.parseLong(myCookieValue)));
        } catch (Exception e) {
            e.printStackTrace();
        };

        ArrayList<Publication> publications= DBManager.getAllPublication();
        request.setAttribute("publications",publications);
        ArrayList<Language> languages= DBManager.getAllLanguage();
        request.setAttribute("languages",languages);
        request.getRequestDispatcher("/home.jsp").forward(request,response);
    }
}
