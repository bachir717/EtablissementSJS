<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Test html css</title>
        <link rel="stylesheet" type="text/css" href="assets/css/style1.css" />
        <meta name="description" content="texte">
        <meta name="robots" content="index,follow">
        <meta name="keywords" content="mots clés">
        <script type="text/javascript" src="assets/js/script.js" defer> </script>
    </head>
    <body style="background-color:#7F8084!important; background-image:none!important;">
        le cours  a été créer avec succès !
        <p>
            Theme : ${ cours.theme } <br/>
            Nombre D heurs : ${ cours.nbHeures } <br/>
        </p>
            <div id="Boutons">
                <a href="listEtudiantServlet">  <button formmethod="get" type="submit" class="btn btn-primary btn-form col-12">Lister des étudiants </button> </a>
            </div>
    </body>

</html>