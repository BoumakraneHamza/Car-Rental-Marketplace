package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Building;
import model.DAO;
import model.Depot;
import model.User;

/**
 * Servlet implementation class AjaxBuildingDetails
 */
@WebServlet("/AjaxBuildingDetails")
public class AjaxBuildingDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxBuildingDetails() {
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
			
			Building building = null;
			DAO dao = new DAO();
			building = dao.getBuilding(request.getParameter("code"), request.getParameter("type"));
			
			out.println("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
			out.println("<buildings>");
			if(building != null) {
				out.print("<" + building.getType() + " ");
				out.append("code=\"" + building.getCode() + "\" ");
				out.append("adress=\"" + building.getAdress() + "\" ");
				out.append("agence_nom=\"" + building.getAgence_nom() + "\" ");
				out.append("employee_email=\"" + building.getEmployee_email() + "\" ");
				out.append("lat=\"" + building.getLat() + "\" ");
				out.append("lon=\"" + building.getLon() + "\" ");
				out.append("bookings=\"" + building.getBookings() + "\" ");
				if (building.getType().equals("depot")) {
					out.append("capacite=\"" + ((Depot) building).getCapacite() + "\" ");
					out.append("capacite_libre=\"" + ((Depot) building).getCapacite_libre() + "\" ");
					out.append("capacityPercentile=\"" + ((Depot) building).getCapacityPercentile() + "\" ");
				}
				try {
					out.append("employeeFirstName=\"" + building.getEmployee().getFirstName() + "\" ");
					out.append("employeeType=\"" + building.getEmployee().getType() + "\" ");
					out.append("employeeImage=\"" + building.getEmployee().getImage() + "\" ");
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
