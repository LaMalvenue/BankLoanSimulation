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
    <title>Crédit bancaire</title>

    <!-- CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-header">Simulation du crédit</div>
        <div class="card-body">
            <form action="calculerMensualite.fr" method="post">
                <div class="form-group">
                    <label>Montant :</label>
                    <input type="number" name="montant" value="<%= model.getMontant() %>">€
                </div>
                <div class="form-group">
                    <label>Taux :</label>
                    <input type="number" name="taux" value="<%= model.getTaux() %>">%
                </div>
                <div class="form-group">
                    <label>Durée :</label>
                    <input type="number" name="duree" value="<%= model.getDuree() %>">mois
                </div>
                <button class="btn btn-primary" type="submit">Soumettre</button>
            </form>
        </div>
        <div class="card-footer">
            <p>Mensualité = <%= df.format(model.getMensualite()) %>€</p>
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