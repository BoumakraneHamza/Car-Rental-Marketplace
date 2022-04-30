package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.CreditCards;
import model.DAO;
import model.InboxReturn;
import model.Reservation;
import model.User;

/**
 * Servlet implementation class Dashboard
 */
@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dashboard() {
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
			DAO dao = new DAO();
			String url = "/";
			
			if (user.getType().equals("client")) {
				url = url + "jsp/ClientDashboard.jsp";
				CreditCards card = null;
				//this code attribute is used in case of returning from the booking process
				//trying to extend the status attribute to the jsp page
				System.out.println(request.getAttribute("status"));
				System.out.println("status is read");
				request.setAttribute("status", request.getAttribute("status"));
				InboxReturn inbox = new InboxReturn();
				inbox = dao.getRecievedMessages(user.getEmail());
				request.setAttribute("conversation", inbox.conversation);
				request.setAttribute("counter", inbox.NotReadMessages);
				Random rand = new Random();
				Integer random = rand.nextInt(25);
				request.setAttribute("random", random);
				try {
					card = dao.getDefaultCard(user.getEmail());
				} catch (InstantiationException | IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("card", card);
			} else if (user.getType().equals("directeur")) {
				url = url + "jsp/AgencyDashboard.jsp"; 
			} else if(user.getType().equals("service_client")){
				url = url + "jsp/ServiceClientDashboard.jsp";
			} else if(user.getType().equals("garagiste")) {
				url = url + "jsp/GaragisteDashboard.jsp";
				ObjectMapper mapper = new ObjectMapper();
				HashMap<String, Integer> stat = null;
				ArrayList<Reservation> reservations = dao.getDepotReservations(user.getGaragisteInfo().getWorkingLocation(), true, 5);
				request.setAttribute("reservations", reservations);
				
				stat = dao.depotCarStatByMarque(user.getGaragisteInfo().getWorkingLocation());
				String stat1 = mapper.writeValueAsString(stat);
				request.setAttribute("stat1", stat1);
				
				stat = dao.depotCarStatByRating(user.getGaragisteInfo().getWorkingLocation());
				String stat3 = mapper.writeValueAsString(stat);
				request.setAttribute("stat3", stat3);
			} else if(user.getType().equals("secretaire")) {
				url = url + "SecretaryDashboard";
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
