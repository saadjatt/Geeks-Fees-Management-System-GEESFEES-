package fms.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;

import fms.dao.UserDAO;

public class UserDAOImpl implements UserDAO{
	static	Connection conn = (Connection) fms.connection.DBconnector.getDBConnection();
	
	public boolean userLogin(String name, String pass) {	
	boolean flag=false;
	try
	{
		String query = "Select name, password  from user where  name=? and password=? " ;
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, name);
		ps.setString(2, pass);
		ResultSet rs = ps.executeQuery();
		while (rs.next()){
			flag = true;
			
		}
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return flag;
	
	}
}
