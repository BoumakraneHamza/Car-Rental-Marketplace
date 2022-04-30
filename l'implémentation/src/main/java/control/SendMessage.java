package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Conversation;
import model.DAO;
import model.Message;
import model.User;

/**
 * Servlet implementation class SendMessage
 */
@WebServlet("/SendMessage")
@MultipartConfig()
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
			DAO dao = new DAO();
			Message message = new Message();
			message.setContent(request.getParameter("content"));
			message.setSource(user.getEmail());
			message.setDestination(request.getParameter("destination"));
			Conversation conversation = new Conversation();
			conversation.setTitle(request.getParameter("title"));
			conversation.setTags(request.getParameter("tag"));
			conversation.setSource(user.getEmail());
			conversation.setDestination(request.getParameter("destination"));
			
			if(request.getParameterMap().containsKey("conversation_id")) {
				int id = 0;
				id= Integer.parseInt(request.getParameter("conversation_id"));
				message.setCoversation_id(id);
				try {
					dao.reply_message(message);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
					try {
						String path = null ;
						
							Part filePart = request.getPart("file");
							System.out.println(filePart);
						    String fileName = filePart.getSubmittedFileName();
							System.out.println(fileName);
							path = request.getServletContext().getRealPath("/assets/documents/UploadedFiles/") + fileName;
						    for (Part part : request.getParts()) {
						      part.write(path);
						    }
						dao.SendMessage(message ,conversation,path);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			response.setStatus(200);
			
		}
	}

