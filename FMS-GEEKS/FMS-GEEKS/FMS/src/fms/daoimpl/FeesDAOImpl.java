package fms.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;



import java.util.Date;

import com.mysql.jdbc.Connection;

import fms.dao.FeesDAO;
import fms.model.FeesBean;

public class FeesDAOImpl implements FeesDAO{
	static	Connection conn = (Connection) fms.connection.DBconnector.getDBConnection();
	@Override
	public ArrayList<FeesBean> viewAllStudentFeesStatus() {
		ArrayList <FeesBean> list = new ArrayList <>();
		try{
			String query="SELECT s.id AS studentid ,s.name AS studentname,b.name AS batchname,f.submitteddate,f.dateforsubmission,f.status,b.fees FROM batch b INNER JOIN students s ON s.batch_id = b.id INNER JOIN fees f ON f.student_id = s.id  ";
			PreparedStatement pr = conn.prepareStatement(query);
			ResultSet rs = pr.executeQuery();
			while (rs.next()){
				int studentid =rs.getInt(1);
				String studentname =rs.getString(2);
				String batchname =rs.getString(3);
				String submitteddate =rs.getString(4);
				String dateforsubmission =rs.getString(5);
				String status =rs.getString(6);
				String fees =rs.getString(7);

				
				
				
				list.add(new FeesBean(studentid,studentname, batchname, submitteddate, dateforsubmission, status,fees));
			}
		}
		catch(Exception e){
			
		}
		
		return list;
	}
	@Override
	public ArrayList<FeesBean> viewAllPendingFees() {
		ArrayList <FeesBean> list = new ArrayList <>();
		try{
			String query="SELECT s.id AS studentid ,s.name AS studentname,b.name AS batchname,f.submitteddate,f.dateforsubmission,f.status,b.fees FROM batch b INNER JOIN students s ON s.batch_id = b.id INNER JOIN fees f ON f.student_id = s.id  WHERE f.status='pending'";
			PreparedStatement pr = conn.prepareStatement(query);
			ResultSet rs = pr.executeQuery();
			while (rs.next()){
				int studentid =rs.getInt(1);
				String studentname =rs.getString(2);
				String batchname =rs.getString(3);
				String submitteddate =rs.getString(4);
				String dateforsubmission =rs.getString(5);
				String status =rs.getString(6);
				String fees =rs.getString(7);
		
				
				
				
				list.add(new FeesBean(studentid,studentname, batchname, submitteddate, dateforsubmission, status,fees));
			}
		}
		catch(Exception e){
			
		}
		
		return list;
	}

	public ArrayList<FeesBean> getFeesAlertOneDayBefore() {
		ArrayList <FeesBean> list = new ArrayList <>();
		try{
			String query="SELECT f.student_id AS studentid ,s.name AS studentname,b.name AS batchname,f.fees AS fees  FROM fees f INNER JOIN Students s ON f.student_id=s.id INNER JOIN batch b ON f.batch_id = b.id WHERE DATE_FORMAT(DATE_SUB(STR_TO_DATE(nextmonthdate,'%m.%d.%Y' ), INTERVAL 1 DAY), '%m.%d.%Y') = DATE_FORMAT(CURDATE(),'%m.%d.%Y' ) AND STATUS = 'pending' ORDER BY f.dateforsubmission";
			
			PreparedStatement pr = conn.prepareStatement(query);
			ResultSet rs = pr.executeQuery();
			while (rs.next()){
				int studentid =rs.getInt("studentid");
				String studentname =rs.getString("studentname");
				String batchname =rs.getString("batchname");
				String submitteddate ="";
				String dateforsubmission ="";
				String status ="";
				String fees =rs.getString("fees");
		
				
				
				
				list.add(new FeesBean(studentid,studentname, batchname, submitteddate, dateforsubmission, status,fees));
			}
		}
		catch(Exception e){
			
		}
		
		return list;
	}
	
	public ArrayList<FeesBean> getFeesAlertNotSubmittedYet() {
		ArrayList <FeesBean> list = new ArrayList <>();
		try{
			String query="SELECT f.student_id AS studentid ,s.name AS studentname,b.name AS batchname,f.fees AS fees  FROM fees f INNER JOIN Students s ON f.student_id=s.id INNER JOIN batch b ON f.batch_id = b.id WHERE DATE_FORMAT(DATE_SUB(STR_TO_DATE(nextmonthdate,'%m.%d.%Y' ), INTERVAL 1 DAY), '%m.%d.%Y') > DATE_FORMAT(CURDATE(),'%m.%d.%Y' ) AND STATUS = 'pending' ORDER BY f.dateforsubmission";
			
			PreparedStatement pr = conn.prepareStatement(query);
			ResultSet rs = pr.executeQuery();
			while (rs.next()){
				int studentid =rs.getInt("studentid");
				String studentname =rs.getString("studentname");
				String batchname =rs.getString("batchname");
				String submitteddate ="";
				String dateforsubmission ="";
				String status ="";
				String fees =rs.getString("fees");
		
				
				
				
				list.add(new FeesBean(studentid,studentname, batchname, submitteddate, dateforsubmission, status,fees));
			}
		}
		catch(Exception e){
			
		}
		
		return list;
	}
	
	@Override
	public ArrayList<FeesBean> viewAllSubmitFees() {
		ArrayList <FeesBean> list = new ArrayList <>();
		try{
			String query="SELECT s.id AS studentid ,s.name AS studentname,b.name AS batchname,f.submitteddate,f.dateforsubmission,f.status,b.fees FROM batch b INNER JOIN students s ON s.batch_id = b.id INNER JOIN fees f ON f.student_id = s.id  WHERE f.status='submit'";
			PreparedStatement pr = conn.prepareStatement(query);
			ResultSet rs = pr.executeQuery();
			while (rs.next()){
				int studentid =rs.getInt(1);
				String studentname =rs.getString(2);
				String batchname =rs.getString(3);
				String submitteddate =rs.getString(4);
				String dateforsubmission =rs.getString(5);
				String status =rs.getString(6);
				String fees =rs.getString(7);
		
				
				
				
				list.add(new FeesBean(studentid,studentname, batchname, submitteddate, dateforsubmission, status,fees));
			}
		}
		catch(Exception e){
			
		}
		
	return list;
	}
	
	public void dateCheck(String date,int std_id,String traverse) {
		int check=0;
		try{
			String query="SELECT * FROM fees WHERE DATE_FORMAT(CURDATE(), '%m.%d.%Y')>='"+date+"' and   student_id="+std_id+" AND traverse = '"+traverse+"' ";
			PreparedStatement pr = conn.prepareStatement(query);
			ResultSet rs = pr.executeQuery();
			
			if(rs.next()){
				int index=rs.getInt("id");
				int student_id=rs.getInt("student_id");
				int batch_id =rs.getInt("batch_id");
				String nextmonthdate =rs.getString("nextmonthdate");
				String fees =rs.getString("fees");
				
				String nextToNextmonthdate=nextMonthDateCalculate(nextmonthdate);
				check =insertFees(index,student_id,batch_id,nextmonthdate,"pending",fees,nextToNextmonthdate);
				return;
				
			}
			else if(!rs.next()){
				return;
			}
	

		}
		catch(Exception e){}
		
	
	}
	
	
	public void feeManagement() {
	
		try{
			String query="SELECT * FROM fees ";
			PreparedStatement pr = conn.prepareStatement(query);
			ResultSet rs = pr.executeQuery();
			while (rs.next()){
				int student_id=rs.getInt("student_id");
				String nextmonthdate =rs.getString("nextmonthdate");
				String traverse =rs.getString("traverse");
				if (traverse.equals("false")){
				dateCheck(nextmonthdate,student_id,traverse);
				}
				
			}
		}
		catch(Exception e){}
		
	
	}
	
public int insertFees (int index,int student_id,int batch_id,String dateforsubmission,String status,String fees,String nextmonthdate){
	int i =0;
	try
	{
		String query = "INSERT INTO fees (student_id, batch_id, dateforsubmission,STATUS, fees,nextmonthdate) VALUES (?, ?, ?, ?,?,?)" ;
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setInt(1, student_id);
		ps.setInt(2, batch_id);
		ps.setString(3, dateforsubmission);
		ps.setString(4, status);
		ps.setString(5, fees);
		ps.setString(6, nextmonthdate);
		
		
		updateTraverse(index);
		
	i=	ps.executeUpdate();
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return i;
	
}	

public int updateTraverse (int index){
	int i =0;
	try
	{
		String query = "UPDATE fees SET traverse = 'ture' WHERE id = ? " ;
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setInt(1, index);
	i=	ps.executeUpdate();
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return i;
	
}	
	
public String nextMonthDateCalculate(String date){
	String newdate="";
	try{
	
	String nextdatequery="SELECT DATE_FORMAT(DATE_ADD(STR_TO_DATE('"+date+"', '%m.%d.%Y'), INTERVAL +1 MONTH), '%m.%d.%Y') as newdate";
	PreparedStatement pr = conn.prepareStatement(nextdatequery);
		ResultSet rs = pr.executeQuery();
		while (rs.next()){
			newdate=rs.getString("newdate");
		}
	}
	catch(Exception e){}
	
		return newdate;
	
}	
	
public int submitFees(int id,String monthDate){
	int i=0;
	Date dNow = new Date();
	
	
    SimpleDateFormat ft = new SimpleDateFormat ("MM.dd.yyyy");
    
    
	String curdate=""+ft.format(dNow);
	try{
		
		   String query = "UPDATE fees SET submitteddate ='"+curdate+"' , STATUS = 'submit' WHERE student_id = '"+id+"' and  dateforsubmission='"+monthDate+"' " ;
			PreparedStatement ps = conn.prepareStatement(query);
		
			i=ps.executeUpdate();
	}
	catch(Exception e){}
	return i;
}

public int addFeesForNewAdmission(int student_id,int batch_id,String dateforsubmission,String status,String fees,String nextmonthdate){
	int i=0;
	try
	{
		String query = "INSERT INTO fees (student_id, batch_id, dateforsubmission,STATUS, fees,nextmonthdate) VALUES (?, ?, ?, ?,?,?)" ;
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setInt(1, student_id);
		ps.setInt(2, batch_id);
		ps.setString(3, dateforsubmission);
		ps.setString(4, status);
		ps.setString(5, fees);
		ps.setString(6,nextmonthdate );
		
		
	i=	ps.executeUpdate();
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return i;
	}

@Override
public int totalSubmitFeesCount() {
	int counter=0;
	
	try{
		String query="SELECT SUM(fees) AS total FROM fees WHERE STATUS= 'submit'";
		PreparedStatement ps = conn.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		while (rs.next()){
		counter = rs.getInt("total");
		}
	}
	catch(Exception e){}
	
	return counter;
}
@Override
public int totalPendingFeesCount() {
	int counter=0;
	
	try{
		String query="SELECT SUM(fees) AS total FROM fees WHERE STATUS= 'pending'";
		PreparedStatement ps = conn.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		while (rs.next()){
		counter = rs.getInt("total");
		}
	}
	catch(Exception e){}
	
	return counter;

}
@Override
public int totalSubmitStudentsCount() {
	int counter=0;
	
	try{
		String query="SELECT COUNT(*) AS submitcount FROM fees WHERE STATUS= 'submit' AND  dateforsubmission<=DATE_FORMAT(CURDATE(), '%m.%d.%Y') AND nextmonthdate>=DATE_FORMAT(CURDATE(), '%m.%d.%Y') ";
		PreparedStatement ps = conn.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		while (rs.next()){
		counter = rs.getInt("submitcount");
		}
	}
	catch(Exception e){}
	
	return counter;

}
@Override
public int totalAllStudentsCount() {
	int counter=0;
	
	try{
		String query="SELECT COUNT(*) AS allcount FROM fees WHERE  dateforsubmission<=DATE_FORMAT(CURDATE(), '%m.%d.%Y') AND nextmonthdate>=DATE_FORMAT(CURDATE(), '%m.%d.%Y') ";
		PreparedStatement ps = conn.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		while (rs.next()){
		counter = rs.getInt("allcount");
		}
	}
	catch(Exception e){}
	
	return counter;
}
@Override
public int getFeesAlertCount() {
int counter=0;
	
	try{
		String query="SELECT COUNT(*) AS counter FROM fees f INNER JOIN Students s ON f.student_id=s.id INNER JOIN batch b ON f.batch_id = b.id WHERE DATE_FORMAT(DATE_SUB(STR_TO_DATE(nextmonthdate,'%m.%d.%Y' ), INTERVAL 1 DAY), '%m.%d.%Y') >= DATE_FORMAT(CURDATE(),'%m.%d.%Y' ) AND STATUS = 'pending' ";
		PreparedStatement ps = conn.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		while (rs.next()){
		counter = rs.getInt("counter");
		}
	}
	catch(Exception e){}
	
	return counter;	
}
@Override
public int editFeesAndBatch(int id,int batchid,String fees ) {
	int i=0;
	try{
	
	   String query = " UPDATE fees SET batch_id = ? , fees = ? WHERE student_id = '"+id+"' and  status='pending'  ";
		PreparedStatement ps = conn.prepareStatement(query);
		
		ps.setString(1, ""+batchid);
		
		ps.setString(2, fees);
	
		i=ps.executeUpdate();
}
catch(Exception e){}
return i;
}

public ArrayList<FeesBean> studentRecord(int stdid) {
	ArrayList <FeesBean> list = new ArrayList <>();
	try{
		String query="SELECT * FROM fees WHERE student_id ="+stdid+" ORDER BY dateforsubmission";
		PreparedStatement pr = conn.prepareStatement(query);
		ResultSet rs = pr.executeQuery();
		while (rs.next()){
			int studentid =rs.getInt("student_id");
			String studentname ="";
			String batchname =rs.getString("submitteddate");
			String submitteddate =rs.getString("nextmonthdate");
			String dateforsubmission =rs.getString("dateforsubmission");
			String status =rs.getString("status");
			String fees =rs.getString("fees");

			
			
			
			list.add(new FeesBean(studentid,studentname, batchname, submitteddate, dateforsubmission, status,fees));
		}
	}
	catch(Exception e){
		
	}
	
	return list;
}


}
