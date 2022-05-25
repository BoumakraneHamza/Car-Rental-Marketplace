package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.CarFilter;
import model.DAO;
import model.Depot;
import model.User;
import model.Vehicule;

/**
 * Servlet implementation class CarSearch
 */
@WebServlet("/CarSearch")
public class CarSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null && user.getType().equals("client")) {
			request.setAttribute("status", request.getAttribute("status"));
			request.setAttribute("user", user);
			DAO dao = new DAO();
			ArrayList<Vehicule> carList = new ArrayList<Vehicule>();
			CarFilter filter = dao.GetCarFilters(user.getEmail());
			if(filter != null) {
				try {
					carList = dao.carSearch(filter);
				} catch (InstantiationException | IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				filter.setPickUp_date(filter.getPickUp_date());
				filter.setReturn_date(filter.getReturn_date());
				request.setAttribute("filters", filter);
				request.setAttribute("vehicules", carList);
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/ClientMainPage.jsp");
			dispatcher.forward(request, response);
		}else if(user != null && user.getType().equals("secretaire")) {
			request.setAttribute("user", user);
			
			request.setAttribute("client_password", request.getParameter("password"));
			request.setAttribute("client_email", request.getParameter("email"));
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/ClientMainPage.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/ClientMainPage.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAO dao = new DAO();
		User user = (User) request.getSession().getAttribute("user");
		CarFilter filter = new CarFilter();
		ArrayList<Vehicule> vehicules;
		ArrayList<Depot> depots;
		try {
			if(request.getParameterMap().containsKey("location")) {
				filter.setLocation(request.getParameter("location"));
				filter.setLocation_LAT(request.getParameter("location_LAT"));
				filter.setLocation_Lon(request.getParameter("location_LON"));
			    filter.setPickUp_date(request.getParameter("pickUp_date"));
			    filter.setReturn_date(request.getParameter("return_date"));
				if(user != null) {
					dao.UpdateRecentSearch(filter, user.getEmail());
					vehicules = dao.carSearch(filter);
					
					//Regroup the vehicle list so that the vehicles
					//from the same depot are grouped together;
					
					Map<List<String>,ArrayList<Vehicule>> sortedVehicules = new HashMap<List<String>,ArrayList<Vehicule>>();
					for(Vehicule vehicule : vehicules) {
						String[] arr = {vehicule.getDepot_code() , vehicule.getAgence()};
						List<String> key = Arrays.asList(arr);
						if(!sortedVehicules.containsKey(key)) {
							ArrayList<Vehicule> vl = new ArrayList<Vehicule>();
							vl.add(vehicule);
							sortedVehicules.put(key, vl);
						}else {
							sortedVehicules.get(key).add(vehicule);
						}
					}
				    int size = vehicules.size();
				    depots = dao.getDepots(sortedVehicules);
				    ObjectMapper mapper = new ObjectMapper();
				    PrintWriter out = response.getWriter();
				    String vehiculesString = mapper.writeValueAsString(vehicules);
				    String depot = mapper.writeValueAsString(depots);
				    out.write("["+vehiculesString+","+depot+","+size+"]");
				}else {
					vehicules = dao.carSearch(filter);
					
					//Regroup the vehicle list so that the vehicles
					//from the same depot are grouped together;
					
					Map<List<String>,ArrayList<Vehicule>> sortedVehicules = new HashMap<List<String>,ArrayList<Vehicule>>();
					for(Vehicule vehicule : vehicules) {
						String[] arr = {vehicule.getDepot_code() , vehicule.getAgence()};
						List<String> key = Arrays.asList(arr);
						if(!sortedVehicules.containsKey(key)) {
							ArrayList<Vehicule> vl = new ArrayList<Vehicule>();
							vl.add(vehicule);
							sortedVehicules.put(key, vl);
						}else {
							sortedVehicules.get(key).add(vehicule);
						}
					}
				    depots = dao.getDepots(sortedVehicules);
				    request.setAttribute("filters", filter);
					request.setAttribute("vehicules", vehicules);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/ClientMainPage.jsp");
					dispatcher.forward(request, response);
				}
			    //request.setAttribute("duration", daysBetween);
			}else {
				doGet(request, response);
			}
		} catch (InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
