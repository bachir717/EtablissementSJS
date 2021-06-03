

package Servlets;

import eu.ensup.etablissementscolaire.Cours;
import eu.ensup.etablissementscolaire.CoursService;
import eu.ensup.etablissementscolaire.Etudiant;
import eu.ensup.etablissementscolaire.EtudiantService;
import eu.ensup.etablissementscolaire.exception.coursExceptions.GetAllCoursServiceException;
import eu.ensup.etablissementscolaire.exception.coursExceptions.UpdateCoursServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.AddEtudiantServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.GetAllEtudiantServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.UpdateEtudiantServiceException;
import org.jfree.base.modules.SubSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Set;

@WebServlet(name = "EditerCoursServ", value = "/EditerCoursServ")
public class EditerCours extends HttpServlet {
    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        operations(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        operations(request, response);

    }

    protected void operations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Modification réussie0");
        CoursService coursService = new CoursService();
        HttpSession userSession = request.getSession();
        Set<Cours> Listc = null;
        try {
            Listc = coursService.getAll();

            userSession.setAttribute("listCoursC", Listc);
            System.out.println("request.getParameter(\"id_Cours\") : " + request.getParameter("id_Cours"));
            if (request.getParameter("id_Cours") != null && !request.getParameter("id_Cours").equals("")) {
                System.out.println("Modification réussie 00");

                Cours cours = new Cours(Integer.parseInt(request.getParameter("id_Cours")), request.getParameter("Theme"), Integer.parseInt(request.getParameter("NBH")));

                if (cours.getTheme() == null) {
                    request.setAttribute("info", "Veuillez remplir tous les champs");
                } else {
                    System.out.println("Modification réussie");
                    request.setAttribute("info", "Modification réussie");
                    coursService.update(cours);

                }
                System.out.println("Modification réussie2");
                request.getRequestDispatcher("ListeCours.jsp").forward(request, response);
                //response.sendRedirect("ListeEtudiants.jsp");

            } else {
                request.setAttribute("info", "Veuillez sélectionnez un étudiant");
                request.getRequestDispatcher("EditeCours.jsp").forward(request, response);
            }
        } catch (UpdateCoursServiceException | GetAllCoursServiceException e) {
            request.setAttribute("info", e.getMessage());
            request.getRequestDispatcher("EditeCours.jsp").forward(request, response);
        }

    }

}