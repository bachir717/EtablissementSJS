<%@ page import="eu.ensup.etablissementscolaire.Etudiant" %>
  <%@ page import="java.util.Set" %>
    <%@ page import="eu.ensup.etablissementscolaire.Matiere" %>
      <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
          <!DOCTYPE html>
          <html lang="fr">
          <head>
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta charset="UTF-8">
            <title>Appli étudiant</title>
            <link href="css/style.css" rel="stylesheet">
            <script type="text/javascript" src="css/notes.js" defer></script>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
              crossorigin="anonymous">
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
            <main class="container-fluid">
              <div class="row h-100">

                <div class="col-4 d-none d-lg-block"></div>

                <div class="col-lg-4 col-12 my-auto">
                  <div class="row form_div">
                    <h2 class="col-12">Attribuer un note à un étudiant</h2>
                    <form class="student_form col-12">
                      <div class="row">
                        <div class="form-group col-12">
                          <label for="studentselect">Choisir un étudiant:</label>

                          <select name="studentselect" id="studentselect">
                            <option value="" selected disabled>--Choisissez un étudiant--</option>
                            <% for(Etudiant e : (Set<Etudiant>) session.getAttribute("listEtudiant")){ %>
                              <option value="<%= e.getId() %>">
                                <%= e.getNom() + " " +e.getPrenom() %>
                              </option>
                              <% } %>
                          </select>
                        </div>

                        <div class="form-group col-6">
                          <label for="courseselect">Choisir une matière:</label>

                          <select name="courses" id="courseselect">
                            <option value="" selected disabled>-- Matière --</option>
                            <% for(Matiere c : (Set<Matiere>) session.getAttribute("listCourse")){ %>
                              <option value="<%= c.getId() %>">
                                <%= c.getLibelle() %>
                              </option>
                              <% } %>

                          </select>
                        </div>

                        <div class="form-group col-6">
                          <label for="noteselect">Choisir une note:</label>

                          <select name="noteselect" id="noteselect">
                            <option value="note" selected disabled> -- Note --</option>
                            <% for(int i=0; i<=20; i++){ %>
                              <option value="<%= i %>">
                                <%= i %>
                              </option>
                              <% } %>
                          </select>
                        </div>


                        <div class="form_error col-12">
                          <% if (request.getAttribute("info") !=null) {%>
                          <p id="form_info_text">${info}</p>
                          <% request.removeAttribute("info"); } %>
                        </div>

                          <div class="form_input col-12 ">
                            <a href="addNote"><button class="btn btn-primary submit-btn" formmethod="POST" type="submit" id="button" name="button" value="">Envoyer</button></a>
                          </div>




                      </div>


                    </form>
                  </div>

                </div>

                <div class="col-4 d-none d-lg-block"></div>

              </div>
              </div>
            </main>
          </body>

          </html>