<%@ page import="eu.ensup.etablissementscolaire.Cours" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>Appli étudiant</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script type="text/javascript" src="assets/js/app.js" defer> </script>
</head>

<body>
 <%
     if (session.getAttribute("user") != null) {
         %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="#">CRÉER Cours</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">ATTRIBUER COURS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">LISTE DES Cours</a>
              </li>
            <li class="nav-item">
                <a class="nav-link" href="#">DÉCONNEXION</a>
              </li>
          </ul>
        </div>
      </nav>
            <%
         }
      %>
    <main class="container-fluid">
        <div class="row h-100">

            <div class="col-4 d-none d-lg-block"></div>

            <div class="col-lg-4 col-12 my-auto">
                <div class="row form_div">

                    <table class="table text-center">
                        <thead>
                            <tr>
                                <th class="table-title" colspan="4">Liste des Cours</th>
                            </tr>
                          <tr>
                            <th scope="col">Theme</th>
                            <th scope="col">Nombre Heurs</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                            for(Cours c : (Set<Cours>) session.getAttribute("listCoursp")){
                        %>
                          <tr>
                            <td><%= c.getTheme()%></td>
                            <td><%= c.getNbHeures()%></td>
                          </tr>
                        <%
                            }
                        %>
                        </tbody>
                      </table>
                </div>

            </div>

            <div class="col-4 d-none d-lg-block"></div>

        </div>




        </div>


    </main>
                  <div id="Boutons">
                       <a href="home.jsp">  <button formmethod="get" type="submit" class="btn btn-primary btn-form col-12">Acceuil</button> </a>
                   </div>
</body>

</html>