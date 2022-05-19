package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

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
			    filter.setPickUp_date(request.getParameter("pickUp_date"));
			    filter.setReturn_date(request.getParameter("return_date"));
			    //long daysBetween =ChronoUnit.DAYS.between(date2, date1);
				if(user != null) {
					dao.UpdateRecentSearch(filter, user.getEmail());
					vehicules = dao.carSearch(filter);
				    int size = vehicules.size();
				    depots = dao.getDepots(filter.getLocation());
				    ObjectMapper mapper = new ObjectMapper();
				    PrintWriter out = response.getWriter();
				    String vehiculesString = mapper.writeValueAsString(vehicules);
				    String depot = mapper.writeValueAsString(depots);
				    out.write("["+vehiculesString+","+depot+","+size+"]");
				}else {
					vehicules = dao.carSearch(filter);
				    depots = dao.getDepots(filter.getLocation());
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
