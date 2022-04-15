package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CarFilter;
import model.DAO;
import model.Vehicule;

/**
 * Servlet implementation class AjaxCarFilter
 */
@WebServlet("/AjaxCarFilter")
public class AjaxCarFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCarFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/xml");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		CarFilter filter = new CarFilter();
		filter.setLocation(request.getParameter("location"));
		filter.setPickUp_date(request.getParameter("pickUp_date"));
		filter.setReturn_date(request.getParameter("return_date"));
		filter.setPickUp_hour(request.getParameter("pickUp_hour"));
		filter.setReturn_hour(request.getParameter("return_hour"));
		filter.setTypeFilter(request.getParameter("typeFilter"));
		//filter.setPrice(request.getParameter("price"));
		filter.setCarRate(Integer.parseInt(request.getParameter("carRate")));
		
		DAO dao = new DAO();
		ArrayList<Vehicule> vehicules = null;
		try {
			vehicules = dao.carSearch(filter);
		} catch (InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print("<cars>\n");
		for(Vehicule car : vehicules) {
			out.print("<car>\n");
			out.print("<matricule>" + car.getMatricule()+ "</matricule>\n");
			out.print("<marque>" + car.getMarque() + "</marque>\n");
			out.print("<modele>" + car.getModele() + "</modele>\n");
			out.print("<PLJ>" + car.getPLJ() + "</PLJ>\n");
			out.print("<PLH>" + car.getPLH() + "</PLH>\n");
			out.print("<type>" + car.getType() + "</type>\n");
			out.print("<image>" + car.getImage() + "</image>\n");
			out.print("<depot_code>" + car.getDepot_code() + "</depot_code>\n");
			out.print("<agence>" + car.getAgence() + "</agence>\n");
			out.print("<color>" + car.getColor() + "</color>\n");
			out.print("<year>" + car.getYear() + "</year>\n");
			out.print("<averageRating>" + car.getAverageRating() + "</averageRating>\n");
			out.print("</car>\n");
		}
		out.print("</cars>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
