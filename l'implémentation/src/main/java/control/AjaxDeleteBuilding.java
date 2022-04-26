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
import model.Employee;
import model.User;

/**
 * Servlet implementation class AjaxDeleteBuilding
 */
@WebServlet("/AjaxDeleteBuilding")
public class AjaxDeleteBuilding extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxDeleteBuilding() {
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
			
			out.println("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
			out.println("<buildings>");
			for(Building build : buildings) {
				out.print("<" + build.getType() + " ");
				out.append("code=\"" + build.getCode() + "\" ");
				out.append("adress=\"" + build.getAdress() + "\" ");
				out.append("agence_nom=\"" + build.getAgence_nom() + "\" ");
				out.append("garagiste_email=\"" + build.getEmployee_email() + "\" ");
				out.append("lat=\"" + build.getLat() + "\" ");
				out.append("lon=\"" + build.getLon() + "\" ");
				out.append("bookings=\"" + build.getBookings() + "\" ");
				if (build.getType().equals("depot")) {
					out.append("capacite=\"" + ((Depot) build).getCapacite() + "\" ");
					out.append("capacite_libre=\"" + ((Depot) build).getCapacite_libre() + "\" ");
					out.append("capacityPercentile=\"" + ((Depot) build).getCapacityPercentile() + "\" ");
				}
				try {
					out.append("employeeFirstName=\"" + build.getEmployee().getFirstName() + "\" ");
					out.append("employeeType=\"" + build.getEmployee().getType() + "\" ");
					out.append("employeeImage=\"" + build.getEmployee().getImage() + "\" ");
				} catch (Exception e) {
					out.append("employeeFirstName=\"" + "\" ");
					out.append("employeeType=\"" + "\" ");
					out.append("employeeImage=\"" + "\" ");
				}
				out.println("/>");
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
			DAO dao = new DAO();
			
			dao.deleteBuilding(request.getParameter("code"), request.getParameter("type"));
		}
		doGet(request, response);
	}

}
