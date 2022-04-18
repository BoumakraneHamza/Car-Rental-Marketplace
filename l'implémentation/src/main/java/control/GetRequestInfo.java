package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.DAO;
import model.User;
import model.request;

/**
 * Servlet implementation class GetRequestInfo
 */
@WebServlet("/GetRequestInfo")
public class GetRequestInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetRequestInfo() {
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
			String id= request.getParameter("id");
			System.out.println("id" + id);
			request requests = dao.GetRequestsById(id);
			ObjectMapper mapper = new ObjectMapper();
			String JsonString = mapper.writeValueAsString(requests);
			PrintWriter out = response.getWriter();
			out.write(JsonString);
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
