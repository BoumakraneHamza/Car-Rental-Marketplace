package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.Depot;
import model.User;

/**
 * Servlet implementation class AjaxAddBuilding
 */
@WebServlet("/AjaxAddBuilding")
public class AjaxAddBuilding extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAddBuilding() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user.getType().equals("directeur")) {
			response.setContentType("application/xml");
			PrintWriter out = response.getWriter();
			
			ArrayList<Depot> buildings = null;
			DAO dao = new DAO();
			buildings = dao.getAgencyDepots(user.getNom());
			
			out.print("<building>\n");
			for(Depot build : buildings) {
				out.print("<depot>\n");
				out.print("<code>" + build.getCode()+ "</code>\n");
				out.print("<adress>" + build.getAdress() + "</adress>\n");
				out.print("<capacite>" + build.getCapacite() + "</capacite>\n");
				out.print("<capacite_libre>" + build.getCapacite_libre() + "</capacite_libre>\n");
				out.print("<agence_nom>" + build.getAgence_nom() + "</agence_nom>\n");
				out.print("<garagiste_email>" + build.getGaragiste_email() + "</garagiste_email>\n");
				out.print("<lat>" + build.getLat() + "</lat>\n");
				out.print("<lon>" + build.getLon() + "</lon>\n");
				out.print("<capacityPercentile>" + build.getCapacityPercentile() + "</capacityPercentile>\n");
				out.print("<bookings>" + build.getBookings() + "</bookings>\n");
				out.print("</depot>\n");
			}
			out.print("</building>");
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user.getType().equals("directeur")) {
			if (request.getParameter("type").equals("depot")) {
				DAO dao = new DAO();
				Depot depot = new Depot();
				
				depot.setAdress(request.getParameter("adress"));
				depot.setCapacite(Integer.parseInt(request.getParameter("capacity")));
				depot.setCapacite_libre(Integer.parseInt(request.getParameter("freeCapacity")));
				depot.setAgence_nom(request.getParameter("agencyName"));
				depot.setGaragiste_email(request.getParameter("garagisteEmail"));
				
				dao.addDepot(depot);
			} else {

			}
		}
		doGet(request, response);
	}

}
