package control;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;

/**
 * Servlet implementation class ClientRegistration
 */
@WebServlet("/ClientRegistration")
@MultipartConfig()
public class ClientRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[info] start video capture");
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/ClientRegistration.jsp");
		request.setAttribute("email", request.getSession().getAttribute("email"));
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameterMap().containsKey("required_action")){
			if(request.getParameter("required_action").equals("addVideoToFaceRecognition")) {
				InputStream in = request.getPart("file").getInputStream();
				Date dNow = new Date();
		        SimpleDateFormat ft = new SimpleDateFormat("yyMMddhhmmssMs");
		        String email = (String) request.getSession().getAttribute("email");
				String path = request.getServletContext().getRealPath("/assets/documents/ClientsFaceRecognitionSamples/")+email+"/"+ft.format(dNow);
				System.out.println(path);
				OutputStream out = new FileOutputStream(path+".mp4");
				copy(in,out);
				out.flush();
				out.close();
			}
		}else {
			doGet(request, response);
		}
	}
	public static long copy(InputStream input, OutputStream output) throws IOException {
	    byte[] buffer = new byte[4096];

	    long count = 0L;
	    int n = 0;

	    while (-1 != (n = input.read(buffer))) {
	        output.write(buffer, 0, n);
	        count += n;
	    }
	    return count;
	}
}