package fms.model;

public class BatchBean {
private Integer id;
private String name ,course , time , start ,end , fees;
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getCourse() {
	return course;
}
public void setCourse(String course) {
	this.course = course;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getStart() {
	return start;
}
public void setStart(String start) {
	this.start = start;
}
public String getEnd() {
	return end;
}
public void setEnd(String end) {
	this.end = end;
}
public String getFees() {
	return fees;
}
public void setFees(String fees) {
	this.fees = fees;
}
public BatchBean(Integer id, String name, String course, String time,
		String start, String end, String fees) {
	super();
	this.id = id;
	this.name = name;
	this.course = course;
	this.time = time;
	this.start = start;
	this.end = end;
	this.fees = fees;
}
}
