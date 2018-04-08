package fms.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fms.dao.BatchDAO;
import fms.dao.StudentsDAO;
import fms.daoimpl.BatchDAOImpl;
import fms.daoimpl.StudentsDAOImpl;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentsDAO d = new StudentsDAOImpl();
		BatchDAO b = new BatchDAOImpl();
		if (request.getParameter("yes")!=null&&request.getParameter("std_id")!=null){
			int std_id =Integer.parseInt(request.getParameter("std_id"));
					
			d.deleteStudent(std_id);
			
			response.sendRedirect("view_all_students.jsp");
		}
		
		if (request.getParameter("yes")!=null&&request.getParameter("batch_id")!=null){
			int batch_id =Integer.parseInt(request.getParameter("batch_id"));
			b.deleteBatch(batch_id);
					
		
			
			response.sendRedirect("batches.jsp");
		}
		else {
			
		
						
		
				
				response.sendRedirect("view_all_students.jsp");
			}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
