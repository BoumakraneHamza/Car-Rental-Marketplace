package control;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
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
import model.search;

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
		if (request.getSession().getAttribute("user") != null) {
			request.setAttribute("user", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/carSearch.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/Search.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAO dao = new DAO();
		CarFilter filter = new CarFilter();
		ArrayList<Vehicule> vehicules;
		search searchInput = new search();
		try {
			filter.setLocation(request.getParameter("location"));
			searchInput.setLocation(request.getParameter("location"));
			filter.setPickUp_date(request.getParameter("pickUp_date"));
			searchInput.setDate_1(request.getParameter("pickUp_date"));
			filter.setReturn_date(request.getParameter("return_date"));
			searchInput.setDate_2(request.getParameter("return_date"));
			filter.setPickUp_hour(request.getParameter("pickUp_hour"));
			searchInput.setHour_1(request.getParameter("pickUp_hour"));
			System.out.println(searchInput.getHour_1());
			filter.setReturn_hour(request.getParameter("return_hour"));
			searchInput.setHour_2(request.getParameter("return_hour"));
			
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate date1 = LocalDate.parse(searchInput.getDate_2(), dtf);
		    LocalDate date2 = LocalDate.parse(searchInput.getDate_1(), dtf);
		    
		    long daysBetween =ChronoUnit.DAYS.between(date2, date1);
			
		    vehicules = dao.carSearch(filter);
		    request.setAttribute("duration", daysBetween);
			request.setAttribute("searchInput", searchInput);
			request.setAttribute("vehicules", vehicules);
			
		} catch (InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
