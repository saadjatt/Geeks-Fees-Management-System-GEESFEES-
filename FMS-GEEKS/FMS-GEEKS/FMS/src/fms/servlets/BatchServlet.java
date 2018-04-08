package fms.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/BatchServlet")
public class BatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BatchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 fms.dao.BatchDAO ba = new fms.daoimpl.BatchDAOImpl();
		if(request.getParameter("name")!=null 
				&& request.getParameter("fees")!=null
				&& request.getParameter("course")!=null
				&& request.getParameter("start")!=null
				&& request.getParameter("end")!=null
				&& request.getParameter("time")!=null
				&& request.getParameter("batch_id")!=null)
			{

				String name=request.getParameter("name");
				String fees=request.getParameter("fees");
				String course=request.getParameter("course");
				String start=request.getParameter("start");
				String end=request.getParameter("end");
				String time=request.getParameter("time");
				int  batch_id=Integer.parseInt(request.getParameter("batch_id"));
				if(ba.editBatch(batch_id, name, course, time, start, end, fees)==1){
					response.sendRedirect("add_batch.jsp?batch_id="+batch_id+"&status=successfully");
				}
				
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// HttpSession session = request.getSession();
		 fms.dao.BatchDAO ba = new fms.daoimpl.BatchDAOImpl();
		if(request.getParameter("name")!=null 
			&& request.getParameter("fees")!=null
			&& request.getParameter("course")!=null
			&& request.getParameter("start")!=null
			&& request.getParameter("end")!=null
			&& request.getParameter("time")!=null)
		{

			String name=request.getParameter("name");
			String fees=request.getParameter("fees");
			String course=request.getParameter("course");
			String start=request.getParameter("start");
			String end=request.getParameter("end");
			String time=request.getParameter("time");
			  if(ba.addBatch(name, course, time, start, end, fees)==1){
				  //  session.setAttribute("user", ""+name);
				  //Session
					response.sendRedirect("add_batch.jsp?status=successfully");
			  }
			
			
			
			else{
				response.sendRedirect("login.jsp?login=error");
						
			}
				
		}
	}

}
