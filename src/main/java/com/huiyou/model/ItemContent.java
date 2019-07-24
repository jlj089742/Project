package com.huiyou.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ItemContent {
	private int id;
	private int itemid;
	private int leavetype;
	private String typename;
	private String place;
	private Date startdate;
	private Date enddate;
	private String time1;
	private String time2;

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Override
	public String toString() {
		return "ItemContent [id=" + id + ", itemid=" + itemid + ", leavetype="
				+ leavetype + ", place=" + place + ", startdate=" + startdate
				+ ", enddate=" + enddate + ", time1=" + time1 + ", time2="
				+ time2 + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public int getLeavetype() {
		return leavetype;
	}

	public void setLeavetype(int leavetype) {
		this.leavetype = leavetype;
		setTypename(leavetype);
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(int leavetype2) {
		switch (leavetype2) {
		case 0:
			this.typename="类型未设置";
			break;
		case 1:
			this.typename="年假";
			break;
        case 2:
        	this.typename="事假";
			break;
        case 3:
        	this.typename="病假";
			break;
		}
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
		String time1 = sdf.format(startdate);
		setTime1(time1);
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
		String time2 = sdf.format(enddate);
		setTime2(time2);
	}

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getTime2() {
		return time2;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

}
