package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CarFilter;
import model.DAO;
import model.User;
import model.Vehicule;

/**
 * Servlet implementation class AjaxAddCar
 */
@WebServlet("/AjaxAddCar")
public class AjaxAddCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAddCar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null && user.getType().equals("directeur")) {
			response.setContentType("application/xml");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			String depot = request.getParameter("depot");
			ArrayList<Vehicule> vehicules = null;
			DAO dao = new DAO();
			vehicules = dao.getAgencyCars(depot , user.getNom());
			
			out.print("<cars>\n");
			for(Vehicule car : vehicules) {
				out.print("<car>\n");
				out.print("<matricule>" + car.getMatricule()+ "</matricule>\n");
				out.print("<marque>" + car.getMarque() + "</marque>\n");
				out.print("<modele>" + car.getModele() + "</modele>\n");
				out.print("<PLJ>" + car.getPLJ() + "</PLJ>\n");
				out.print("<PLH>" + car.getPLH() + "</PLH>\n");
				out.print("<type>" + car.getType() + "</type>\n");
				out.print("<image>" + car.getImage() + "</image>\n");
				out.print("<depot_code>" + car.getDepot_code() + "</depot_code>\n");
				out.print("<agence>" + car.getAgence() + "</agence>\n");
				out.print("<color>" + car.getColor() + "</color>\n");
				out.print("<year>" + car.getYear() + "</year>\n");
				out.print("<averageRating>" + car.getAverageRating() + "</averageRating>\n");
				out.print("</car>\n");
			}
			out.print("</cars>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user.getType().equals("directeur")) {
				DAO dao = new DAO();
				Vehicule vehicule = new Vehicule();
				
				vehicule.setMatricule(request.getParameter("matricule"));
				vehicule.setMarque(request.getParameter("marque"));
				vehicule.setModele(request.getParameter("modele"));
				vehicule.setPLJ(Double.parseDouble(request.getParameter("PLJ")));
				vehicule.setPLH(Double.parseDouble(request.getParameter("PLH")));
				vehicule.setType(request.getParameter("type"));
				//vehicule.setImage(request.getParameter("image")); TODO later
				vehicule.setDepot_code(request.getParameter("depot"));
				vehicule.setYear(Integer.parseInt(request.getParameter("year")));
				vehicule.setColor(request.getParameter("color"));
				//vehicule.set(request.getParameter(""));
				
				dao.addVehicule(vehicule);
		}
		doGet(request, response);
	}

}
