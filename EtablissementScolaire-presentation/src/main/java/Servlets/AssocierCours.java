package Servlets;

import eu.ensup.etablissementscolaire.*;
import eu.ensup.etablissementscolaire.exception.coursExceptions.GetAllCoursServiceException;
import eu.ensup.etablissementscolaire.exception.coursExceptions.GetCoursServiceException;
import eu.ensup.etablissementscolaire.exception.coursExceptions.InscriptionCoursServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.AddEtudiantServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.GetAllEtudiantServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.GetEtudiantServiceException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Set;

@WebServlet(name = "setCourse", value = "/setCourse")
public class AssocierCours extends HttpServlet {
    public void init() {
    }

    CoursService coursService = new CoursService();
    EtudiantService etudiantService = new EtudiantService();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // operations(request, response);

            Set<Cours> listeCours = coursService.getAll();
            Set<Etudiant> listEtudiant = etudiantService.getAll();
            System.out.println("Liste Etudiant Siez : "+ listEtudiant.size());
            for (Etudiant e:listEtudiant)
            {
                System.out.println("Id etudiant"+ e.getId());
            }
            request.setAttribute("listCours", listeCours);
            request.setAttribute("listEtudiants", listEtudiant);
            request.getRequestDispatcher("AssocierCoursE.jsp").forward(request, response);
        } catch (GetAllCoursServiceException | GetAllEtudiantServiceException e) {
            e.printStackTrace();
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //operations(request, response);
        try {
            System.out.println("dans do poste");
            op(request,response);
        } catch (GetEtudiantServiceException e) {
            e.printStackTrace();
        } catch (GetCoursServiceException e) {
            e.printStackTrace();
        }
    }

    protected void operations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Set<Cours> listeCours = null;
        try {
            EtudiantService etudiantService = new EtudiantService();
            CoursService coursService = new CoursService();

            HttpSession userSession = request.getSession();


            Set<Etudiant> List = etudiantService.getAll();
            userSession.setAttribute("listEtudiants", List);
            if (request.getParameter("error") != null) {
                request.setAttribute("error", "");
            }
            if (request.getParameter("button") != null && !request.getParameter("button").isEmpty() && request.getParameter("button").split(" ").length >= 2) {
                coursService.inscription(coursService.get(Integer.parseInt(request.getParameter("button").split(" ")[0])), etudiantService.get(Integer.parseInt(request.getParameter("button").split(" ")[1])));
                request.setAttribute("error", "Attribution du cour à réussi");

            }

        } catch (GetAllEtudiantServiceException | GetCoursServiceException | GetEtudiantServiceException | InscriptionCoursServiceException e) {
            request.setAttribute("error", e.getMessage());
        }
        request.getRequestDispatcher("AssocierCours.jsp").forward(request, response);

    }


    protected void op(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, GetEtudiantServiceException, GetCoursServiceException {

        try {
            System.out.println("dans la fonction op");
            Etudiant etudiant = etudiantService.get(Integer.parseInt(req.getParameter("etudiant_select")));
            etudiant.setId(Integer.parseInt(req.getParameter("etudiant_select")));
            Cours cours = coursService.get(Integer.parseInt(req.getParameter("courses")));
            System.out.println("id cours" + cours.getId());
            System.out.println("id etudiant" + etudiant.getId());
            int res = coursService.inscription(cours, etudiant);
            System.out.println("res : " + res);
            resp.sendRedirect("/home.jsp");
        } catch (InscriptionCoursServiceException e) {
            req.getRequestDispatcher("error.jsp");
        }
    }
}