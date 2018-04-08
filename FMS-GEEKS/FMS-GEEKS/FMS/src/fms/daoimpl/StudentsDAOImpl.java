package fms.daoimpl;
import com.mysql.jdbc.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import fms.model.*;
import fms.dao.*;


public class StudentsDAOImpl implements StudentsDAO{
	static	Connection conn = (Connection) fms.connection.DBconnector.getDBConnection();
	
	public ArrayList <StudentsBean> showStudents(){
		ArrayList <StudentsBean> list = new ArrayList<>();
		int id,batch_id;
		String name,surname,admissiondate,institude,phone,email,batch_name,department;
		try{
			String q ="SELECT * FROM students  s INNER JOIN batch b ON s.batch_id = b.id";
			PreparedStatement ps  = conn.prepareStatement(q);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				id= rs.getInt(1);
				name=rs.getString(2);
				surname=rs.getString(3);
				institude=rs.getString(4);
				department=rs.getString(5);
				phone=rs.getString(6);
				email=rs.getString(7);
				admissiondate=rs.getString(8);
				batch_id= rs.getInt(9);
				batch_name= rs.getString(11);
				
				
				list.add(new StudentsBean(id, name, surname, institude, department, phone, email, admissiondate, batch_id, batch_name));
				
		
			}
		}
		catch(Exception e){}
		
		return list;
		}
	
	public ArrayList <StudentsBean> searchStudents(String namee){
		ArrayList <StudentsBean> list = new ArrayList<>();
		int id,batch_id;
		String name,surname,admissiondate,institude,phone,email,batch_name,department;
		try{
			String q ="SELECT * FROM students  s INNER JOIN batch b ON s.batch_id = b.id WHERE s.name LIKE '%"+namee+"%'";
			PreparedStatement ps  = conn.prepareStatement(q);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				id= rs.getInt(1);
				name=rs.getString(2);
				surname=rs.getString(3);
				institude=rs.getString(4);
				department=rs.getString(5);
				phone=rs.getString(6);
				email=rs.getString(7);
				admissiondate=rs.getString(8);
				batch_id= rs.getInt(9);
				batch_name= rs.getString(11);
				
				
				list.add(new StudentsBean(id, name, surname, institude, department, phone, email, admissiondate, batch_id, batch_name));
				
		
			}
		}
		catch(Exception e){}
		
		return list;
		}
	
	public ArrayList <StudentsBean> getStudentData(int stdid){
		ArrayList <StudentsBean> list = new ArrayList<>();
		int id,batch_id;
		String name,surname,admissiondate,institude,phone,email,batch_name,department;
		try{
			String q ="SELECT * FROM students  s INNER JOIN batch b ON s.batch_id = b.id where s.id="+stdid+"";
			PreparedStatement ps  = conn.prepareStatement(q);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				id= rs.getInt(1);
				name=rs.getString(2);
				surname=rs.getString(3);
				institude=rs.getString(4);
				department=rs.getString(5);
				phone=rs.getString(6);
				email=rs.getString(7);
				admissiondate=rs.getString(8);
				batch_id= rs.getInt(9);
				batch_name= rs.getString(11);
				
				
				list.add(new StudentsBean(id, name, surname, institude, department, phone, email, admissiondate, batch_id, batch_name));
				
		
			}
		}
		catch(Exception e){}
		
		return list;
		}

	
	public ArrayList <StudentsBean> getStudentDataForBatch(){
		ArrayList <StudentsBean> list = new ArrayList<>();
		int id,batch_id;
		String name,surname,admissiondate,institude,phone,email,batch_name,department;
		try{
			String q ="SELECT * FROM students  s INNER JOIN batch b ON s.batch_id = b.id ";
			PreparedStatement ps  = conn.prepareStatement(q);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				id= rs.getInt(1);
				name=rs.getString(2);
				surname=rs.getString(3);
				institude=rs.getString(4);
				department=rs.getString(5);
				phone=rs.getString(6);
				email=rs.getString(7);
				admissiondate=rs.getString(8);
				batch_id= rs.getInt(9);
				batch_name= rs.getString(11);
				
				
				list.add(new StudentsBean(id, name, surname, institude, department, phone, email, admissiondate, batch_id, batch_name));
				
		
			}
		}
		catch(Exception e){}
		
		return list;
		}
	
	public int addStudents(String name,String surname, String institude,String department,String phone,String email,String admissiondate,int batch_id){
		int i=0;
		try
		{
			String query = "INSERT INTO students ( NAME, surname, institude, department, phone, email, admissiondate, batch_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" ;
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, surname);
			ps.setString(3, institude);
			ps.setString(4, department);
			ps.setString(5, phone);
			ps.setString(6, email);
			ps.setString(7, admissiondate);
			ps.setInt(8, batch_id);
			
			
		i=	ps.executeUpdate();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
		}

	public int getStudentId(String name,String contact, String email){

		int student_id=0;

		try{
			String q ="SELECT id FROM students WHERE NAME='"+name+"' AND phone='"+contact+"' AND email='"+email+"'";
			PreparedStatement ps  = conn.prepareStatement(q);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				student_id= rs.getInt(1);
						
				
				
				
		
			}
		}
		catch(Exception e){}
		
		return student_id;
		}
	
	public String getBatchFees(int batch_id){

		String fees="";

		try{
			String q ="SELECT fees FROM batch WHERE id='"+batch_id+"'" ;
			PreparedStatement ps  = conn.prepareStatement(q);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				fees= rs.getString(1);
						
				
				
				
		
			}
		}
		catch(Exception e){}
		
		return fees;
		}

	@Override
	public int countRows() {
		int counter=0;
		try{
			String q = "select count(*) as counter from students";
			PreparedStatement ps = conn.prepareStatement(q);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				counter = rs.getInt("counter");
			}
			
		}
		catch(Exception e){}
		
		return counter;
	}

	@Override
	public int editStudents(String name, String surname, String institude,
			String department, String phone, String email, String fees,
			int batch_id, int stdid) {
		int i=0;
			try{
			
			   String query = "UPDATE students SET NAME =? , surname = ? , institude = ? , department = ? , phone = ? , email = ? , batch_id = ? WHERE id = '"+stdid+"'";
				PreparedStatement ps = conn.prepareStatement(query);
				
				ps.setString(1, name);
				ps.setString(2, surname);
				ps.setString(3, institude);
				ps.setString(4, department);
				ps.setString(5, phone);
				ps.setString(6, email);
				ps.setString(7, ""+batch_id);
			
				i=ps.executeUpdate();
		}
		catch(Exception e){}
		return i;
	}

	@Override
	public int deleteStudent(int id) {
		int i=0;
		try{
		
		   String query = "DELETE FROM students WHERE id = '"+id+"';";
			PreparedStatement ps = conn.prepareStatement(query);
			
			
			i=ps.executeUpdate();
			deleteStudentFromFees(id);
	}
	catch(Exception e){}
	return i;
	}
	
	

	public int deleteStudentFromFees(int id) {
		int i=0;
		try{
		
		   String query = "DELETE FROM fees WHERE student_id = '"+id+"';";
			PreparedStatement ps = conn.prepareStatement(query);
			
			
			i=ps.executeUpdate();
	}
	catch(Exception e){}
	return i;
	}


	}
	

