<%@ page import="eu.ensup.etablissementscolaire.Etudiant" %>
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
    <link rel="stylesheet" type="text/css" href="assets/css/StyleListeCours.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css "/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/app.js" defer> </script>
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
<div class="container" style="margin-top: 200px; margin-left: 400px;">
    <div class="row">
        <div class="col-md-offset-1 col-md-10">
            <div class="panel">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-sm-3 col-xs-12">
                            <h4 class="title">Etudiant <span>List</span></h4>
                        </div>
                    </div>
                </div>
                <div class="panel-body table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                 <th scope="col">Prénom</th>
                                 <th scope="col">Nom</th>
                                 <th scope="col">E-mail</th>
                            </tr>
                        </thead>
                        <tbody>
                         <%
                          for(Etudiant e : (Set<Etudiant>) session.getAttribute("listEtudiants")){
                         %>
                             <tr>
                                 <td><%= e.getId()%></td>
                                <td><%= e.getNom()%></td>
                                <td><%= e.getPrenom()%></td>
                                <td><%= e.getEmail()%></td>
                              <td>
                                <ul class="action-list">
                                  <%--<<a href="EditerEtudiantServ?id=<c:out value='${e.getId()}' />">Edit</a>--%>
                                   <li><a href="EditerEtudiants.jsp" data-tip="edit"><i class="fa fa-edit"></i></a></li>
                                  <%--<li><a href="#" data-tip="delete"><i class="fa fa-trash"></i></a></li>--%>
                                  <%--<<li><a href="delete?Id=<c:out value='${e.getId()}' />"><i class="fa fa-trash"></i></a></li>--%>
                                  <%--<li><a href="EditeEtudiant?id=<%=e.getId()%>"><i class="fa fa-edit"></i></a></li>--%>
                                  <li><a href="delete?id=<%=e.getId()%>"><i class="fa fa-trash"></i></a></li>
                                </ul>
                               </td>
                            </tr>
                          <%
                            }
                          %>

                        </tbody>
                    </table>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col col-sm-6 col-xs-6">showing <b>5</b> out of <b>25</b> entries</div>
                        <div class="col-sm-6 col-xs-6">
                            <ul class="pagination hidden-xs pull-right">
                                <li><a href="#"><</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">></a></li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
       <div class="scons" style=" margin-top:30px;">
                      <a href="home.jsp"><button formmethod="post" type="submit" class="btn btn-block create-account" style="width:150px;">Retour</button> </a>
       </div>
</div>
</body>
</html>