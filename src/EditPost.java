

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class EditPost
 */
@WebServlet("/EditPost")
@MultipartConfig(maxFileSize = 1617721599)   
public class EditPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String detail = request.getParameter("detail");
		
	
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter(); 
		
		try {
			
		
			if(title.isEmpty() || detail.isEmpty() ) {
				out.println("<br><center>Please fill all requirements. <br />"
						+ "Image size should be less than 16 MB </center>");
				RequestDispatcher rd = request.getRequestDispatcher("admin_edit.jsp");
				rd.include(request, response);
			}
			else {
			
				ServletContext sc = getServletContext();
				Connection conn=(Connection)sc.getAttribute("MyConn");
				PreparedStatement pst = conn.prepareStatement("update onp_news set category=?,details=? where title=?");
				 
			      
			      pst.setString(1,category);  
			      pst.setString(2,detail);
			      pst.setString(3,title);
			 
			      int i = pst.executeUpdate();
			      if(i!=0){
			    	  out.println("<center>Your news updated successfully</center>");
			    	  RequestDispatcher rd = request.getRequestDispatcher("admin_edit.jsp");
					  rd.include(request, response);
			      }
			     // conn.close();
			}
		      
			
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
