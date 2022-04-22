package control;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Building;
import model.DAO;
import model.Depot;
import model.Reservation;
import model.User;
import model.Vehicule;

/**
 * Servlet implementation class ViewAgencyDepots
 */
@WebServlet("/ViewAgencyDepots")
public class ViewAgencyDepots extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAgencyDepots() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			request.setAttribute("user", user);
			ArrayList<Building> Buildings = null;
			DAO dao = new DAO();
			Buildings = dao.getAgencyBuildings(user.getNom());

			request.setAttribute("Buildings", Buildings);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/AgencyBuildings.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			request.setAttribute("user", user);
			String depot = request.getParameter("depot");
			String agency = request.getParameter("agency");
			ArrayList<Vehicule> cars = null;
			DAO dao = new DAO();
			cars = dao.getAgencyCars(depot);
			request.setAttribute("cars", cars);
			request.setAttribute("depotcode", depot);
			request.setAttribute("agency", agency);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/AgencyCars.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
