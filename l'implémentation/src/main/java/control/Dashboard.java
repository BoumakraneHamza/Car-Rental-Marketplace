package control;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CreditCards;
import model.DAO;
import model.InboxReturn;
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
			String url = "";
			
			if (user.getType().equals("client")) {
				url = url + "/";
				url = url + "jsp/ClientDashboard.jsp";
				CreditCards card = null;
				//this code attribute is used in case of returning from the booking process
				//trying to extend the status attribute to the jsp page
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
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
			} else if (user.getType().equals("directeur")) {
				url = url + "/Atelier/";
				url = url + "jsp/AgencyDashboard.jsp"; 
				response.sendRedirect(url);
			} else if(user.getType().equals("service_client")){
				url = url + "/Atelier/";
				url = url + "jsp/ServiceClientDashboard.jsp";
				response.sendRedirect(url);
			} else if(user.getType().equals("depot manager") || user.getType().equals("secretary")) {
				url = url + "/Atelier/";
				url = url + "ProfileStateManager";
				response.sendRedirect(url);
			}
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
