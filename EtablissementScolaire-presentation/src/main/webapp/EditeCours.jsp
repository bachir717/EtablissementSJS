<%@ page import="eu.ensup.etablissementscolaire.Cours" %>
<%@ page import="java.util.Set" %>
<%@ page import="eu.ensup.etablissementscolaire.Cours" %>
<%--
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un éléve</title>
    <link href="css/style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script type="text/javascript" src="css/app.js" defer></script>
</head>
<body>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">ACCUEIL</a>
                    </li>
                </ul>
            </div>
        </nav>
<main>
    <div class="container-fluid d-flex justify-content-center" >
        <div class="card shadow-lg">
                <fieldset class="form-row input">

                    <h2>Modification d'un cours</h2>

                    <form action="EditerCoursServ" method="POST">
                       <div class="form-group" >
                                            <label for="dropPicker">Sélectionner un cours:</label>
                                            <select name="id_Cours" class="form-control" id="dropPicker">

                                              <%--  <% for(Cours c : (Set<Cours>) session.getAttribute("listCoursC")){ %>
                                                    <option value="<%= c.getId() %>"><%= c.getTheme()+ " " +c.getNbHeures()  %></option>
                                                <% } %> --%>

                                                 <c:forEach items="${ listCoursC }" var="cours" varStatus="status">
                                                 <option selected value="${ cours.id  }" >
                                                 ${ cours.theme } - ${ etudiant.nbHeures } </option>
                                                 </c:forEach>
                                            </select>
                                        </div>
                    <input type="hidden" class="form-control"  id="idCours" placeholder="id" >
                      <div class="form-group input">
                      <label for="name">Theme:</label>
                              <input type="text" class="form-control item" name="Theme" id="Theme"  placeholder="Theme">
                      </div>
                      <div class="form-group input">
                      <label for="name">Heures:</label>
                              <input type="text" class="form-control item" name="NBH" id="NBH"  placeholder="Nombre d'heurs">
                       </div>
                        <div class="form_error col-12">
                            <% if (request.getAttribute("info") !=null) {%>
                            <p id="form_info_text">${info}</p>
                            <% request.removeAttribute("info"); } %>
                        </div>
                    <div class="form-group btn-center" >
                      <button type="submit" class="btn btn-primary btn-form-udpate" formmethod="POST" id="btnUpdate" >Modifier</button>
                    </div>

                </form>
                </fieldset>
        </div>
    </div>
</main>
</body>
</html>
