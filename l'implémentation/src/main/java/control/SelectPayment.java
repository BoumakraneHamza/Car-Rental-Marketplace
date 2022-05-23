package control;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Customer;

import model.CreditCard;
import model.DAO;
import model.Office;
import model.Reservation;
import model.User;
import utils.PaymentCardRetriever;

/**
 * Servlet implementation class SelectPayment
 */
@WebServlet("/SelectPayment")
public class SelectPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPayment() {
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
			Reservation reservation;
			DAO dao = new DAO();
			try {
				Stripe.apiKey="sk_test_51L1HugBYa9gzCakFmWr011KOzYFiePCxyVhXA9wsXI22PAp62dGnQ6W4UxIliQ2mojOoCWLQwUkIiXlndsRYIx8m00Cgv9Zz7z";
				if(dao.CheckIfNewCustomer(user.getEmail())) {
					Map<String, Object> params = new HashMap<>();
					params.put(
					  "email", user.getEmail()
					);
					Customer customer = Customer.create(params);
					dao.setCustomerId(user.getEmail(), customer.getId());
					request.setAttribute("customer_id", customer.getId());
				}else {
					String customerId = dao.getCustomerId(user.getEmail());
					request.setAttribute("customer_id", customerId);
				}
				ArrayList<CreditCard> cardlist = PaymentCardRetriever.RetrieveCards(user );
				ArrayList<Office> offices = new ArrayList<Office>();
				reservation = dao.getReservation(Integer.parseInt((String) request.getAttribute("reservationId")));
				offices = dao.getAvailableOffices(reservation.getVehicule().getAgence());
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDate date1 = LocalDate.parse(reservation.getPick_up_date(), dtf);
			    LocalDate date2 = LocalDate.parse(reservation.getReturn_date(), dtf);
			    long daysBetween = ChronoUnit.DAYS.between(date1, date2);
			    int inssurance = Integer.parseInt(reservation.getInsurance());
			    request.setAttribute("cardlist", cardlist);
			    request.setAttribute("offices", offices);
			    request.setAttribute("reservation", reservation);
			    request.setAttribute("price", reservation.getVehicule().getPLJ()*daysBetween + inssurance + 10);
			    request.setAttribute("duration", daysBetween);
			} catch (InstantiationException | IllegalAccessException | StripeException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/SelectPayment.jsp");
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
