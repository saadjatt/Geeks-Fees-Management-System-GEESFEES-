package fms.model;

public class FeesBean {
String studentname;


public FeesBean(Integer studentid,String studentname, String batchname, String submitteddate,
		String dateforsubmission, String status, String fees) {
	super();
	this.studentname = studentname;
	this.batchname = batchname;
	this.submitteddate = submitteddate;
	this.dateforsubmission = dateforsubmission;
	this.status = status;
	this.fees = fees;
	this.studentid = studentid;
}
public String getStudentname() {
	return studentname;
}
public void setStudentname(String studentname) {
	this.studentname = studentname;
}
public String getBatchname() {
	return batchname;
}
public void setBatchname(String batchname) {
	this.batchname = batchname;
}
public String getSubmitteddate() {
	return submitteddate;
}
public void setSubmitteddate(String submitteddate) {
	this.submitteddate = submitteddate;
}
public String getDateforsubmission() {
	return dateforsubmission;
}
public void setDateforsubmission(String dateforsubmission) {
	this.dateforsubmission = dateforsubmission;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
String batchname;
String submitteddate;
String dateforsubmission;
String status;
String fees;
public String getFees() {
	return fees;
}
public void setFees(String fees) {
	this.fees = fees;
}
Integer studentid;
public Integer getStudentid() {
	return studentid;
}
public void setStudentid(Integer studentid) {
	this.studentid = studentid;
}

}
