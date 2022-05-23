package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.PaperWorkManagement;

/**
 * Servlet implementation class SaveImg
 */
@WebServlet("/SaveImg")
public class SaveImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveImg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reservationId = request.getParameter("reservationId");
		String path = request.getServletContext().getRealPath("/assets/documents/contracts");
		String test = request.getParameter("signature");
	    String base64Image = test.split(",")[1];
	    byte[] bImg = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64Image);
	    try {
			PaperWorkManagement.FinishContract(path, reservationId , bImg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    request.setAttribute("reservationId", reservationId);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("SelectPayment");
		dispatcher.forward(request, response);
	}

}
