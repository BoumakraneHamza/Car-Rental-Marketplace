package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
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
					HashMap<String,User> Meetings = new HashMap<>();
					Meetings = dao.getMeetingsWithClient(user.getEmail(), request.getParameter("client_email"));
					String MeetingString = mapper.writeValueAsString(Meetings);
					out.write(MeetingString);
				}else {
					String limit = request.getParameter("limit");
					HashMap<String,User> Calendar = new HashMap<>();
					HashMap<String,User> Upcoming = new HashMap<>();
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
			String email = request.getParameter("sec_email");
			String Meeting_date = request.getParameter("meeting_Date");
			String reservationId = request.getParameter("reservation");
			DAO dao = new DAO();
			if(dao.BookMeeting(user.getEmail(), email, Meeting_date) == 1) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("PaymentManager");
				request.setAttribute("status", "success");
				request.setAttribute("reservationId", reservationId);
				dispatcher.forward(request, response);
			}else{
				response.setStatus(300);
			}
		}
	}
}
