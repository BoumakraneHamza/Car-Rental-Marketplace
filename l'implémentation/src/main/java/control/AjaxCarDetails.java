package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.User;
import model.Vehicule;

/**
 * Servlet implementation class AjaxCarDetails
 */
@WebServlet("/AjaxCarDetails")
public class AjaxCarDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCarDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user.getType().equals("directeur")) {
			response.setContentType("application/xml");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			DAO dao = new DAO();
			Vehicule vehicule = dao.getVehicule(request.getParameter("matricule"));
			
			out.print("<car>\n");
			out.print("<matricule>" + vehicule.getMatricule() + "</matricule>\n");
			out.print("<marque>" + vehicule.getMarque() + "</marque>\n");
			out.print("<modele>" + vehicule.getModele() + "</modele>\n");
			out.print("<year>" + vehicule.getYear() + "</year>\n");
			out.print("<color>" + vehicule.getColor() + "</color>\n");
			out.print("<PLJ>" + vehicule.getPLJ() + "</PLJ>\n");
			out.print("<PLH>" + vehicule.getPLH() + "</PLH>\n");
			out.print("<image>" + vehicule.getImage() + "</image>\n");
			out.print("<seats>" + vehicule.getNumberSeats() + "</seats>\n");
			out.print("<doors>" + vehicule.getNumberDoors() + "</doors>\n");
			out.print("<suitcase>" + vehicule.getNumberSuitCase() + "</suitcase>\n");
			out.print("<mileage>" + vehicule.getMileage() + "</mileage>\n");
			out.print("<type>" + vehicule.getType() + "</type>\n");
			out.print("</car>\n");
		}
		
	}

}
