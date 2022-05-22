package control;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

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
		CarFilter filter = new CarFilter();
		String matricule = null;
		if(request.getParameterMap().containsKey("car")) {
			matricule = request.getParameter("car");
			filter.setPickUp_date(request.getParameter("pickUp_date"));
			filter.setReturn_date(request.getParameter("return_date"));
			filter.setLocation(request.getParameter("location"));
		}else {
			matricule = (String) request.getAttribute("car");
			filter.setPickUp_date((String) request.getAttribute("pickUp_date"));
			filter.setReturn_date((String) request.getAttribute("return_date"));
			filter.setLocation((String) request.getAttribute("location"));
		}
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate date1 = LocalDate.parse(filter.getPickUp_date(), dtf);
	    LocalDate date2 = LocalDate.parse(filter.getReturn_date(), dtf);
	    long daysBetween = ChronoUnit.DAYS.between(date1, date2);
		DAO dao = new DAO();
		Vehicule vehicule = dao.getVehicule(matricule);
		request.setAttribute("duration", daysBetween);
		request.setAttribute("price", daysBetween * vehicule.getPLJ());
		request.setAttribute("vehicule", vehicule);
		request.setAttribute("filter", filter);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/viewCar.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
