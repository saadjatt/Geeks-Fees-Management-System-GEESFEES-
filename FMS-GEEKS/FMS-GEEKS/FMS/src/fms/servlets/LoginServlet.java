package fms.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (session.getAttribute("email")!= null){
			
			response.sendRedirect("login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// HttpSession session = request.getSession();
		 fms.dao.UserDAO checkUser = new fms.daoimpl.UserDAOImpl();
		if(request.getParameter("user")!=null && request.getParameter("pass")!=null)
		{
			String name=request.getParameter("user");
			String pass=request.getParameter("pass");
			  if(checkUser.userLogin(name, pass)){
				  //  session.setAttribute("user", ""+name);
				  //Session
					response.sendRedirect("login.jsp?login=success");
			  }
			
			
			
			else{
				response.sendRedirect("login.jsp?login=failed");
						
			}
				
		}
	}

}
