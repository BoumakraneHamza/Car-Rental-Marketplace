package control;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import model.DAO;
import model.Reservation;
import model.User;
import model.Vehicule;
import utils.CreatePaperWork;


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
			if(!request.getParameterMap().containsKey("required_action")) {
				Reservation reservation = new Reservation();
				reservation.setEmail(user.getEmail());
				Vehicule vehicule = new Vehicule();
				vehicule.setMatricule(request.getParameter("matricule"));
				vehicule.setAgence(request.getParameter("agence"));
				reservation.setVehicule(vehicule);
				reservation.setPick_up_date(request.getParameter("pickUp_date"));
				reservation.setReturn_date(request.getParameter("return_date"));
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			    LocalDate localDate = LocalDate.now();
				reservation.setReservation_date(dtf.format(localDate));
				reservation.setLocation(request.getParameter("location"));
				DAO dao = new DAO();
				int reservationId = dao.SetTempReservation(reservation);
				request.setAttribute("reservationId", reservationId);
				request.setAttribute("matricule", request.getParameter("matricule"));
				RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectPayment");
				dispatcher.forward(request, response);
				
			}else{
				if(request.getParameter("required_action").equals("delete")) {
					DAO dao = new DAO();
					int result = dao.DeleteReservation(Integer.parseInt(request.getParameter("reservationId")));
					System.out.println(result);
					if(result == 1) {
					 	request.setAttribute("location", request.getParameter("location"));
						request.setAttribute("pickUp_date",request.getParameter("pick_up_date"));
						request.setAttribute("return_date",request.getParameter("return_date"));
						request.setAttribute("car", request.getParameter("matricule"));
						RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewCar");
						System.out.println("view Car redirecting");
						dispatcher.forward(request, response);
					}
				}
			}
		}else if(user != null && user.getType().equals("secretaire")) {
			DAO dao = new DAO();
			String email = (String) request.getParameter("email");
			String password = (String) request.getParameter("password");
			User client = null;
			try {
				client = dao.checkLogin(email,password);
			} catch (InstantiationException | IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String path = request.getServletContext().getRealPath("/assets/documents/contracts");
			System.out.println(path);
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
				CreatePaperWork.CreateContract(reservation, client, path, String.valueOf(reservationId));
			} catch (InvalidFormatException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("reservationId", reservationId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectPayment");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
