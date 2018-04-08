package fms.model;

public class StudentsBean {
private Integer id ,batch_id;
private String name,surname,institude,department,contact,email,admissiondate,batch_name;
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public Integer getBatch_id() {
	return batch_id;
}
public void setBatch_id(Integer batch_id) {
	this.batch_id = batch_id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getSurname() {
	return surname;
}
public void setSurname(String surname) {
	this.surname = surname;
}
public String getInstitude() {
	return institude;
}
public void setInstitude(String institude) {
	this.institude = institude;
}
public String getDepartment() {
	return department;
}
public void setDepartment(String department) {
	this.department = department;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getAdmissiondate() {
	return admissiondate;
}
public void setAdmissiondate(String admissiondate) {
	this.admissiondate = admissiondate;
}

public String getBatch_name() {
	return batch_name;
}
public void setBatch_name(String batch_name) {
	this.batch_name = batch_name;
}
public StudentsBean(Integer id,String name, String surname,
		String institude, String department, String contact, String email,
		String admissiondate,Integer batch_id,String batch_name ) {
	super();
	this.id = id;
	this.batch_id = batch_id;
	this.name = name;
	this.surname = surname;
	this.institude = institude;
	this.department = department;
	this.contact = contact;
	this.email = email;
	this.admissiondate = admissiondate;
	this.batch_name = batch_name;
	
}



}
