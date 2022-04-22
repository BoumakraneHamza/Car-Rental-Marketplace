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
import model.User;
import model.request;

/**
 * Servlet implementation class ServiceClient
 */
@WebServlet("/ServiceClient")
public class ServiceClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceClient() {
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
			ArrayList<request> requests = dao.GetRequests();
			request.setAttribute("requests", requests);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/ServiceClientDashboard.jsp");
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
			DAO dao = new DAO();
			if(request.getParameterMap().containsKey("request_id")) {
				dao.RespondToRequest(request.getParameter("request_id"));
			}else {
				System.out.println("request not found");
			}
		}
	}

}
