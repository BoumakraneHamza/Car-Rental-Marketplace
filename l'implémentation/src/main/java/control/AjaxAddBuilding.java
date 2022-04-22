package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Building;
import model.DAO;
import model.Depot;
import model.Office;
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
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			ArrayList<Building> buildings = null;
			DAO dao = new DAO();
			buildings = dao.getAgencyBuildings(user.getNom());
			
			out.print("<buildings>\n");
			for(Building build : buildings) {
				out.print("<"+build.getType()+">\n");
				out.print("<code>" + build.getCode()+ "</code>\n");
				out.print("<adress>" + build.getAdress() + "</adress>\n");
				out.print("<agence_nom>" + build.getAgence_nom() + "</agence_nom>\n");
				out.print("<garagiste_email>" + build.getEmployee_email() + "</garagiste_email>\n");
				out.print("<lat>" + build.getLat() + "</lat>\n");
				out.print("<lon>" + build.getLon() + "</lon>\n");
				out.print("<bookings>" + build.getBookings() + "</bookings>\n");
				if (build.getType().equals("depot")) {
					out.print("<capacite>" + ((Depot) build).getCapacite() + "</capacite>\n");
					out.print("<capacite_libre>" + ((Depot) build).getCapacite_libre() + "</capacite_libre>\n");
					out.print("<capacityPercentile>" + ((Depot) build).getCapacityPercentile() + "</capacityPercentile>\n");
				}
				out.print("<employeeFirstName>" + build.getEmployee().getFirstName() + "</employeeFirstName>\n");
				out.print("<employeeType>" + build.getEmployee().getType() + "</employeeType>\n");
				out.print("<employeeImage>" + build.getEmployee().getImage() + "</employeeImage>\n");
				out.print("</"+build.getType()+">\n");
			}
			out.print("</buildings>");
			
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
				DAO dao = new DAO();
				Office office = new Office();
				
				office.setAdress(request.getParameter("adress"));
				office.setAgence_nom(request.getParameter("agencyName"));
				office.setSecretary_email(request.getParameter("secretaryEmail"));
				
				dao.addOffice(office);
			}
		}
		doGet(request, response);
	}

}
