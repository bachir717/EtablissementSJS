<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Page de connection etablissement</title>

        <meta name="description" content="texte">
        <meta name="robots" content="connexion,follow">
        <meta name="keywords" content="mots clés">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
                       <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                       <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                       <script type="text/javascript" src="assets/js/script.js" defer> </script>
                       <link rel="stylesheet" type="text/css" href="assets/css/StyleCon.css" />
    </head>
    <body >

        <form class="center" action="ConnectionServ" method="POST">
        <div class="row"><image src="https://ensup.eu/wp-content/uploads/2020/01/ensitech-noir-baseline-1-300x106.png" style="margin-left: 100px;"/></div>
        <div class="row">
            <div class="col-md-6 mx-auto p-0">
                <div class="card">
                    <div class="login-box">
                        <div class="login-snip"> <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Login</label> <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
                            <div class="login-space">
                                <div class="login">
                                    <div class="group"> <label for="user" class="label">Email</label> <input name="emailE" id="email" type="text" class="input" placeholder="Enter votre mail"> </div>
                                    <div class="group"> <label for="pass" class="label">Mot de passe</label> <input name="passwordE" id="password" type="password" class="input" data-type="password" placeholder="Enter votre mot de passe"> </div>
                                    <div class="group"> <input id="check" type="checkbox" class="check" checked> <label for="check"><span class="icon"></span> Garder ma session ouverte</label> </div>
                                    <div class="group"> <input type="submit" class="button" value="Connectez-vous"> </div>
                                    <div class="hr"></div>
                                    <div class="foot"> <a href="#">Mot de passe oublier?</a> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </body>
</html>