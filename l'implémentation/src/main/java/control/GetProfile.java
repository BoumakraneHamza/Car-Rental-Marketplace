package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.DAO;
import model.User;

/**
 * Servlet implementation class GetProfile
 */
@WebServlet("/GetProfile")
public class GetProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			DAO dao = new DAO();
			String AccountType = dao.getUserType(request.getParameter("client_email"));
			User Profile = new User();
			if(AccountType.equals("client")) {
				try {
					Profile = dao.getClientInfo(request.getParameter("client_email"));
				} catch (SQLException | InstantiationException | IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(AccountType.equals("depot manager")) {
				Profile = dao.getGaragiste(request.getParameter("client_email"));
			}else if(AccountType.equals("secretary")){
				Profile = dao.getSecretaire(request.getParameter("client_email"));
			}
			ObjectMapper mapper = new ObjectMapper();
			String ProfileInfo = mapper.writeValueAsString(Profile);
			PrintWriter out = response.getWriter();
			out.write(ProfileInfo);
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
