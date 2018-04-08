package fms.dao;
import java.util.*;

import fms.model.*;

public interface StudentsDAO {
	public ArrayList<StudentsBean> showStudents();
	public int addStudents(String name,String surname, String institude,String department,String phone,String email,String admissiondate,int batch_id);
	public int editStudents(String name,String surname, String institude,String department,String phone,String email,String fees, int batch_id,int stdid );
	public int getStudentId(String name,String contact, String email);
	public String getBatchFees(int batch_id);
	public ArrayList <StudentsBean> getStudentData(int stdid);
	public int countRows();
	public int deleteStudent(int id);
	public ArrayList <StudentsBean> searchStudents(String namee);
}
