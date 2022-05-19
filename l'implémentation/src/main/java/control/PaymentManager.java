package control;

import java.io.IOException;
import java.io.PrintWriter;

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
import com.stripe.param.PaymentIntentCreateParams;

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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Stripe.apiKey="sk_test_51L1HugBYa9gzCakFmWr011KOzYFiePCxyVhXA9wsXI22PAp62dGnQ6W4UxIliQ2mojOoCWLQwUkIiXlndsRYIx8m00Cgv9Zz7z";
		response.setContentType("application/json");

	      PaymentIntentCreateParams params =
	        PaymentIntentCreateParams.builder()
	          .setAmount((long)200)
	          .setCurrency("eur")
	          .setAutomaticPaymentMethods(
	            PaymentIntentCreateParams.AutomaticPaymentMethods
	              .builder()
	              .setEnabled(true)
	              .build()
	          )
	          .build();

	      // Create a PaymentIntent with the order amount and currency
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
