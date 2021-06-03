package Servlets;

import eu.ensup.etablissementscolaire.CoursService;
import eu.ensup.etablissementscolaire.Cours;
import eu.ensup.etablissementscolaire.EtudiantService;
import eu.ensup.etablissementscolaire.exception.coursExceptions.AddCoursServiceException;
import eu.ensup.etablissementscolaire.exception.coursExceptions.DeleteCoursServiceException;
import eu.ensup.etablissementscolaire.exception.coursExceptions.GetAllCoursServiceException;
import eu.ensup.etablissementscolaire.exception.coursExceptions.GetCoursServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.AddEtudiantServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.DeleteEtudiantServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.GetAllEtudiantServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.GetEtudiantServiceException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Set;

@WebServlet(name="ListeCours", urlPatterns = "/ListeCours")
public class ListeCours extends HttpServlet {


    public ListeCours() {
        super();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String action = request.getServletPath();
            switch (action) {
                case "/deleteCours":
                    deleteCours(request, response);
                    break;
                case "/ListeCours":
                    operations(request, response);
                    break;
                default:
                    break;
            }


        } catch (NoSuchAlgorithmException  | GetAllCoursServiceException e) {
            request.getRequestDispatcher("erreur.jsp").forward(request, response);
            e.printStackTrace();
        } catch (DeleteCoursServiceException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            operations(request,response);
        } catch ( NoSuchAlgorithmException  | GetAllCoursServiceException e) {
            request.getRequestDispatcher("erreur.jsp").forward(request,response);
            e.printStackTrace();
        }
    }

    protected void operations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchAlgorithmException, GetAllCoursServiceException {
        CoursService coursService = new CoursService();
        HttpSession userSession = request.getSession();

        Set<Cours> List = coursService.getAll();
        userSession.setAttribute("listCoursps",List);
        request.getRequestDispatcher("ListeCours.jsp").forward(request,response);

    }

    private void deleteCours(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, DeleteCoursServiceException {
        CoursService coursService = new CoursService();
        int id = Integer.parseInt(req.getParameter("id"));
        coursService.delete(id);
        req.getRequestDispatcher("ListeCours.jsp").forward(req, resp);

    }

    private void EditerCours(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, GetCoursServiceException {
        int id = Integer.parseInt(req.getParameter("id"));
        CoursService coursService = new CoursService();
        coursService.get(id);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("EditerCours.jsp");
        req.setAttribute("e",coursService);
        requestDispatcher.forward(req,resp);
    }
}

