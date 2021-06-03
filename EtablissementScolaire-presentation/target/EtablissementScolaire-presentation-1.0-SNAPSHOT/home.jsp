<%@ page import="eu.ensup.etablissementscolaire.Etudiant" %>
<%@ page import="java.util.Set" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="assets/css/style1.css" />
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title></title>
</head>
<body>
<div id="Boutons" class="btn" style="margin-left:17%!important; position: absolute; top: 40px">
    <a href="connexion.jsp">  <button formmethod="get" type="submit" class="btn btn-primary btn-form col-12">Deconnexion</button> </a>
    <a href="listEtudiantServlet">  <button formmethod="get" type="submit" class="btn btn-primary btn-form col-12">Lister les étudiants</button> </a>
    <a href="index.jsp">  <button formmethod="get" type="submit" class="btn btn-primary btn-form col-12">Ajouter un etudiant </button> </a>
    <a href="ajoutCours.jsp">  <button formmethod="get" type="submit" class="btn btn-primary btn-form col-12">Ajouter des cours</button> </a>
    <a href="ListeCours">  <button formmethod="get" type="submit" class="btn btn-primary btn-form col-12">Cours</button> </a>
    <a href="setCourse">  <button formmethod="get" type="submit" class="btn btn-primary btn-form col-12">etudiant & cours </button> </a>
    <a href="Statistiques.jsp">  <button formmethod="get" type="submit" class="btn btn-primary btn-form col-12">Stats</button> </a>

</div>
</body>

</div><!-- /.container -->
</body>
</html>