package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.Depot;
import model.Employee;
import model.User;

/**
 * Servlet implementation class AjaxAddEmployee
 */
@WebServlet("/AjaxAddEmployee")
public class AjaxAddEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAddEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user.getType().equals("directeur")) {
			response.setContentType("application/xml");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			ArrayList<Employee> employees = null;
			DAO dao = new DAO();
			employees = dao.getAgencyPersonals(user.getNom());
			
			out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			out.println("<Employees>");
			for(Employee employee : employees) {
				out.print("<employee ");
				out.append("email=\"" + employee.getEmail() + "\" ");
				out.append("firstName=\"" + employee.getFirstName() + "\" ");
				out.append("lastName=\"" + employee.getLastName() + "\" ");
				out.append("image=\"" + employee.getImage() + "\" ");
				out.append("workingLocation=\"" + employee.getWorkingLocation() + "\" ");
				out.append("monthlySession=\"" + employee.getMonthlySession() + "\" ");
				out.append("type=\"" + employee.getType() + "\" ");
				out.println("/>");
			}
			out.print("</Employees>");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		if (user.getType().equals("directeur")) {
			DAO dao = new DAO();
			Employee employee = new Employee();
			
			employee.setEmail(request.getParameter("email"));
			employee.setFirstName(request.getParameter("firstName"));
			employee.setLastName(request.getParameter("lastName"));
			employee.setImage(request.getParameter("image"));
			employee.setWorkingLocation(request.getParameter("workingLocation"));
			employee.setAgencyName(request.getParameter("agency"));
			employee.setType(request.getParameter("type"));
			//employee.set(request.getParameter(""));
			
			dao.addEmployee(employee);
		}
		doGet(request, response);
	}

}
