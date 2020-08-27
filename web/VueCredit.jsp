<%@ page pageEncoding="UTF-8" %>
<%@ page import="web.CreditModel" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    CreditModel model = (CreditModel) request.getAttribute("credit");
    DecimalFormat df = new DecimalFormat("0.00");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" type="image/png" href="img/favicon.png">
    <title>Crédit bancaire</title>

    <!-- CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css" type="text/css">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Baloo+Tamma+2&display=swap" rel="stylesheet">
</head>
<body>

<header>
    <p class="logo"><span class="highlight">B</span>anque<br>des<br><span class="highlight">P</span>auvres</p>

    <div class="header">
        <h1>La <span class="highlight">B</span>anque des <span class="highlight">P</span>auvres</h1>
        <h6>La première banque spécialisée dans les crédits de pauvres</h6>
    </div>
</header>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4 left-side">
            <div class="left-side-content">
                <p>Trop pauvre pour réaliser vos projets ? </p>
                <p>La banque des Pauvres est là pour vous aider à financer votre
                    nouvelle voiture ou votre nouveau bien immobilier.</p>
            </div>
        </div>
        <div class="col-md-8 my-auto">
            <div class="col-lg-11 col-xl-8 mx-auto">
                <div class="card">
                    <div class="card-header">Simulation du crédit</div>
                    <div class="card-body">
                        <form action="calculerMensualite.fr" method="post">
                            <div class="form-group">
                                <label>Montant (en €) :</label>
                                <input class="form-control" type="number" name="montant" step=".01"
                                       value="<%= model.getMontant() %>">
                            </div>
                            <div class="form-group">
                                <label>Taux (en %) :</label>
                                <input class="form-control" type="number" name="taux" step=".01"
                                       value="<%= model.getTaux() %>">
                            </div>
                            <div class="form-group">
                                <label>Durée (en mois) :</label>
                                <input class="form-control" type="number" name="duree" value="<%= model.getDuree() %>">
                            </div>
                            <button class="btn btn-primary" type="submit">Calculer</button>
                        </form>
                    </div>
                    <div class="card-footer">
                        <p>Mensualité = <%= df.format(model.getMensualite()) %>€</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>

</body>
</html>