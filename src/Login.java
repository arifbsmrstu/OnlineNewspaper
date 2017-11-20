

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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		
		try
		{
			
			if(email.isEmpty() || password.isEmpty()) {
				out.println("<br><center>Please fill all requirements.</center>");
				RequestDispatcher rd = request.getRequestDispatcher("sign-in.jsp");
				rd.include(request, response);
			}
			else {
				ServletContext sc = getServletContext();
				Connection conn=(Connection)sc.getAttribute("MyConn");
			PreparedStatement pst = conn.prepareStatement("select * from onp_users where email=? and password=?");
		      pst.setString(1, email);
		      pst.setString(2, password);
		 
		      ResultSet rs = pst.executeQuery();
		      
		      if(rs.next()){
		    	  
		    	  String name = rs.getString("name");
		    	  
		    	  HttpSession session = request.getSession();
		    	  session.setAttribute("username", name);
		    	  session.setAttribute("email", email);
		    	  response.sendRedirect("home.jsp");
		      }
		      else{
		    	  out.println("<center>Please enter correct email and password</center>");
		    	  RequestDispatcher rd = request.getRequestDispatcher("sign-in.jsp");
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
