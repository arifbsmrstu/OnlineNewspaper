

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		try
		{
			
			if(name.isEmpty() || password.isEmpty()) {
				out.println("<br><center>Please fill all requirements.</center>");
				RequestDispatcher rd = request.getRequestDispatcher("admin-login.jsp");
				rd.include(request, response);
			}
			else {
			ServletContext sc = getServletContext();
			Connection conn=(Connection)sc.getAttribute("MyConn");
			PreparedStatement pst = conn.prepareStatement("select * from onp_admin where username=? and password=?");
		      pst.setString(1, name);
		      pst.setString(2, password);
		 
		      ResultSet rs = pst.executeQuery();
		      
		      if(rs.next()){
		    	  
		    
		    	  
		    	  HttpSession session = request.getSession();
		    	  session.setAttribute("name", name);
		    	  response.sendRedirect("admin-index.jsp");
		      }
		      else{
		    	  out.println("<center>Please enter correct email and password</center>");
		    	  RequestDispatcher rd = request.getRequestDispatcher("admin-login.jsp");
				  rd.include(request, response);
		       }
		      //conn.close();
			}
			
		}
		catch(Exception e)
		{
			System.out.print(e);
			e.printStackTrace();
		}
	}

}
