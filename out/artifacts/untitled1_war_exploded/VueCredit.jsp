<%@ page pageEncoding="UTF-8" %>
<%@ page import="web.CreditModel" %>
<%
    CreditModel model = (CreditModel) request.getAttribute("credit");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crédit bancaire</title>
</head>
<body>
<div>
    <form action="calculerMensualite.fr" method="post">
        <table>
            <tr>
                <td>Montant :</td>
                <td><input type="number" name="montant" value="<%= model.getMontant() %>"></td>
                <td>€</td>
            </tr>
            <tr>
                <td>Taux :</td>
                <td><input type="number" name="taux" value="<%= model.getTaux() %>"></td>
                <td>%</td>
            </tr>
            <tr>
                <td>Durée :</td>
                <td><input type="number" name="duree" value="<%= model.getDuree() %>"></td>
                <td>mois</td>
            </tr>
        </table>
        <button type="submit">Soumettre</button>
    </form>
</div>
<div>
    <p>Mensualité = <%= model.getMensualite() %>€</p>
</div>
</body>
</html>