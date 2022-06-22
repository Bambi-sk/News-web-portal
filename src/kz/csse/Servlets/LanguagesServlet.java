package kz.csse.Servlets;

import kz.csse.db.DBManager;
import kz.csse.db.Language;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value="/languagesServlet")
public class LanguagesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ArrayList<Language> languages= DBManager.getAllLanguage();
        request.setAttribute("languages",languages);
        request.getRequestDispatcher("/Languages.jsp").forward(request,response);
    }
}
