package kz.csse.Servlets;

import kz.csse.db.DBManager;
import kz.csse.db.Language;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/addLanguage")
public class addLanguageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("lan_name");
        String code= request.getParameter("lan_code");
        Language language=new Language();
        language.setName(name);
        language.setCode(code);


        DBManager.addLanguages(language);

        response.sendRedirect("/languagesServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
