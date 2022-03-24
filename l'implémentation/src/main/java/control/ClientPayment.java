package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CreditCards;
import model.DAO;
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
		
		if (request.getSession().getAttribute("user") != null) {
			User user = (User) request.getSession().getAttribute("user");
			request.setAttribute("user", user);
			CreditCards card = null;
			DAO dao = new DAO();
			try {
				card = dao.getDefaultCard(user.getEmail());
			} catch (InstantiationException | IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("card", card);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/ClientPayment.jsp");
			dispatcher.forward(request, response);
		} else {
			//later
			//RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/ClientPayment.jsp");
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
