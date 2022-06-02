package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			String url = "";
			
			if (user.getType().equals("client")) {
				request.setAttribute("status", request.getAttribute("status"));
				RequestDispatcher dispatcher = request.getRequestDispatcher("CarSearch");
				dispatcher.forward(request, response);
			} else if (user.getType().equals("directeur")) {
				url = url + "/Atelier/";
				url = url + "AgencyDashboard"; 
				response.sendRedirect(url);
			} else if(user.getType().equals("service_client")){
				url = url + "/Atelier/";
				url = url + "jsp/ServiceClientDashboard.jsp";
				response.sendRedirect(url);
			} else if(user.getType().equals("depot manager") || user.getType().equals("secretary")) {
				url = url + "/Atelier/";
				url = url + "ProfileStateManager";
				response.sendRedirect(url);
			} else if(user.getType().equals("owner")) {
				url = url + "/Atelier/OwnerDashboard";
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
