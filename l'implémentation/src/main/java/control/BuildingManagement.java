package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.Building;
import model.DAO;
import model.Depot;
import model.Employee;
import model.Office;
import model.User;

/**
 * Servlet implementation class AjaxDeleteBuilding
 */
@WebServlet("/BuildingManagement")
public class BuildingManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuildingManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null && user.getType().equals("directeur")) {
			DAO dao = new DAO();
			if(request.getParameter("required_action").equals("getAvailableEmployees")) {
				ArrayList<Employee> Employees = new ArrayList<Employee>();
				Employees = dao.getAvailableEmployees(user.getNom(),request.getParameter("type"));
				ObjectMapper mapper = new ObjectMapper();
				String EmployeeList = mapper.writeValueAsString(Employees);
				PrintWriter out = response.getWriter();
				out.write(EmployeeList);
			}else if(request.getParameter("required_action").equals("getBuildingInfo")) {
				System.out.println("entered");
				Building building = new Building();
				building = dao.getBuilding(request.getParameter("code"),request.getParameter("type"),user.getNom());
				ObjectMapper mapper = new ObjectMapper();
				String RequestedBuilding = mapper.writeValueAsString(building);
				PrintWriter out = response.getWriter();
				out.write(RequestedBuilding);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		int result = 0;
		DAO dao = new DAO();
		if (user != null && user.getType().equals("directeur")) {
			if(request.getParameter("required_action").equals("delete")) {
				result = dao.deleteBuilding(request.getParameter("code"), request.getParameter("type"),request.getParameter("agence"));
			}
			else if(request.getParameter("required_action").equals("add")) {
				if (request.getParameter("type").equals("Depot")) {
					Depot depot = new Depot();
					
					depot.setAdress(request.getParameter("address"));
					depot.setCapacite(Integer.parseInt(request.getParameter("capacity")));
					depot.setCapacite_libre(Integer.parseInt(request.getParameter("capacity")));
					depot.setAgence_nom(user.getNom());
					depot.setLat(request.getParameter("lat"));
					depot.setLon(request.getParameter("lon"));
					
					result = dao.addDepot(depot);
				} else {
					Office office = new Office();
					
					office.setAdress(request.getParameter("address"));
					office.setAgence_nom(user.getNom());
					office.setLat(request.getParameter("lat"));
					office.setLon(request.getParameter("lon"));
					
					result = dao.addOffice(office);
				}
			}else if(request.getParameter("required_action").equals("edit")) {
				Building building;
				if (request.getParameter("type").equals("depot")) {
					building = new Depot();
					((Depot)building).setCapacite(Integer.parseInt(request.getParameter("capacity")));
				} else {
					building = new Office();
				}
				building.setAgence_nom(user.getNom());
				building.setCode(request.getParameter("code"));
				building.setType(request.getParameter("type"));
				building.setAdress(request.getParameter("address"));
				building.setEmployee_email(request.getParameter("employeeEmail"));
				building.setLat(request.getParameter("lat"));
				building.setLon(request.getParameter("lon"));
								
				result = dao.editBuilding(building);
			}
			if(result == 1) {
				response.setStatus(200);
			}else {
				response.setStatus(500);
			}
		}else {
			response.setStatus(500);
		}
		
	}

}
