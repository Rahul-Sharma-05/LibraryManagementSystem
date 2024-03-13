package com.library;

public class Student {
	private int studentid;
	private String studentName;
	private String studentEmail;
	private String studentPassword;
	private String studentContact;
	private String studentCity;
	private String studentGender;
	
	public int getStudentid() {
		return studentid;
	}
	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentEmail() {
		return studentEmail;
	}
	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}
	public String getStudentPassword() {
		return studentPassword;
	}
	public void setStudentPassword(String studentPassword) {
		this.studentPassword = studentPassword;
	}
	public String getStudentContact() {
		return studentContact;
	}
	public void setStudentContact(String studentContact) {
		this.studentContact = studentContact;
	}
	public String getStudentCity() {
		return studentCity;
	}
	public void setStudentCity(String studentCity) {
		this.studentCity = studentCity;
	}
	public String getStudentGender() {
		return studentGender;
	}
	public void setStudentGender(String studentGender) {
		this.studentGender = studentGender;
	}
	public Student(int studentid, String studentName, String studentEmail, String studentPassword,
			String studentContact, String studentCity, String studentGender) {
		super();
		this.studentid = studentid;
		this.studentName = studentName;
		this.studentEmail = studentEmail;
		this.studentPassword = studentPassword;
		this.studentContact = studentContact;
		this.studentCity = studentCity;
		this.studentGender = studentGender;
	}
	
	
	
	
}
