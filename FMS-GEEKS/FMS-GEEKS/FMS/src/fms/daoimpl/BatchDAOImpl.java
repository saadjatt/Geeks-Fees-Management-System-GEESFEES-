package fms.daoimpl;

import java.sql.PreparedStatement;


import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;

import fms.dao.BatchDAO;
import fms.model.BatchBean;


public class BatchDAOImpl implements BatchDAO{
	static	Connection conn = (Connection) fms.connection.DBconnector.getDBConnection();
	
	
	
	public int addBatch(String name,String course, String timing,String start,String end,String fees){
		int i=0;
		try
		{
			String query = "INSERT INTO batch (name, course, fees, starting_date, ending_date, time) VALUES (?,?,?, ?, ?, ?)" ;
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, course);
			ps.setString(3, fees);
			ps.setString(4, start);
			ps.setString(5, end);
			ps.setString(6, timing);
			
		i=	ps.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
		}
	public int editBatch(int batch_id,String name,String course, String timing,String start,String end,String fees){
		int i=0;
		try
		{
			String query = "UPDATE batch SET NAME = ? , course = ? , fees = ? , starting_date = ? , ending_date = ? , TIME = ? WHERE id = '"+batch_id+"'; " ;
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, course);
			ps.setString(3, fees);
			ps.setString(4, start);
			ps.setString(5, end);
			ps.setString(6, timing);
			
		i=	ps.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
		}

public ArrayList<BatchBean> viewAllBatch(){
	ArrayList<BatchBean> list= new ArrayList<>();
	try{
		String query="Select * from batch";
		PreparedStatement pr = conn.prepareStatement(query);
		ResultSet rs = pr.executeQuery();
		while (rs.next()){
			int id =rs.getInt(1);
			String name =rs.getString(2);
			String course =rs.getString(3);
			String fee =rs.getString(4);
			String start =rs.getString(5);
			String end =rs.getString(6);
			String time =rs.getString(7);
			
			
			
			list.add(new BatchBean(id, name, course, time, start, end, fee));
		}
	}
	catch(Exception e){
		
	}
	return list ;
}

public ArrayList<BatchBean> searchBatch(String n){
	ArrayList<BatchBean> list= new ArrayList<>();
	try{
		String query="Select * from batch where name like '%"+n+"%'";
		PreparedStatement pr = conn.prepareStatement(query);
		ResultSet rs = pr.executeQuery();
		while (rs.next()){
			int id =rs.getInt(1);
			String name =rs.getString(2);
			String course =rs.getString(3);
			String fee =rs.getString(4);
			String start =rs.getString(5);
			String end =rs.getString(6);
			String time =rs.getString(7);
			
			
			
			list.add(new BatchBean(id, name, course, time, start, end, fee));
		}
	}
	catch(Exception e){
		
	}
	return list ;
}

public ArrayList<BatchBean> getBatch(int idd){
	ArrayList<BatchBean> list= new ArrayList<>();
	try{
		String query="Select * from batch where id="+idd+"";
		PreparedStatement pr = conn.prepareStatement(query);
		ResultSet rs = pr.executeQuery();
		while (rs.next()){
			int id =rs.getInt(1);
			String name =rs.getString(2);
			String course =rs.getString(3);
			String fee =rs.getString(4);
			String start =rs.getString(5);
			String end =rs.getString(6);
			String time =rs.getString(7);
			
			
			
			list.add(new BatchBean(id, name, course, time, start, end, fee));
		}
	}
	catch(Exception e){
		
	}
	return list ;
}

@Override
public int countRows(){
	int counter=0;
	try{
		String query="Select count(*) as counter from batch";
		PreparedStatement pe =conn.prepareStatement(query);
		ResultSet rs = pe.executeQuery();
		while(rs.next()){
			counter=rs.getInt("counter");
		}
	}
	catch(Exception e){
		
	}
	return counter;
}
@Override
public int deleteBatch(int batch_id) {
	int i=0;
	try{
	
	   String query = "DELETE FROM batch WHERE id = '"+batch_id+"';";
		PreparedStatement ps = conn.prepareStatement(query);
		
		
		i=ps.executeUpdate();
		deleteStudentFromFees(batch_id);
		deleteStudentFromStudent(batch_id);
}
catch(Exception e){}
return i;
}



public int deleteStudentFromFees(int id) {
	int i=0;
	try{
	
	   String query = "DELETE FROM fees WHERE batch_id = '"+id+"';";
		PreparedStatement ps = conn.prepareStatement(query);
		
		
		i=ps.executeUpdate();
}
catch(Exception e){}
return i;
}

public int deleteStudentFromStudent(int id) {
	int i=0;
	try{
	
	   String query = "DELETE FROM students WHERE batch_id = '"+id+"';";
		PreparedStatement ps = conn.prepareStatement(query);
		
		
		i=ps.executeUpdate();
}
catch(Exception e){}
return i;
}
	
}
