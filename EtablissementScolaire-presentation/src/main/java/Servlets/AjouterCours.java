package Servlets;


import eu.ensup.etablissementscolaire.Cours;
import eu.ensup.etablissementscolaire.CoursService;
import eu.ensup.etablissementscolaire.Etudiant;
import eu.ensup.etablissementscolaire.EtudiantService;
import eu.ensup.etablissementscolaire.exception.CredentialException;
import eu.ensup.etablissementscolaire.exception.coursExceptions.AddCoursServiceException;
import eu.ensup.etablissementscolaire.exception.etudiantExceptions.AddEtudiantServiceException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name="AjouterCours",urlPatterns="/AjouterCours")
public class AjouterCours extends HttpServlet {

    public AjouterCours(){
        super();
    }

//    @Override
//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {}

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        try {

            Cours cours = new Cours(req.getParameter("Theme"), Integer.parseInt(req.getParameter("NBH")) );
            CoursService coursService = new CoursService();
            int resultCode = 0;

            resultCode = coursService.create(cours);
            System.out.println(resultCode);
            req.setAttribute( "cours", cours );
            System.out.println("poste ici1");
            if (resultCode == 0) {
                System.out.println("poste ici2");
                this.getServletContext().getRequestDispatcher( "/successCours.jsp" ).forward( req, resp );
            } else {
                this.getServletContext().getRequestDispatcher( "/error.jsp" ).forward( req, resp );
            }

        } catch (AddCoursServiceException e) {
            e.printStackTrace();

        }
    }
}
