package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.model.PaymentMethod;
import com.stripe.param.PaymentIntentCreateParams;

import model.CreditCard;
import model.DAO;
import model.Reservation;
import model.User;

/**
 * Servlet implementation class PaymentManager
 */
@WebServlet("/PaymentManager")
public class PaymentManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("status", request.getParameter("status"));
		String reservationId = request.getParameter("reservationId");
		System.out.println(reservationId);
		if(request.getParameterMap().containsKey("payment_intent")) {
			Stripe.apiKey = "sk_test_51L1HugBYa9gzCakFmWr011KOzYFiePCxyVhXA9wsXI22PAp62dGnQ6W4UxIliQ2mojOoCWLQwUkIiXlndsRYIx8m00Cgv9Zz7z";
			String PI = request.getParameter("payment_intent");
			PaymentIntent paymentIntent = null;
			try {
				paymentIntent =
						  PaymentIntent.retrieve(
								  PI
						  );
			} catch (StripeException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			DAO dao = new DAO();
			dao.finishPayment(reservationId, paymentIntent.getPaymentMethod(),"completed");
		}else {
			DAO dao = new DAO();
			dao.finishPayment(reservationId, "Meeting With secretary","pending");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("Dashboard");
		dispatcher.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		Stripe.apiKey="sk_test_51L1HugBYa9gzCakFmWr011KOzYFiePCxyVhXA9wsXI22PAp62dGnQ6W4UxIliQ2mojOoCWLQwUkIiXlndsRYIx8m00Cgv9Zz7z";
		response.setContentType("application/json");
		if(request.getParameterMap().containsKey("required_action")) {
			if(request.getParameter("required_action").equals("add_card")) {
				DAO dao = new DAO();
				Map<String, Object> card = new HashMap<>();
				card.put("number", request.getParameter("card_number"));
				card.put("exp_month", request.getParameter("exp_month"));
				card.put("exp_year", request.getParameter("exp_year"));
				card.put("cvc", request.getParameter("cvc"));
				Map<String, Object> params = new HashMap<>();
				params.put("type", "card");
				params.put("card", card);
				int result = 0;
				String responseText = null;
				try {
					PaymentMethod paymentMethod = PaymentMethod.create(params);
					Map<String, Object> Method_params = new HashMap<>();
					String customer_id = dao.getCustomerId(user.getEmail());
					Method_params.put("customer", customer_id);
					paymentMethod.attach(Method_params);
				} catch (StripeException e) {
					result = 1;
					e.printStackTrace();
				}
				if(result == 1) {
					responseText = "failure";
					String JsonRes = gson.toJson(responseText);
					PrintWriter out = response.getWriter();
					out.write(JsonRes);
				}else {
					RequestDispatcher dispatcher = request.getRequestDispatcher("ClientPayment");
					dispatcher.forward(request, response);
				}
			}else if(request.getParameter("required_action").equals("init")) {
				DAO dao = new DAO();
				String CustomerId = dao.getCustomerId(user.getEmail());
				String reservationId = request.getParameter("reservationId");
				Reservation reservation = new Reservation();
				try {
					reservation = dao.getReservation(Integer.parseInt(reservationId));
				} catch (NumberFormatException | InstantiationException | IllegalAccessException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				PaymentIntentCreateParams params =
			        PaymentIntentCreateParams.builder()
			          .setAmount((long)reservation.getPayment().getTotal()*100)
			          .setCurrency("usd")
			          .setCustomer(CustomerId)
			          .setSetupFutureUsage(PaymentIntentCreateParams.SetupFutureUsage.OFF_SESSION)
			          .setAutomaticPaymentMethods(
			            PaymentIntentCreateParams.AutomaticPaymentMethods
			              .builder()
			              .setEnabled(true)
			              .build()
			          )
			          .build();

				PaymentIntent paymentIntent = null;
				try {
					paymentIntent = PaymentIntent.create(params);
				} catch (StripeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				CreatePaymentResponse paymentResponse = new CreatePaymentResponse(paymentIntent.getClientSecret());
				String Paymentresponse = gson.toJson(paymentResponse);
				PrintWriter out = response.getWriter();
				out.write(Paymentresponse);
			}else if(request.getParameter("required_action").equals("useSaved_Method")) {
				String paymentMethod = request.getParameter("paymentMethod");
				String CustomerId = request.getParameter("customer_id");
				PaymentIntentCreateParams params =
						  PaymentIntentCreateParams.builder()
						    .setAmount((long)20000)
						    .setCurrency("usd")
						    .setCustomer("{{"+CustomerId+"}}")
						    .addPaymentMethodType("card")
						    .setPaymentMethod("{{"+paymentMethod+"}}")
						    .build();
				PaymentIntent paymentIntent = null;
				try {
					paymentIntent = PaymentIntent.create(params);
				} catch (StripeException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				CreatePaymentResponse paymentResponse = new CreatePaymentResponse(paymentIntent.getClientSecret());
				String Paymentresponse = gson.toJson(paymentResponse);
				PrintWriter out = response.getWriter();
				out.write(Paymentresponse);
			}
		}else {
			response.setStatus(300);
		}
	}
	private static Gson gson = new Gson();

	  static class CreatePayment {
	    @SerializedName("items")
	    Object[] items;

	    public Object[] getItems() {
	      return items;
	    }
	  }

	  static class CreatePaymentResponse {
	    private String clientSecret;
	    public CreatePaymentResponse(String clientSecret) {
	      this.clientSecret = clientSecret;
	    }
	  }

	  static int calculateOrderAmount(Object[] items) {
	    return 200;
	  }
}
