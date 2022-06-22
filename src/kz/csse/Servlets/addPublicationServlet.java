package kz.csse.Servlets;

import kz.csse.db.DBManager;
import kz.csse.db.Language;
import kz.csse.db.Publication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/addPublication")
public class addPublicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("publ_name");
        String descr= request.getParameter("publ_descr");

        Double rating=Double.parseDouble(request.getParameter("rating"));
        System.out.println(rating);
        Publication publication=new Publication();

        publication.setName(name);
        publication.setDescription(descr);
        publication.setRating(rating);


        DBManager.addPublication(publication);

        response.sendRedirect("/publicationList");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
