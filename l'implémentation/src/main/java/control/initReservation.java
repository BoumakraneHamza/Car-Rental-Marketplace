package control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import utils.CreatePaperWork;


/**
 * Servlet implementation class initReservation
 */
@WebServlet("/initReservation")
public class initReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public initReservation() {
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
			String path = request.getServletContext().getRealPath("/assets/documents/contracts");
			Reservation reservation = new Reservation();
			reservation.setEmail(user.getEmail());
			reservation.setAgence(request.getParameter("agence"));
			reservation.setVehicule(request.getParameter("matricule"));
			SimpleDateFormat userInput = new SimpleDateFormat("dd/mm/yyyy"); 
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
			try {
				reservation.setPick_up_date(formatter.format(userInput.parse(request.getParameter("pickUp_date"))));
				reservation.setReturn_date(formatter.format(userInput.parse(request.getParameter("return_date"))));
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			reservation.setPick_up_hour(request.getParameter("pickUp_hour"));
			reservation.setReturn_hour(request.getParameter("return_hour"));
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu/MM/dd");
		    LocalDate localDate = LocalDate.now();
			reservation.setReservation_date(dtf.format(localDate));
			reservation.setLocation(request.getParameter("location"));
			DAO dao = new DAO();
			int reservationId = dao.SetTempReservation(reservation);
			
			try {
				CreatePaperWork.CreateContract(reservation, user, path, String.valueOf(reservationId));
			} catch (InvalidFormatException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("reservationId", reservationId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/SelectPayment");
			dispatcher.forward(request, response);
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
			reservation.setAgence(request.getParameter("agence"));
			reservation.setVehicule(request.getParameter("matricule"));
			reservation.setPick_up_date(request.getParameter("pickUp_date"));
			reservation.setReturn_date(request.getParameter("return_date"));
			reservation.setPick_up_hour(request.getParameter("pickUp_hour"));
			reservation.setReturn_hour(request.getParameter("return_hour"));
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
