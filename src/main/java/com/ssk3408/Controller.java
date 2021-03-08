package com.ssk3408;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ssk3408.DAO.OperationDAO;
import com.ssk3408.model.Complaint;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OperationDAO opDAO = null;
	RequestDispatcher rd = null;
	String clickDelete = "";
	String clickUpdate = "";
    /**
     * @see HttpServlet#HttpServlet()
     */
	public Controller() {
    	opDAO = new OperationDAO();
    }


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		switch (action) {
		case "LODGE":
			rd = request.getRequestDispatcher("/FormLodgingComplaint.jsp");
			rd.forward(request, response);
			break;
		case "UPDATE":
			rd = request.getRequestDispatcher("/FormComplaintUpdateCheck.jsp");
			rd.forward(request, response);
			break;
		case "DELETE":
			rd = request.getRequestDispatcher("/FormComplaintDeleteCheck.jsp");
			rd.forward(request, response);
			break;
		case "LIST":
			listComplaint(request, response);
			break;
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "LODGE":
			saveComplaint(request, response);
			break;
		case "UPDATE":
			getSingleComplaintUpdate(request, response);
			break;
		case "DELETE":
			getSingleComplaintDelete(request, response);
			break;
		case "LIST":
			listComplaint(request, response);
			break;
		default:
			break;
		}
	}
	
	private void listComplaint(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		OperationDAO dao = new OperationDAO();
		List<Complaint> theList = dao.getComplaint();
		request.setAttribute("complaint", theList);
		RequestDispatcher rd = request.getRequestDispatcher("/FormListComplaints.jsp");
		rd.forward(request, response);
	}
	
	protected void saveComplaint(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Complaint c = new Complaint();
		c.setComplaintid(Integer.parseInt(request.getParameter("complaintid")));
		c.setDepartment(request.getParameter("department"));
		c.setIssue(request.getParameter("issue"));
		c.setState(request.getParameter("state"));
		c.setSubject(request.getParameter("subject"));
		c.setMessage(request.getParameter("message"));
		c.setEmail(request.getParameter("email"));

		if (opDAO.save(c)) {
			request.setAttribute("NOTIFICATION", "Complaint lodged Successfully!");
		}

		request.setAttribute("complaint", c);
		RequestDispatcher rd = request.getRequestDispatcher("/FormLodgingComplaint.jsp");
		rd.forward(request, response);
	}
	
	private void getSingleComplaintUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		if (clickUpdate == "") {
			String complaintid = request.getParameter("complaintid");
			boolean complaintFound = opDAO.checkComplaint(complaintid);

			if (complaintFound) {
				Complaint theComplaint = opDAO.get(complaintid);
				request.setAttribute("complaint", theComplaint);
				clickUpdate = "Display";
				rd = request.getRequestDispatcher("/FormComplaintUpdate.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("NOTIFICATION", "Complaint Not Found!");
				rd = request.getRequestDispatcher("/FormComplaintUpdateCheck.jsp");
				rd.forward(request, response);
			}

		} else {
			updateComplaint(request, response);
		}
	}
	
	private void updateComplaint(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Complaint c = new Complaint();
		c.setComplaintid(Integer.parseInt(request.getParameter("complaintid")));
		c.setDepartment(request.getParameter("department"));
		c.setIssue(request.getParameter("issue"));
		c.setState(request.getParameter("state"));
		c.setSubject(request.getParameter("subject"));
		c.setMessage(request.getParameter("message"));
		c.setEmail(request.getParameter("email"));

		if (opDAO.update(c)) {
			request.setAttribute("NOTIFICATION", "Complaint Updated Successfully!");
			clickUpdate = "";
		}

		Complaint theComplaint = opDAO.get(request.getParameter("complaintid"));
		request.setAttribute("complaint", theComplaint);
		RequestDispatcher rd = request.getRequestDispatcher("/FormComplaintUpdate.jsp");
		rd.forward(request, response);

	}
	
	private void getSingleComplaintDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		if (clickDelete == "") {
			String complaintid = request.getParameter("complaintid");
			boolean ComplaintFound = opDAO.checkComplaint(complaintid);

			if (ComplaintFound) {
				Complaint theComplaint = opDAO.get(complaintid);
				request.setAttribute("complaint", theComplaint);
				clickDelete = "Display";
				rd = request.getRequestDispatcher("/FormComplaintDelete.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("NOTIFICATION", "The Complaint Not Found!");
				rd = request.getRequestDispatcher("/FormComplaintDeleteCheck.jsp");
				rd.forward(request, response);
			}

		} else {
			deleteComplaint(request, response);
		}

	}

	private void deleteComplaint(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String complaintid = request.getParameter("complaintid");

		if (opDAO.delete(complaintid)) {
			request.setAttribute("NOTIFICATION", "Complaint Deleted Successfully!");
			clickDelete = "";
		}

		RequestDispatcher rd = request.getRequestDispatcher("/FormComplaintDelete.jsp");
		rd.forward(request, response);

	}

}
