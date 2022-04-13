package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.InboxReturn;
import model.Message;
import model.User;

/**
 * Servlet implementation class Inbox
 */
@WebServlet("/Inbox")
public class Inbox extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inbox() {
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
			InboxReturn inbox = new InboxReturn();
			inbox = dao.getMessages(user.getEmail());
			request.setAttribute("messages", inbox.Messages);
			request.setAttribute("counter", inbox.NotReadMessages);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/inbox.jsp");
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
		String messageId = request.getParameter("id");
		DAO dao = new DAO();
		try {
			dao.ReadMessage(Integer.parseInt(messageId));
		} catch (NumberFormatException | InstantiationException | IllegalAccessException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Message Read");
		
	}

}
