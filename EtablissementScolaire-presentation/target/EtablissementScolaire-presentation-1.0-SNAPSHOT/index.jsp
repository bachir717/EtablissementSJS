<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Test html css</title>
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/StyleAddEt.css" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <meta name="description" content="texte">
        <meta name="robots" content="index,follow">
        <meta name="keywords" content="mots clés">
        <script type="text/javascript" src="assets/js/script.js" defer> </script>
        <script type="text/javascript" src="assets/js/ScriptAddEt.js" defer> </script>
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
        <div class="registration-form">
            <form class="center" method="POST" action="/etablissement/FormServlet" >

                <div class="form-group">
                    <input type="text" class="form-control item" name="nomE" id="nom"  placeholder="Nom">
                </div>
                  <div class="form-group">
                     <input type="text" class="form-control item" name="prenomE" id="prenom"  placeholder="Prenom">
                   </div>

                <div class="form-group">
                     <input type="text" class="form-control item" name="adresseE" id="adresse"  placeholder="Adresse">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control item" name="passwordE" id="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control item" name="emailE" id="email"  placeholder="Email">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control item" name="phoneE" id="phone" placeholder="Numero de Telephone">
                </div>
                <div class="form-group">
                    <input type="date" class="form-control item" name="ddnE" id="ddn" placeholder="Birth Date">
                </div>
                <div class="form-group">
                    <button class="btn btn-block create-account" type="submit"  formmethod="post">Ajouter un etudiant</button>
                </div>
            </form>
            <div class="social-media">
              <h5>Ajouter un cours à partir de </h5>
              <div class="scons">
                  <a href="#"><image src="https://ensup.eu/wp-content/uploads/2019/10/inscripzztion2-150x150.png" style="width: 50px!important; height: 50px!important; margin-right:20px;"/></a>
                  <a href="#"><image src="https://ensup.eu/wp-content/uploads/2019/10/proc%C3%A9azdureB2-150x150.png" style="width: 50px!important; height: 50px!important;"/></a>
               </div>
              <div class="scons" style="margin-left:230px;">
                  <a href="home.jsp"><button formmethod="post" type="submit" class="btn btn-block create-account" style="width:150px;">Retour</button> </a>
              </div>
            </div>
        </div>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
</html>