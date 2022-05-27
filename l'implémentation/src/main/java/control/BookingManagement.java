package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import com.google.gson.Gson;

import model.DAO;
import model.Office;
import model.Reservation;
import model.Transaction;
import model.User;
import model.Vehicule;
import utils.PaperWorkManagement;


/**
 * Servlet implementation class initReservation
 */
@WebServlet("/BookingManagement")
public class BookingManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {     
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null && user.getType().equals("client")) {
			if(request.getParameterMap().containsKey("required_action")) {
				if(request.getParameter("required_action").equals("add")) {
					Initiate(request, response, user);
				}else if(request.getParameter("required_action").equals("delete")) {
					DAO dao = new DAO();
					int result = dao.DeleteReservation(Integer.parseInt(request.getParameter("reservationId")));
					if(result == 1) {
					 	request.setAttribute("location", request.getParameter("location"));
						request.setAttribute("pickUp_date",request.getParameter("pick_up_date"));
						request.setAttribute("return_date",request.getParameter("return_date"));
						request.setAttribute("car", request.getParameter("matricule"));
						RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewCar");
						dispatcher.forward(request, response);
					}
				}else if(request.getParameter("required_action").equals("check_availability")){
					DAO dao = new DAO();
					Reservation reservation = new Reservation();
					Vehicule vehicule = new Vehicule();
					vehicule.setMatricule(request.getParameter("matricule"));
					reservation.setVehicule(vehicule);
					reservation.setPick_up_date(request.getParameter("pickUp_date"));
					reservation.setReturn_date(request.getParameter("return_date"));
					Transaction transaction = new Transaction();
					transaction.setInsurance(Integer.parseInt(request.getParameter("insurance")));
					reservation.setPayment(transaction);
					int insuranceValue = reservation.getPayment().getInsurance();
					if(dao.verifyVehiculeAvailability(reservation)==true && (insuranceValue == 0 || insuranceValue == 52 || insuranceValue == 87)) {
						response.setStatus(200);
					}else {
						response.setStatus(300);
						PrintWriter out = response.getWriter();
						out.print("<div id=\"tab_header\">\r\n"
								+ "		<p id=\"title\">Car not Available</p>\r\n"
								+ "		<img style=\"width:11px;cursor:pointer;\" src=\"/Atelier/assets/cancel-black.svg\">\r\n"
								+ "	</div>\r\n"
								+ "	<div id=\"tab_content\">\r\n"
								+ "		<p id=\"details\">\r\n"
								+ "			It looks like a problem occurred please refresh and retry again\r\n"
								+ "		</p>\r\n"
								+ "	</div>\r\n"
								+ "	<button id=\"cta\" onclick=\"Refresh()\">Refresh</button>");
						out.flush();
					}
				}else if(request.getParameter("required_action").equals("get_offices")) {
					DAO dao = new DAO();
					ArrayList<Office> offices = new ArrayList<Office>();
					String reservationId = request.getParameter("reservation_id");
					Reservation reservation = new Reservation();
					try {
						reservation = dao.getReservation(Integer.parseInt(reservationId));
					} catch (NumberFormatException | InstantiationException | IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					offices = dao.getAvailableOffices(reservation.getVehicule().getAgence());
					Gson gson = new Gson();
					String result = gson.toJson(offices);
					int size = offices.size();
					PrintWriter out = response.getWriter();
					out.write("["+result+","+size+"]");
				}
			}else {
				response.setStatus(499);
			}
		}
		else if(user != null && user.getType().equals("secretaire")) {
			DAO dao = new DAO();
			String email = (String) request.getParameter("email");
			String password = (String) request.getParameter("password");
			User client = null;
			try {
				client = dao.checkLogin(email,password);
			} catch (InstantiationException | IllegalAccessException e) {
				e.printStackTrace();
			}
			String path = request.getServletContext().getRealPath("/assets/documents/contracts");
			Reservation reservation = new Reservation();
			reservation.setEmail(client.getEmail());
			Vehicule vehicule = new Vehicule();
			vehicule.setMatricule(request.getParameter("matricule"));
			vehicule.setAgence(request.getParameter("agence"));
			reservation.setVehicule(vehicule);
			reservation.setPick_up_date(request.getParameter("pickUp_date"));
			reservation.setReturn_date(request.getParameter("return_date"));
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu/MM/dd");
		    LocalDate localDate = LocalDate.now();
			reservation.setReservation_date(dtf.format(localDate));
			reservation.setLocation(request.getParameter("location"));
			int reservationId = dao.SetTempReservation(reservation);
			try {
				PaperWorkManagement.CreateContract(reservation, client, path, String.valueOf(reservationId));
			} catch (InvalidFormatException | IOException e) {
				e.printStackTrace();
			}
			request.setAttribute("reservationId", reservationId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ContractManagement");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
		
	}
	private void Initiate(HttpServletRequest request , HttpServletResponse response , User user) throws ServletException, IOException {
		DAO dao = new DAO();
		Reservation reservation = new Reservation();
		reservation.setEmail(user.getEmail());
		Vehicule vehicule = new Vehicule();
		vehicule.setMatricule(request.getParameter("matricule"));
		vehicule = dao.getVehicule(vehicule.getMatricule());
		reservation.setVehicule(vehicule);
		reservation.setPick_up_date(request.getParameter("pickUp_date"));
		reservation.setReturn_date(request.getParameter("return_date"));
		Transaction transaction = new Transaction();
		transaction.setInsurance(Integer.parseInt(request.getParameter("insurance")));
		int total = transaction.getInsurance();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate date1 = LocalDate.parse(reservation.getPick_up_date(), dtf);
	    LocalDate date2 = LocalDate.parse(reservation.getReturn_date(), dtf);
	    long daysBetween = ChronoUnit.DAYS.between(date1, date2);
		total = (int) (total + (daysBetween * vehicule.getPLJ() + 10));
		transaction.setTotal(total);
		reservation.setPayment(transaction);
	    LocalDate localDate = LocalDate.now();
		reservation.setReservation_date(dtf.format(localDate));
		reservation.setLocation(request.getParameter("location"));
		int reservationId = dao.SetTempReservation(reservation);
		reservation.setId(reservationId);
		dao.setTempTransaction(reservation);
		request.setAttribute("reservation", reservation);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ContractManagement");
		dispatcher.forward(request, response);
	}
}
