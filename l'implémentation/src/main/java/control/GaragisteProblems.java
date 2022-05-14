package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.CarProblem;
import model.DAO;
import model.User;
import model.dailycarsProblemsStat;

/**
 * Servlet implementation class GaragisteProblems
 */
@WebServlet("/GaragisteProblems")
public class GaragisteProblems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GaragisteProblems() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null && user.getType().equals("depot manager")) {
			DAO dao = new DAO();
			ArrayList<CarProblem> carsProblems = dao.getCarsProblems(user.getEmployement().getWorkingLocation());
			ArrayList<dailycarsProblemsStat> weeklyProblemsStat = dao.getDepotWeeklyProblemsStat(user.getEmployement().getWorkingLocation());
			
			ObjectMapper mapper = new ObjectMapper();
			String weeklyStat = mapper.writeValueAsString(weeklyProblemsStat);
			request.setAttribute("weeklyStat", weeklyStat);
			
			request.setAttribute("problems",carsProblems);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/GaragisteProblems.jsp");
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
