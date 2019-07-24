package com.huiyou.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Sign {
	private int id;
	private int memid;
	private Date signdate;
	private String time;
	private String place;
	private int type;
	private String amcheck;
	private String amleave;
	private String pmcheck;
	private String pmleave;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	
	@Override
	public String toString() {
		return "Sign [id=" + id + ", memid=" + memid + ", signdate=" + signdate
				+ ", time=" + time + ", place=" + place + ", type=" + type
				+ ", amcheck=" + amcheck + ", amleave=" + amleave
				+ ", pmcheck=" + pmcheck + ", pmleave=" + pmleave + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMemid() {
		return memid;
	}
	public void setMemid(int memid) {
		this.memid = memid;
	}
	public Date getSigndate() {
		return signdate;
	}
	public void setSigndate(Date signdate) {
		this.signdate = signdate;
		String time = sdf.format(signdate);
		setTime(time);
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getAmcheck() {
		return amcheck;
	}
	public void setAmcheck(String amcheck) {
		this.amcheck = amcheck;
	}
	public String getAmleave() {
		return amleave;
	}
	public void setAmleave(String amleave) {
		this.amleave = amleave;
	}
	public String getPmcheck() {
		return pmcheck;
	}
	public void setPmcheck(String pmcheck) {
		this.pmcheck = pmcheck;
	}
	public String getPmleave() {
		return pmleave;
	}
	public void setPmleave(String pmleave) {
		this.pmleave = pmleave;
	}
}
