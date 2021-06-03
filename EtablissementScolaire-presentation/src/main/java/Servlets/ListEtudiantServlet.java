package Servlets;

import eu.ensup.etablissementscolaire.Etudiant;
import eu.ensup.etablissementscolaire.EtudiantService;
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

@WebServlet(name = "listEtudiantServlet", urlPatterns = "/")
public class ListEtudiantServlet extends HttpServlet {

    public void init() {
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String action = request.getServletPath();
            switch (action) {
                case "/delete":
                    deleteEtudiant(request, response);
                    break;
                case "/listEtudiantServlet":
                    operations(request, response);
                    break;
                case "/EditeEtudiant":
                    EditerEtudiant(request,response);
                    break;
                default:
                    break;
            }


        } catch (NoSuchAlgorithmException | AddEtudiantServiceException | GetAllEtudiantServiceException e) {
            request.getRequestDispatcher("erreur.jsp").forward(request, response);
            e.printStackTrace();
        } catch (GetEtudiantServiceException e) {
            e.printStackTrace();
        } catch (DeleteEtudiantServiceException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        doGet(request, response);
//        try {
//            operations(request,response);
//            deleteEtudiant(request,response);
//        } catch ( NoSuchAlgorithmException | AddEtudiantServiceException | GetAllEtudiantServiceException e) {
//            request.getRequestDispatcher("erreur.jsp").forward(request,response);
//            e.printStackTrace();
//        } catch (GetEtudiantServiceException e) {
//            e.printStackTrace();
//        } catch (DeleteEtudiantServiceException e) {
//            e.printStackTrace();
//        }
    }

    protected void operations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchAlgorithmException, AddEtudiantServiceException, GetAllEtudiantServiceException {
        EtudiantService etudiantService = new EtudiantService();
        HttpSession userSession = request.getSession();

        Set<Etudiant> List = etudiantService.getAll();
        userSession.setAttribute("listEtudiants", List);
        request.getRequestDispatcher("ListeEtudiants.jsp").forward(request, response);

    }

    private void deleteEtudiant(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, GetEtudiantServiceException, DeleteEtudiantServiceException {
        EtudiantService etudiantService = new EtudiantService();
        int id = Integer.parseInt(req.getParameter("id"));
        etudiantService.delete(id);
        req.getRequestDispatcher("ListeEtudiants.jsp").forward(req, resp);

    }

    private void EditerEtudiant(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, GetEtudiantServiceException {
        int id = Integer.parseInt(req.getParameter("id"));
        EtudiantService etudiantService = new EtudiantService();
        etudiantService.get(id);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("EditerEtudiants.jsp");
        req.setAttribute("e",etudiantService);
        requestDispatcher.forward(req,resp);
    }
}
