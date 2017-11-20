

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class GetImage
 */
@WebServlet("/GetImage")
public class GetImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
        System.out.println(title);
        InputStream sImage;

        // Check if ID is supplied to the request.
        if (title == null) {
            // Do your thing if the ID is not supplied to the request.
            // Throw an exception, or send 404, or show default/warning image, or just ignore it.
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
            return;
        }

        try{
            
        	ServletContext sc = getServletContext();
			Connection conn=(Connection)sc.getAttribute("MyConn");
            PreparedStatement pst = conn.prepareStatement("select * from onp_news where title=?");
		     pst.setString(1, title);
		      
		 
		      ResultSet rs = pst.executeQuery();
            if(rs.next()){

            	Blob image = rs.getBlob("image");
            	byte[] imaData = image.getBytes(1, (int) image.length());
            	OutputStream output = response.getOutputStream();
            	response.setContentType("image/gif");
            	output.write(imaData);
            	output.flush();
            	output.close();
            }

        } catch (Exception e){
            e.printStackTrace();
        }
	}

}
