package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.User;
import model.Vehicule;

/**
 * Servlet implementation class GaragisteCar
 */
@WebServlet("/GaragisteCars")
public class GaragisteCars extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GaragisteCars() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user.getType().equals("garagiste")) {
			request.setAttribute("user", user);
			ArrayList<Vehicule> cars = null;
			DAO dao = new DAO();
			cars = dao.getDepotCars(user.getGaragisteInfo().getWorkingLocation());
			String depot = user.getGaragisteInfo().getWorkingLocation();
			request.setAttribute("cars", cars);
			request.setAttribute("depotcode", depot);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/GaragisteCars.jsp");
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
