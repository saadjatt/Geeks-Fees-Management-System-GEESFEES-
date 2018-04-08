package fms.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.text.*;



@WebServlet("/StudentsServlet")
public class StudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		fms.dao.StudentsDAO ba = new fms.daoimpl.StudentsDAOImpl();
		 fms.dao.FeesDAO f = new fms.daoimpl.FeesDAOImpl();
		if(request.getParameter("stdname")!=null 
			&& request.getParameter("surname")!=null
			&& request.getParameter("institude")!=null
			&& request.getParameter("dept")!=null
			&& request.getParameter("phone")!=null
			&& request.getParameter("email")!=null
			&& request.getParameter("fees")!=null
			&& request.getParameter("stdid")!=null
			
			){
		String stdname=request.getParameter("stdname");
		String surname=request.getParameter("surname");
		String institude=request.getParameter("institude");
		String department=	 request.getParameter("dept");
		String phone=	 request.getParameter("phone");
		String email=	 request.getParameter("email");
		String fees=	 request.getParameter("fees");
		int stdid=	Integer.parseInt( request.getParameter("stdid"));
		int batchid=Integer.parseInt(	 request.getParameter("batch"));
			
		
	if (ba.editStudents(stdname, surname, institude, department, phone, email, fees, batchid, stdid)==1 ){
		if( f.editFeesAndBatch(stdid, batchid, fees)==1){
		
		response.sendRedirect("profile_std.jsp?std_id="+stdid);
		}
		else if(f.editFeesAndBatch(stdid, batchid, fees)==0){
			response.sendRedirect("profile_std.jsp?std_id="+stdid);
			
		}
		
	}
	}
	}
		
		
		
	
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// HttpSession session = request.getSession();
		 fms.dao.StudentsDAO ba = new fms.daoimpl.StudentsDAOImpl();
		 fms.dao.FeesDAO f = new fms.daoimpl.FeesDAOImpl();
		if(request.getParameter("name")!=null 
			&& request.getParameter("surname")!=null
			&& request.getParameter("institude")!=null
			&& request.getParameter("department")!=null
			&& request.getParameter("contact")!=null
			&& request.getParameter("email")!=null
			&& request.getParameter("batch")!=null
			
			)
		{

			String name=request.getParameter("name");
			String surname=request.getParameter("surname");
			String institude=request.getParameter("institude");
			String department=request.getParameter("department");
			String contact=request.getParameter("contact");
			String email=request.getParameter("email");
			int batch_id=Integer.parseInt(request.getParameter("batch"));
			
			 Date dNow = new Date();
		      SimpleDateFormat ft = new SimpleDateFormat ("MM.dd.yyyy");
		     
		      
		      
		      
			String admissiondate=""+ft.format(dNow);
			dNow.setMonth( dNow.getMonth() + 1 );
			String nextmonthdate= ""+ft.format(dNow);
			
			
			  if(ba.addStudents(name, surname, institude, department, contact, email, admissiondate, batch_id)==1){
				  //  session.setAttribute("user", ""+name);
				  //Session
				  int studentid=ba.getStudentId(name, contact, email);
				  String b_fees=ba.getBatchFees(batch_id);
				  
				  f.addFeesForNewAdmission(studentid, batch_id, admissiondate, "pending", b_fees,nextmonthdate);
				  
				  
					response.sendRedirect("add_students.jsp?login=success");
			  }
			  else{
				  response.sendRedirect("add_students.jsp?login=error");
			  }
			
			
			
			
				
		}
	}

}
