package control;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

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
import utils.PaperWorkManagement;

/**
 * Servlet implementation class contractView
 */
@WebServlet("/ContractManagement")
public class ContractManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContractManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @throws IOException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String reservationId = request.getParameter("reservationId");
		System.out.println(reservationId);
		String path = request.getServletContext().getRealPath("/assets/documents/contracts/"+reservationId+".pdf");
		File file = new File(path);
		response.setContentType("application/pdf;charset=UTF-8");
		response.setHeader("Content-Length", String.valueOf(file.length()));
		response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
		Files.copy(file.toPath(), response.getOutputStream());
	}

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if(user != null) {
			if(request.getParameterMap().containsKey("required_action") && request.getParameter("required_action").equals("delete")) {
				DAO dao = new DAO();
				String path = request.getServletContext().getRealPath("/assets/documents/contracts");
				dao.DeleteReservation(Integer.parseInt(request.getParameter("reservationId")));
				PaperWorkManagement.deleteContract(request.getParameter("reservationId"),path);
			}else {
				String reservationId = request.getParameter("reservationId");
				DAO dao = new DAO();
				String path = request.getServletContext().getRealPath("/assets/documents/contracts");
				try {
					Reservation reservation = dao.getReservation(Integer.parseInt(request.getParameter("reservationId")));
					PaperWorkManagement.CreateContract(reservation, user, path, String.valueOf(reservationId));
				} catch (InvalidFormatException | IOException | NumberFormatException | InstantiationException | IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("reservationId", reservationId);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/ContractConfirmation.jsp");
				dispatcher.forward(request, response);
			}
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
