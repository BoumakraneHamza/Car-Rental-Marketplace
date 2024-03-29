package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.stripe.exception.StripeException;

import model.CreditCard;
import model.DAO;
import model.Payment;
import model.User;
import utils.PaymentCardRetriever;

/**
 * Servlet implementation class ClientPayment
 */
@WebServlet("/ClientPayment")
public class ClientPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientPayment() {
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
			DAO dao = new DAO();
			ArrayList<CreditCard> cardlist = null;
			try {
				cardlist = PaymentCardRetriever.RetrieveCards(user);
			} catch (StripeException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			Random rand = new Random();
			Integer random = rand.nextInt(25);
			request.setAttribute("random", random);
			request.setAttribute("cardList", cardlist);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/ClientPayment.jsp");
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
	}

}
