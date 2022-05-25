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
import com.google.gson.Gson;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentMethod;

import model.CreditCard;
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
				HashMap<String , ArrayList<Reservation>> reservationMap = new HashMap<String, ArrayList<Reservation>>();
				int map_size = 0 ;
				try {
					reservationMap = dao.getReservation(user.getEmail());
					map_size = reservationMap.size();
					System.out.println(map_size);
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
				RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/ClientBookings.jsp");
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
		User user = (User) request.getSession().getAttribute("user");
		if(user != null) {
			Gson gson = new Gson();
			int reservationId = Integer.parseInt(request.getParameter("reservationId"));
			DAO dao = new DAO();
			Reservation reservation = null;
			try {
				reservation = dao.getReservation(reservationId);
			} catch (InstantiationException | IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Stripe.apiKey = "sk_test_51L1HugBYa9gzCakFmWr011KOzYFiePCxyVhXA9wsXI22PAp62dGnQ6W4UxIliQ2mojOoCWLQwUkIiXlndsRYIx8m00Cgv9Zz7z";

			PaymentMethod paymentMethod = null;
			try {
				paymentMethod =
				  PaymentMethod.retrieve(
				    reservation.getPayment().getMethod()
				  );
			} catch (StripeException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			CreditCard card = new CreditCard();
			card.setCardNumber(paymentMethod.getCard().getLast4());
			card.setExp_month(paymentMethod.getCard().getExpMonth().toString());
			card.setExp_year(paymentMethod.getCard().getExpYear().toString());
			String res = gson.toJson(reservation);
			String cardRes = gson.toJson(card);
			PrintWriter out = response.getWriter();
			out.print("["+res+","+cardRes+"]");
		}
	
	}
}
