package Servlets;


import eu.ensup.etablissementscolaire.Responsable;
import eu.ensup.etablissementscolaire.ResponsableService;
import eu.ensup.etablissementscolaire.exception.CredentialException;
import eu.ensup.etablissementscolaire.exception.EmailFormatException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "ConnectionServ", urlPatterns = "/ConnectionServ")
public class ConnectionServ extends HttpServlet {

    public ConnectionServ() {
        super();
    }

    //    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//        String email = req.getParameter("emailE");
//        String motDePass = req.getParameter("passwordE");
//
//
//        try {
//
//            if (email.equals("ch") && motDePass.equals("123")) {
//                resp.sendRedirect("index.jsp");
//
//            } else {
//                resp.sendRedirect("Connection.jsp");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        try {
            ResponsableService resServ = new ResponsableService();
            String email = req.getParameter("emailE");
            String motDePass = req.getParameter("passwordE");
            validate(email);

            Responsable res = resServ.getCredentialByEmail((email));
            resServ.validAuthentification(res,String.valueOf(motDePass));
            req.getSession().setAttribute("res",res);
//            resp.sendRedirect("listEtudiantServlet");
            resp.sendRedirect("home.jsp");



        } catch (EmailFormatException | CredentialException | NoSuchAlgorithmException exp) {
         System.out.println(exp.getMessage());
         req.setAttribute("error","echec de la connexion suite à une erreur");
         this.getServletContext().getRequestDispatcher("/error.jsp").forward(req,resp);
        }
    }

    public static void validate(String email) throws EmailFormatException {

        Pattern VALID_EMAIL_REGEX = Pattern.compile("^[A-Z0-9.%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);;
        Matcher m = VALID_EMAIL_REGEX.matcher(email);
        if(!m.find()){
            throw new EmailFormatException();
        }
    }
}
