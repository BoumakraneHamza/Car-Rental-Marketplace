package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DAO;
import model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getSession().getAttribute("user") != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Dashboard");
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
		
		RequestDispatcher dispatcher;

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		DAO dao = new DAO();
		
		try {

			User user = dao.checkLogin(email, password);

			if (user != null) {

				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				dispatcher = request.getRequestDispatcher("/Dashboard");
				dispatcher.forward(request, response);
				

			} else {

				PrintWriter out = response.getWriter();

				dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
				dispatcher.include(request, response);

				out.print("<div class=\"notification\">\r\n"
						+ "    <div id=\"t1\"><p>Notification</p>\r\n"
						+ "    <input type=\"button\" value=\"X\" onclick=\"hideNotification()\"></div>\r\n"
						+ "    <div id=\"body\">\r\n"
						+ "    <p>Incorrect Password or Email </p>\r\n"
						+ "    <p>Please try again</p>\r\n"
						+ "</div>\r\n"
						+ "</div>");
			}
			

		} catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
	}

}
