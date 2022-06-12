package control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;

import model.DAO;
import model.User;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
@MultipartConfig()
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
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
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/signUp.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("required_action").equals("ClientBassicInformations")){
			String email = request.getParameter("email");
			DAO dao = new DAO();
			if(dao.EmailAlreadyExist(email)) {
				PrintWriter out = response.getWriter();
				RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/signUp.jsp");
				dispatcher.include(request, response);
				out.print("<div class=\"notification\">\r\n"
						+ "    <div id=\"t1\"><p>Notification</p>\r\n"
						+ "    <input type=\"button\" value=\"X\" onclick=\"hideNotification()\"></div>\r\n"
						+ "    <div id=\"body\">\r\n"
						+ "    <p>Email Already used</p>\r\n"
						+ "    <p>Please choose a diffrent one</p>\r\n"
						+ "</div>\r\n"
						+ "</div>");
			}else {
				User user = new User();
				user.setEmail(email);
				user.setPassword(request.getParameter("password"));
				dao.addUser(user);
				String path = request.getServletContext().getRealPath("/assets/documents/ClientsFaceRecognitionSamples/");
				File folder = new File(path+email);
				if(!folder.exists()) {
					folder.mkdir();
				}
				request.getSession().setAttribute("email", email);
				request.setAttribute("email", email);
				RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/ClientRegistrationInfo.jsp");
				dispatcher.forward(request, response);
			}
		}else if(request.getParameter("required_action").equals("clientDetailInformation")){
			User user = new User();
			DAO dao = new DAO();
			user.setNom(request.getParameter("nom"));
			user.setPrenom(request.getParameter("prenom"));
			user.setTelephone(request.getParameter("phone"));
			user.setAddress(request.getParameter("address"));
			user.setSexe(request.getParameter("gender"));
			user.setNum_carte(request.getParameter("IDCard"));
			user.setEmail(request.getParameter("email"));
			user.setDate_naissance(request.getParameter("birth"));
			user.setLat(request.getParameter("lat"));
			user.setLon(request.getParameter("lon"));
			Date dNow = new Date();
			Part filePart = request.getPart("ProfileImage");
			String type = filePart.getContentType();
	        SimpleDateFormat ft = new SimpleDateFormat("yyMMddhhmmssMs");
	        SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
	        user.setAccountCreated(dt.format(dNow));
	        String Identifier = ft.format(dNow);
			String path = request.getServletContext().getRealPath("/assets/profile_pics/") + Identifier+type.replace("image/", ".");
			filePart.write(path);
			user.setImage("/assets/profile_pics/"+Identifier+type.replace("image/", "."));
			File dest = new File("C:\\Users\\Hamza\\eclipseJee-workspace\\Atelier\\src\\main\\webapp\\assets\\profile_pics\\"+Identifier+type.replace("image/", "."));
			File source = new File(path);
			try {
				FileUtils.copyFile(source, dest);
			}catch(Exception e) {
				e.printStackTrace();
			}
			dao.addClient(user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/ClientRegistration.jsp");
			request.setAttribute("email", request.getParameter("email"));
			dispatcher.forward(request, response);
		}
	}
}