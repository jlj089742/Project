package com.huiyou.model;

public class Department {
	private int id;
	private int comid;
	private String name;
	private String comname;
	@Override
	public String toString() {
		return "Department [id=" + id + ", comid=" + comid + ", name=" + name
				+ ", comname=" + comname + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getComid() {
		return comid;
	}
	public void setComid(int comid) {
		this.comid = comid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComname() {
		return comname;
	}
	public void setComname(String comname) {
		this.comname = comname;
	}
}
