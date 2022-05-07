package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.DAO;
import model.Employee;
import model.Reservation;
import model.User;
import utils.UploadImage;

/**
 * Servlet implementation class ProfileStateManager
 */
@WebServlet("/ProfileStateManager")
@MultipartConfig
public class ProfileStateManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileStateManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		DAO dao = new DAO();
		if(user != null ) {	
			if (dao.IsNewAccount(user)) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/NewEmployee.jsp");
				dispatcher.forward(request, response);
			}else {
				String url = "/";
				if(user.getType().equals("depot manager")) {
					user = dao.getGaragiste(user.getEmail());
					request.setAttribute("user", user);
					ObjectMapper mapper = new ObjectMapper();
					HashMap<String, Integer> stat = null;
					ArrayList<Reservation> reservations = dao.getDepotReservations(user.getGaragisteInfo().getWorkingLocation(), 5);
					request.setAttribute("reservations", reservations);
					
					stat = dao.depotCarStatByMarque(user.getGaragisteInfo().getWorkingLocation());
					String stat1 = mapper.writeValueAsString(stat);
					request.setAttribute("stat1", stat1);
					
					stat = dao.depotCarStatByRating(user.getGaragisteInfo().getWorkingLocation());
					String stat3 = mapper.writeValueAsString(stat);
					request.setAttribute("stat3", stat3);
					url = url + "jsp/GaragisteDashboard.jsp";
				}else {
					user = dao.getSecretaire(user.getEmail());
					request.setAttribute("user", user);
					url = url + "SecretaryDashboard";
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
			}
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Login");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			DAO dao = new DAO();
			request.setAttribute("user", user);
			Employee employee = new Employee();
			employee.setNom(request.getParameter("nom"));
			employee.setPrenom(request.getParameter("prenom"));
			employee.setType(user.getType());
			employee.setEmail(user.getEmail());
			String directoryPath = getServletContext().getRealPath("/assets/profile_pics/");
			String path = getServletContext().getRealPath("/assets/profile_pics/")+ user.getEmail().replace(".com", "").replace("@", "");
			UploadImage uploader = new UploadImage(request);
			String uploadedImagePath = uploader.UploadProfilePicture(path , directoryPath);
			String databasePath = uploadedImagePath.substring(path.indexOf("\\assets")).replace("\\", "/");
		    employee.setImage(databasePath);
		    int result = dao.CompleteEmployeeRegistration(employee);
		    if(result == 1) {
				doGet(request, response);
		    }
		}else {
			response.setStatus(500);
		}
	}

}
