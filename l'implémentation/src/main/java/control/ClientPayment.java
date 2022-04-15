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

import model.CreditCards;
import model.DAO;
import model.Payment;
import model.User;

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
			CreditCards card = null;
			HashMap<Integer ,Payment> map = null;
			try {
				card = dao.getDefaultCard(user.getEmail());
				map = dao.getPayments(user.getEmail());
			} catch (InstantiationException | IllegalAccessException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Random rand = new Random();
			Integer random = rand.nextInt(25);
			request.setAttribute("random", random);
			request.setAttribute("card", card);
			request.setAttribute("payments", map);
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
		User user = (User) request.getSession().getAttribute("user");
		ObjectMapper mapper = new ObjectMapper();
		 DAO dao = new DAO();
		 HashMap<Integer,Payment> map = new HashMap<>();
		 try {
			map = dao.getPayments(user.getEmail());
		} catch (InstantiationException | IllegalAccessException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String JsonMap = mapper.writeValueAsString(map);
		 PrintWriter out = response.getWriter();
		 out.write(JsonMap);
	}

}
