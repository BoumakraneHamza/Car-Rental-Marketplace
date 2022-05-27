package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

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
@WebServlet("/GetMeetings")
public class GetMeetings extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMeetings() {
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
				String email = request.getParameter("secretary_email");
				DAO dao = new DAO();
				HashMap<String,User> Calendar = new HashMap<>();
				Calendar = dao.getMeetings(email);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
