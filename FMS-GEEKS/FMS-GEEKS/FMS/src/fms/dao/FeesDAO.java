package fms.dao;
import java.util.ArrayList;

import fms.model.*;

public interface FeesDAO {
public ArrayList<FeesBean> viewAllStudentFeesStatus();
public ArrayList<FeesBean> viewAllPendingFees();
public ArrayList<FeesBean> viewAllSubmitFees();
public int submitFees(int id,String monthDate);
public int addFeesForNewAdmission(int student_id,int batch_id,String dateforsubmission,String status,String fees,String nextmonthdate);
public int totalSubmitFeesCount();
public int totalPendingFeesCount();
public int totalSubmitStudentsCount();
public int totalAllStudentsCount();
public ArrayList<FeesBean> getFeesAlertOneDayBefore();
public int getFeesAlertCount();
public int editFeesAndBatch(int id,int batchid,String name);
public ArrayList<FeesBean> studentRecord(int stdid);
public ArrayList<FeesBean> getFeesAlertNotSubmittedYet();


}
