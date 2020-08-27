package web;

import metier.CreditMetierImpl;
import metier.ICreditMetier;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="cs", urlPatterns={"/controller", "*.fr"})

public class ServletController extends HttpServlet {

    private ICreditMetier metier;

    @Override
    public void init() throws ServletException {
        metier = new CreditMetierImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("credit", new CreditModel());
        req.getRequestDispatcher("VueCredit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /* Lire les données de la requete */
        double montant = Double.parseDouble(req.getParameter("montant"));
        double taux = Double.parseDouble(req.getParameter("taux"));
        int duree = Integer.parseInt(req.getParameter("duree"));

        /* Valider et stocker les données */
        CreditModel model = new CreditModel();
        model.setMontant(montant);
        model.setTaux(taux);
        model.setDuree(duree);

        /* Faire appel à la couche métier pour faire les traitements */
        double resultat = metier.calculerMensualiteCredit(montant, taux, duree);

        /* Stocker le resultat dans le modele */
        model.setMensualite(resultat);

        /* Stocker le modele dans l'objet request */
        req.setAttribute("credit", model);

        /* Faire un forward vers la vue JSP */
        req.getRequestDispatcher("VueCredit.jsp").forward(req, resp);
    }
}
