package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.stream.Stream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.docx4j.openpackaging.parts.Parts;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import model.DAO;
import model.Depot;
import model.User;
import model.Vehicule;

/**
 * Servlet implementation class CarManagement
 */
@WebServlet("/CarManagement")
@MultipartConfig
public class CarManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarManagement() {
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
		User user = (User) request.getSession().getAttribute("user");
		if(user!=null && user.getType().equals("directeur")) {
			if(request.getParameterMap().containsKey("required_action")) {
				if(request.getParameter("required_action").equals("check_available")) {
					String depot_code = request.getParameter("depot_code");
					DAO dao = new DAO();
					if(dao.HasAvailableSpace(user.getNom(), depot_code)) {
						response.setStatus(200);
					}else {
						response.setStatus(202);
					}
				}if(request.getParameter("required_action").equals("add_car")) {
					Vehicule vehicule = new Vehicule();
					Part mainImage = request.getPart("main_image");
					Date dNow = new Date();
			        SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddhhmmssMs");
			        String identifier = ft.format(dNow);
					String mainImagePath = "C:/Users/Hamza/eclipseJee-workspace/Atelier/src/main/webapp/assets/car_pics/"+identifier+mainImage.getContentType().replace("image/", ".");
					//mainImage.write(mainImagePath);
					vehicule.setImage("/assets/car_pics/"+identifier+mainImage.getContentType().replace("image/", "."));
					JSONObject json = new JSONObject();
					Integer j=1;
					for(Part part : request.getParts()) {
						if(part.getSubmittedFileName()!=null && !part.getSubmittedFileName().equals(mainImage.getSubmittedFileName())) {
							System.out.println(part.getSubmittedFileName());
							String SecondIdentifier = ft.format(dNow)+j;
							String sec_path = "C:/Users/Hamza/eclipseJee-workspace/Atelier/src/main/webapp/assets/car_pics/" + SecondIdentifier + part.getContentType().replace("image/", ".");
							//part.write(sec_path);
							json.append(j.toString(), "/assets/car_pics/" + SecondIdentifier + part.getContentType().replace("image/", "."));
							j++;
						}
					}
					System.out.println(json.toString());
					vehicule.setSecImages(json);
					JSONObject AllImages = new JSONObject();
					j=1;
					AllImages.append(j.toString(), vehicule.getImage());
					for(int i=0;i<vehicule.getSecImages().length();i++) {
						Integer x= j+1;
						AllImages.append(x.toString(), vehicule.getSecImages().get(j.toString()));
						j++;
					}
					System.out.println(AllImages.toString());
					vehicule.setSecImages((JSONObject)json);
					vehicule.setAgence(user.getNom());
					vehicule.setDepot_code(request.getParameter("depot_code"));
					vehicule.setModele(request.getParameter("car_model"));
					vehicule.setMarque(request.getParameter("car_marque"));
					vehicule.setFullName(request.getParameter("car_fullName"));
					vehicule.setPLJ(Integer.parseInt(request.getParameter("plj")));
					vehicule.setType(request.getParameter("body_type"));
					vehicule.setNumberSuitCase(Integer.parseInt(request.getParameter("cases")));
					vehicule.setNumberDoors(Integer.parseInt(request.getParameter("doors")));
					vehicule.setMileage(request.getParameter("mileage"));
					vehicule.setCarDescription(request.getParameter("car_description"));
					vehicule.setYear(Integer.parseInt(request.getParameter("year")));
					vehicule.setColor(request.getParameter("color"));					
				}
			}
		}else {
			response.setStatus(500);
		}
	}
}
