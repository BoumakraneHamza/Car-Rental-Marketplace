package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.DAO;
import model.Reservation;
import model.User;
import model.Vehicule;

/**
 * Servlet implementation class GaragisteBookings
 */
@WebServlet("/GaragisteBookings")
public class GaragisteBookings extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GaragisteBookings() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user.getType().equals("depot manager")) {
			DAO dao = new DAO();
			ArrayList<Reservation> reservations = null;
			
			reservations = dao.getDepotReservations(user.getEmployement().getWorkingLocation());
			request.setAttribute("reservations", reservations);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/GaragisteBookings.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Login");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user.getType().equals("depot manager")) {
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			DAO dao = new DAO();
			ObjectMapper mapper = new ObjectMapper();
			ArrayList<Reservation> reservationList = null;
			
			reservationList = dao.getDepotReservations(user.getEmployement().getWorkingLocation(), request.getParameter("rangeStart"), request.getParameter("rangeEnd"));
			String reservations = mapper.writeValueAsString(reservationList);
			
			out.print(reservations);
			out.flush();
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Login");
			dispatcher.forward(request, response);
		}
	}

}
