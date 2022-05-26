package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

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
		PrintWriter out = response.getWriter();
		CarFilter filter = new CarFilter();
		filter.setLocation(request.getParameter("location"));
		filter.setLocation_LAT(request.getParameter("locationLat"));
		filter.setLocation_Lon(request.getParameter("locationLon"));
	    filter.setPickUp_date(request.getParameter("pickUp_date"));
	    filter.setReturn_date(request.getParameter("return_date"));

		filter.setTypeFilter(request.getParameter("typeFilter"));
		filter.setMaxPriceBound(Integer.parseInt(request.getParameter("MaxPrice")));
		filter.setMinPriceBound(Integer.parseInt(request.getParameter("MinPrice")));
		filter.setCarRate(Integer.parseInt(request.getParameter("carRate")));
		
		DAO dao = new DAO();
		ArrayList<Vehicule> vehicules = null;
		try {
			vehicules = dao.carSearch(filter);
		} catch (InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ObjectMapper mapper = new ObjectMapper();
		String vehiculeList = mapper.writeValueAsString(vehicules);
		out.write(vehiculeList);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
