

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
import javax.websocket.Session;

/**
 * Servlet implementation class DoUpload
 */
@WebServlet("/DoUpload")
@MultipartConfig(maxFileSize = 1617721599)    
public class DoUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoUpload() {
        super();
        // TODO Auto-generated constructor stub
    }
    
   
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String detail = request.getParameter("detail");
		String userName = (String) request.getSession(false).getAttribute("username");
		int view = 1;
		
		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		
		InputStream inputStream = null;	// input stream of the upload file
		
		Part filePart = request.getPart("image");
		
		
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}
		
	
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();  
		try {
			
		
			if(title.isEmpty() || detail.isEmpty() || filePart==null) {
				out.println("<br><center>Please fill all requirements. <br />"
						+ "Image size should be less than 16 MB </center>");
				RequestDispatcher rd = request.getRequestDispatcher("upload.jsp");
				rd.include(request, response);
			}
			else {
			
				ServletContext sc = getServletContext();
				Connection conn=(Connection)sc.getAttribute("MyConn");
				PreparedStatement pst = conn.prepareStatement("insert into onp_news values(?,?,?,?,?,?,?,?)");
				 
			      pst.setString(1,title);
			      pst.setString(2,category);  
			      pst.setString(3,userName);
			      pst.setString(4,detail);
			      pst.setTimestamp(5, timestamp);
			      pst.setInt(6, view);
			      pst.setString(7,"No");
			      pst.setBlob(8,inputStream);
			 
			      int i = pst.executeUpdate();
			      if(i!=0){
			    	  out.println("<center>Your news updated successfully</center>");
			    	  RequestDispatcher rd = request.getRequestDispatcher("upload.jsp");
					  rd.include(request, response);
			      }
			      //conn.close();
			}
		      
			
		
		}catch(Exception e) {
			e.printStackTrace();
			out.println(e);
		}
	}

}
