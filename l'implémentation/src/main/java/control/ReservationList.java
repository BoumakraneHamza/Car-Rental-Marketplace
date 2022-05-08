package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

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

/**
 * Servlet implementation class ReservationList
 */
@WebServlet("/ReservationList")
public class ReservationList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			if(request.getParameterMap().containsKey("required_action")) {
				DAO dao = new DAO();
				HashMap<String , Reservation> reservationMap = new HashMap<String, Reservation>();
				int map_size = 0 ;
				try {
					reservationMap = dao.getReservation(user.getEmail());
					map_size = reservationMap.size();
				} catch (InstantiationException | IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				ObjectMapper mapper = new ObjectMapper();
				String Map = mapper.writeValueAsString(reservationMap);
				String output = "["+map_size+","+Map+"]";
				PrintWriter out = response.getWriter();
				out.write(output);
			}else {
				request.setAttribute("user", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/reservationList.jsp");
				dispatcher.forward(request, response);
			}
		}else {
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
