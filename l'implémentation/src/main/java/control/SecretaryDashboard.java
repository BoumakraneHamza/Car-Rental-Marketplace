package control;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.User;

/**
 * Servlet implementation class SecretaryDashboard
 */
@WebServlet("/SecretaryDashboard")
public class SecretaryDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecretaryDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			HashMap<String,User> map = new HashMap<>();
			DAO dao = new DAO();
			map = dao.getUpcomingMeetings(user.getEmail(), "1");
			String counter = null;
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			request.setAttribute("map", map);
			int age = 0;
			for (String key : map.keySet()) {
				LocalDate BirthDate = LocalDate.parse(map.get(key).getDate_naissance(), formatter);
				age = Period.between(BirthDate, LocalDate.now()).getYears();
				counter = dao.GetReservationCounter(map.get(key).getEmail());
			}
			request.setAttribute("counter", counter);
			request.setAttribute("age", age);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/SecretaryDashboard.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login");
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
