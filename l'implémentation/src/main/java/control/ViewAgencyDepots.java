package control;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import model.Building;
import model.DAO;
import model.Depot;
import model.Office;
import model.User;
import model.Vehicule;

/**
 * Servlet implementation class ViewAgencyDepots
 */
@WebServlet("/ViewAgencyDepots")
public class ViewAgencyDepots extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAgencyDepots() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null && user.getType().equals("directeur")) {
			Random random = new Random();
			request.setAttribute("user", user);
			ArrayList<Building> Buildings = null;
			DAO dao = new DAO();
			Buildings = dao.getAgencyBuildings(user.getNom());
			int[] randInt = new int[Buildings.size()];
			for(int i=0;i<Buildings.size();i++) {
				randInt[i] = random.nextInt(7)+1;
			}
			
			request.setAttribute("Buildings", Buildings);
			request.setAttribute("random", randInt);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/AgencyBuildings.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Login");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("user");
		if (user != null && user.getType().equals("directeur")) {
			if(request.getParameterMap().containsKey("required_action")) {
				if(request.getParameter("required_action").equals("Building_details")) {
					String code = request.getParameter("code");
					String type = request.getParameter("type");
					String responseString = null ;
					DAO dao = new DAO();
					Depot depot = null ;
					Office office = null ;
					if(type.equals("depot")) {
						depot = dao.getDepotInfo(user.getNom(),code );
						ObjectMapper mapper = new ObjectMapper();
						responseString = mapper.writeValueAsString(depot);
					}else {
						office = dao.getOfficeInfo(user.getNom(), code);
						ObjectMapper mapper = new ObjectMapper();
						responseString = mapper.writeValueAsString(office);
					}
					PrintWriter out = response.getWriter();
					out.write(responseString);
					response.setStatus(200);
				}else if(request.getParameter("required_action").equals("car_details")) {
					DAO dao = new DAO();
					Vehicule vehicule = new Vehicule();
					System.out.println(request.getParameter("matricule"));
					vehicule = dao.getVehicule(request.getParameter("matricule"));
					System.out.println(vehicule.getMarque());
					PrintWriter out = response.getWriter();
					Gson gson = new Gson();
					String DataResponse = gson.toJson(vehicule);
					out.write(DataResponse);
					response.setStatus(200);
				}
			}
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
