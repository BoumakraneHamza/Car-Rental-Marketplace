package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import model.DAO;
import model.Depot;
import model.Meeting;
import model.Reservation;
import model.User;

/**
 * Servlet implementation class GetMeetings
 */
@WebServlet("/MeetingsManagement")
public class MeetingsManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MeetingsManagement() {
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
			if(user.getType().equals("secretary")) {
				DAO dao = new DAO();
				ObjectMapper mapper = new ObjectMapper();
				PrintWriter out = response.getWriter();
				if (request.getParameterMap().containsKey("client_email")) {
					HashMap<String,Meeting> Meetings = new HashMap<>();
					Meetings = dao.getMeetingsWithClient(user.getEmail(), request.getParameter("client_email"));
					String MeetingString = mapper.writeValueAsString(Meetings);
					out.write(MeetingString);
				}else {
					String limit = request.getParameter("limit");
					HashMap<String,Meeting> Calendar = new HashMap<>();
					HashMap<String,Meeting> Upcoming = new HashMap<>();
					Calendar = dao.getMeetings(user.getEmail());
					Upcoming = dao.getUpcomingMeetings(user.getEmail(),limit);
					String CalendarString = mapper.writeValueAsString(Calendar);
					String UpcomingString = mapper.writeValueAsString(Upcoming);
					String Data = "["+CalendarString+","+UpcomingString+"]";
					out.write(Data);
				}
			}else if(user.getType().equals("client")) {
				System.out.println("getting secretary meetings");
				String email = request.getParameter("secretary_email");
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime now = LocalDateTime.now();  
				String date1 = dtf.format(now);
				LocalDateTime daysFromNow = now.plusDays(4);
				String date2 = dtf.format(daysFromNow);
				DAO dao = new DAO();
				List<String> Calendar = dao.getUnknownMeetings(email,date1,date2);
				Gson gson = new Gson();
				String CalendarString = gson.toJson(Calendar);
				PrintWriter out = response.getWriter();
				out.write(CalendarString);
			}
		}else {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			if(user.getType().equals("client")) {
				String email = request.getParameter("sec_email");
				String Meeting_date = request.getParameter("meeting_Date");
				String reservationId = request.getParameter("reservation");
				DAO dao = new DAO();
				if(dao.BookMeeting(user.getEmail(), email, Meeting_date,"Payment",reservationId) == 1) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("PaymentManager");
					request.setAttribute("status", "success");
					request.setAttribute("reservationId", reservationId);
					dispatcher.forward(request, response);
				}else{
					response.setStatus(300);
				}	
			}else if(user.getType().equals("secretary")) {
				if (request.getParameter("required_action").equals("add_meeting")) {
					String client_email = request.getParameter("client_email");
					String meeting_type = request.getParameter("meeting_type");
					String date = request.getParameter("meeting_Date");
					DAO dao = new DAO();
					if(dao.BookMeeting(client_email, user.getEmail(), date,meeting_type,null) == 1) {
						User client = null;
						try {
							client = dao.getClientInfo(client_email);
						} catch (InstantiationException | IllegalAccessException | SQLException e) {
							e.printStackTrace();
						}
						Gson gson = new Gson();
						String clientInfo = gson.toJson(client);
						PrintWriter out = response.getWriter();
						out.write(clientInfo);
					}else{
						response.setStatus(300);
					}
				}else if(request.getParameter("required_action").equals("start_meeting")) {
					HashMap<String,Meeting> map = new HashMap<>();
					String Action_response = null;
					Reservation reservation = null;
					DAO dao = new DAO();
					map = dao.getUpcomingMeetings(user.getEmail(), "1");
					for(String key : map.keySet()) {
						if(map.get(key).getMeetingType().equals("Payment")) {
							if(map.get(key).getBooking_Id() != null) {
								try {
									reservation = dao.getReservation(map.get(key).getBooking_Id());
									Action_response = "initiate_Payment";
									System.out.println("got reservation info");
								} catch (InstantiationException | IllegalAccessException e) {
									e.printStackTrace();
								}
							}else {
								Action_response = "authenticate";
							}
						}
					}
					PrintWriter out = response.getWriter();
					Gson gson = new Gson();
					String reservationJson = gson.toJson(reservation);
					Action_response = gson.toJson(Action_response);
					out.write("["+Action_response+","+reservationJson+"]");
				}else if(request.getParameter("required_action").equals("confirm_payment")) {
					String reservationId = request.getParameter("reservationId");
					Depot depot = new Depot();
					DAO dao = new DAO();
					Reservation reservation = null;
					if(dao.checkIfPaid(reservationId)) {
						response.setStatus(300);
					}else {
						try {
						reservation = dao.getReservation(Integer.parseInt(reservationId));
						depot = dao.getDepotInfo(reservation.getVehicule().getAgence(), reservation.getVehicule().getDepot_code());
						
						} catch (NumberFormatException | InstantiationException | IllegalAccessException e) {
							e.printStackTrace();
						}
						Gson gson = new Gson();
						String result = gson.toJson(reservation);
						String depotAddress = gson.toJson(depot.getAdress());
						PrintWriter out = response.getWriter();
						out.write("["+result+","+depotAddress+"]");
					}
					
				}else if(request.getParameter("required_action").equals("finish_payment")) {
					String reservation_id = request.getParameter("reservation_id");
					System.out.println(reservation_id);
					DAO dao = new DAO();
					dao.finishPayment(reservation_id, "Meeting with secretary", "completed");
				}
			}
			
		}
	}
}
