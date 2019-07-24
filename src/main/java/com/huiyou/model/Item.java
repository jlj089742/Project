package com.huiyou.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Item {
	private int id;
	private int memid;
	private String memname;
	private int type;
	private int day;
	private float cost;
	private String reason;
	private Date createtime;
	private int pass;
	private String typename;
	private String passname;
	private String choosetime;
	private String maxtime;
	private String mintime;

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private String time;


	@Override
	public String toString() {
		return "Item [id=" + id + ", memid=" + memid + ", memname=" + memname
				+ ", type=" + type + ", day=" + day + ", cost=" + cost
				+ ", reason=" + reason + ", createtime=" + createtime
				+ ", pass=" + pass + ", time=" + time + "]";
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

	public String getMemname() {
		return memname;
	}

	public void setMemname(String memname) {
		this.memname = memname;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
		setTypename(type);
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
		String time = sdf.format(createtime);
		setTime(time);
	}

	public int getPass() {
		return pass;
	}

	public void setPass(int pass) {
		this.pass = pass;
		setPassname(pass);
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(int type2) {
		switch (type2) {
		case 0:
			this.typename="类型未设置";
			break;
		case 1:
			this.typename="差费审批";
			break;
        case 2:
        	this.typename="出差";
			break;
        case 3:
        	this.typename="请假";
			break;
        case 4:
        	this.typename="加班费审批";
			break;
        case 5:
        	this.typename="加班";
			break;
        case 6:
        	this.typename="通用审批";
			break;
		}
	}

	public String getPassname() {
		return passname;
	}

	public void setPassname(int pass2) {
		switch (pass2) {
		case -1:
			this.passname="未审核";
			break;
		case 1:
			this.passname="审核通过";
			break;
		}
	}

	public String getChoosetime() {
		return choosetime;
	}

	public void setChoosetime(String choosetime) {
		this.choosetime = choosetime;
		if(choosetime!=null&&choosetime!=""){
		String[] split=choosetime.split("~");
		setMintime(split[0]);
		setMaxtime(split[1]);}
	}

	public String getMaxtime() {
		return maxtime;
	}

	public void setMaxtime(String maxtime) {
		this.maxtime = maxtime;
	}

	public String getMintime() {
		return mintime;
	}

	public void setMintime(String mintime) {
		this.mintime = mintime;
	}

}
