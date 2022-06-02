package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.User;

/**
 * Servlet implementation class LoginWithGoogle
 */
@WebServlet("/LoginWithGoogle")
public class LoginWithGoogle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginWithGoogle() {
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
		User user = new User();
		user.setEmail( request.getParameter("email"));
		user.setNom( request.getParameter("nom"));
		user.setImage(request.getParameter("Image"));
		user.setPrenom(request.getParameter("prenom"));
		DAO dao = new DAO();
		dao.addClientWithGoogleSignIn(user);
		try {
			user = dao.getClientInfo(user.getEmail());
		} catch (InstantiationException | IllegalAccessException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("user", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Dashboard");
		dispatcher.forward(request, response);
	}

}
