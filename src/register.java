import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("conf_password");
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		try
		{
			
			if(name.isEmpty() || email.isEmpty() || password.isEmpty()) {
				out.println("<br><center>Please fill all requirements.</center>");
				RequestDispatcher rd = request.getRequestDispatcher("sign-up.jsp");
				rd.include(request, response);
			}
			else if(!password.equals(confirmPassword)) {
				out.println("<br><center>Password doesn't match.</center>");
				RequestDispatcher rd = request.getRequestDispatcher("sign-up.jsp");
				rd.include(request, response);
			}
			else {
				ServletContext sc = getServletContext();
				Connection conn=(Connection)sc.getAttribute("MyConn");
			PreparedStatement pst = conn.prepareStatement("insert into onp_users values(?,?,?)");
		      pst.setString(1,email);
		      pst.setString(2,name);      
		      pst.setString(3,password);
		 
		      int i = pst.executeUpdate();
		      if(i!=0){
		    	  
		    	  HttpSession session = request.getSession();
		    	  session.setAttribute("username", name);
		    	  session.setAttribute("email", email);
		    	  response.sendRedirect("home.jsp");
		      }
		      else{
		    	  out.println("Failed to register, Please try later");
		    	  RequestDispatcher rd = request.getRequestDispatcher("sign-up.jsp");
				  rd.include(request, response);
		       }
		     // conn.close();
			}
		}
		catch(Exception e)
		{
			System.out.print(e);
			e.printStackTrace();
		}
	}

}
