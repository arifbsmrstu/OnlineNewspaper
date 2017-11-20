

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class PostPublish
 */
@WebServlet("/PostPublish")
public class PostPublish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostPublish() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
		
		String title = request.getParameter("title");
	      
	      try {
	    	  ServletContext sc = getServletContext();
				Connection conn=(Connection)sc.getAttribute("MyConn");
	    	  String query = "update onp_news set permission=? where title='"+title+"'";
	          PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
	          preparedStmt.setString(1, "Yes");
	          int i = preparedStmt.executeUpdate();
	         
	          if(i!=0) {
		          out.println("<center>Post Published successfully</center>");
		    	  RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
				  rd.include(request, response);
	          }
	          else {
	        	  out.println("<center>Post not published</center>");
		    	  RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
				  rd.include(request, response);
	          }
	          
	         // conn.close();
	    	  

	      }catch(Exception E) {
	    	  E.printStackTrace();
	      }
	}

}
