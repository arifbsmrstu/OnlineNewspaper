import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DBConnection implements ServletContextListener
{
	
Connection con=null;
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		try{		
			//con.close();
		}catch(Exception ex)
		{
			System.out.println("Error in Closing::"+ex);
		}
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
		try {
			
			Driver driver=new com.mysql.jdbc.Driver();
			DriverManager.registerDriver(driver);			
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/raysrmrc_lict","raysrmrc_afee","raysrmr@123");
            
			 ServletContext sc = sce.getServletContext();
			 sc.setAttribute("MyConn", con);			
			
		} 
		catch(Exception e){
			
			System.out.println("Error:  "+e);
		}
		
	}
}
