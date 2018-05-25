package model;

import java.util.Date;

public class Member {

	private int mId;
	private String writer;
	private String name;
	private int pw;
	private Date joinDate;
	private String email;
	private String phone;

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPw() {
		return pw;
	}

	public void setPw(int pw) {
		this.pw = pw;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Member [mId=" + mId + ", writer=" + writer + ", name=" + name + ", pw=" + pw + ", joinDate=" + joinDate
				+ ", email=" + email + ", phone=" + phone + "]";
	}

}
