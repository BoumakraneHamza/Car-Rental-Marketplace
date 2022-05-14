package control;

import java.io.IOException;

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

/**
 * Servlet implementation class ViewCar
 */
@WebServlet("/ViewCar")
public class ViewCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null ) {
			String matricule = request.getParameter("car");
			CarFilter filter = new CarFilter();
			filter.setPickUp_date(request.getParameter("pickUp_date"));
			filter.setReturn_date(request.getParameter("return_date"));
			filter.setPickUp_hour(request.getParameter("pickUp_hour"));
			filter.setReturn_hour(request.getParameter("return_hour"));
			filter.setLocation(request.getParameter("location"));
			DAO dao = new DAO();
			Vehicule vehicule = dao.getVehicule(matricule);
			request.setAttribute("vehicule", vehicule);
			request.setAttribute("filter", filter);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/viewCar.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
