package fms.controller;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;





public class DBmanager {
	
public	static	Connection conn = (Connection) fms.connection.DBconnector.getDBConnection();

public static boolean Userlogin(String uemail , String upass )
{	boolean flag=false;
	try
	{
		String query = "Select uemail, upass  from login where  uemail=? and upass=? " ;
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, uemail);
		ps.setString(2, upass);
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

	
	public static void addStudentname(String name)
	{	
		try
		{
			String query = "INSERT INTO stdname (NAME) VALUES (?)" ;
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	
	public static void delName(int id)
	{	
		try
		{
			String query = "DELETE FROM stdname WHERE id = ?" ;
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	public static void updateName(int id,String name)
	{	
		try
		{
			String query = "UPDATE stdname SET name = ? WHERE id =?" ;
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setInt(2, id);
			
			ps.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	public static String getPerticularName(int id)
	{	String name="";

	
		try
		{
			String query = "Select * from stdname where id = ? " ;
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
	
			  ResultSet rs = ps.executeQuery();
			  while(rs.next()){
				name=rs.getString(2);  
			
			  
			 
			  }			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return name;
	}
	/*
	
	
	public static ArrayList<StudentBean> getStdName()
	{	
		ArrayList<StudentBean> list = new ArrayList<>();
		try
		{
			  PreparedStatement pst = conn.prepareStatement
					  ("Select * from stdname");
					  ResultSet rs = pst.executeQuery();
					  while(rs.next()){
					  list.add(new StudentBean(rs.getInt(1),rs.getString(2) ));
					  
					 
					  }
		
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}
	*/

}
