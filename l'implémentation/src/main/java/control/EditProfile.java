package control;

import java.io.IOException;

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
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/EditProfile.jsp");
		User user = (User) request.getSession().getAttribute("user");
		request.setAttribute("user", user);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO dao = new DAO();
		User user = new User();
		User sessionUser = (User) request.getSession().getAttribute("user");
		user.setEmail(request.getParameter("email"));
		user.setDate_naissance(request.getParameter("date_naissance"));
		user.setNom(request.getParameter("nom"));
		user.setPrenom(request.getParameter("prenom"));
		user.setTelephone(request.getParameter("telephone"));
		user.setSexe(request.getParameter("sexe"));
		user.setNum_carte(request.getParameter("num_carte"));
		
		dao.ModifyUser(user);
		try {
			user = dao.checkLogin(user.getEmail(), sessionUser.getPassword());
			
		} catch (InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("user", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/ViewProfile.jsp");
		dispatcher.forward(request, response);
	}

}
