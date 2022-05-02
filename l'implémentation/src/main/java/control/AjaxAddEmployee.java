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
import model.User;

/**
 * Servlet implementation class AjaxAddEmployee
 */
@WebServlet("/AjaxAddEmployee")
public class AjaxAddEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAddEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if(user != null) {
			DAO dao = new DAO();
			ArrayList<Building> availableBuildings = null;
			String type = request.getParameter("type");
			availableBuildings = dao.getAvailableAgencyBuildings(user.getNom(),type);
			ObjectMapper mapper = new ObjectMapper();
			String buildings = mapper.writeValueAsString(availableBuildings).trim();
			PrintWriter out = response.getWriter();
			out.write(buildings);
			response.setStatus(200);
		}else {
			response.setStatus(500);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		DAO dao = new DAO();
		Employee employee = new Employee();
		String building = request.getParameter("location");
		building = building.replace("Depot", "");
		building = building.replace("Office", "");
		employee.setEmail(request.getParameter("email"));
		employee.setPassword(request.getParameter("password"));
		employee.setWorkingLocation(building);
		employee.setAgencyName(user.getNom());
		employee.setType(request.getParameter("type"));
		System.out.println(employee.getType());
		dao.addEmployee(employee);
		
	}
}
