package fms.connection;
import java.sql.Connection;
import java.sql.DriverManager;


public class DBconnector {
private static Connection conn = null;
	
	private DBconnector()
	{
		
	}
	
	public static Connection getDBConnection()
	{
		try
		{
			if(conn==null)
			{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fms","root","");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return conn;
	}

	
}
