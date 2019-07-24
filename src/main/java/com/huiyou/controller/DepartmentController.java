package com.huiyou.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huiyou.model.DataGridView;
import com.huiyou.model.Department;
import com.huiyou.model.Member;
import com.huiyou.service.DepartmentService;

@Controller
@RequestMapping("department")
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("selCompany")
	@ResponseBody
	public DataGridView selCompany(String token) {
		System.err.println("搜索部门");
		System.err.println(token);
		//输入参数为token
		DataGridView dataGridView = new DataGridView();
		Integer id=LoginController.checkToken(token);
		if (id != -1) {
			List<Object> list = departmentService.selCompany(id);
			dataGridView.setData(list);
			dataGridView.setCount(list.size());
		} else {
			dataGridView.setCode(-1);
			dataGridView.setMsg("token已失效");
		}
		return dataGridView;
	}

	@RequestMapping("selDepartment")
	@ResponseBody
	public DataGridView selDepartment(Department department) {
		System.err.println("搜索部门");
		System.err.println(department);
		//输入参数为comid
		List<Object> list = departmentService.selDepartment(department);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		dataGridView.setData(list);
		dataGridView.setCount(list.size());
		return dataGridView;
	}
	
	@RequestMapping("selMember")
	@ResponseBody
	public DataGridView selMember(Member member) {
		System.err.println("搜索成员");
		System.err.println(member);
		//输入参数为depid
		List<Object> list = departmentService.selMember(member);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		dataGridView.setData(list);
		dataGridView.setCount(list.size());
		return dataGridView;
	}
	
	@RequestMapping("selMemberInfo")
	@ResponseBody
	public DataGridView selMemberInfo(Member member) {
		System.err.println("成员详情");
		System.err.println(member);
		//输入参数为id
		List<Object> list = departmentService.selMemberInfo(member);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		dataGridView.setData(list);
		dataGridView.setCount(list.size());
		return dataGridView;
	}
	
	@RequestMapping("addMember")
	@ResponseBody
	public DataGridView addMember(Member member) {
		System.err.println("邀请新同事");
		System.err.println(member);
		//传入id新同事, depid邀请的部门
		departmentService.addMember(member);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		return dataGridView;
	}
	
	
	@RequestMapping("oftenMember")
	@ResponseBody
	public DataGridView oftenMember(String token) {
		System.err.println("常用联系人");
		System.err.println(token);
		//输入参数为token
		DataGridView dataGridView = new DataGridView();
		Integer id=LoginController.checkToken(token);
		if (id != -1) {
			Member member=new Member();
			member.setId(id);
			List<Object> list = departmentService.oftenMember(member);
			dataGridView.setCode(0);
			dataGridView.setData(list);
			dataGridView.setCount(list.size());
		} else {
			dataGridView.setCode(-1);
			dataGridView.setMsg("token已失效");
		}
		return dataGridView;
	}
	
	/*@RequestMapping("addOftenMember")
	@ResponseBody
	public DataGridView addOftenMember(String oftenid,String memid) {
		System.err.println("添加常用联系人");
		System.err.println(oftenid);
		System.err.println(memid);
		//传入两个参数 oftenid要添加的常用联系人   memid当前成员
		Map<String, String> map = new HashMap<>();
		map.put("oftenid", oftenid);
		map.put("memid", memid);
		departmentService.addOftenMember(map);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		return dataGridView;
	}*/

	
	/*@RequestMapping("delOftenMember")
	@ResponseBody
	public DataGridView delOftenMember(String oftenid,String memid) {
		System.err.println("删除常用联系人");
		System.err.println(oftenid);
		System.err.println(memid);
		//传入两个参数 oftenid要删除的常用联系人   memid当前成员
		String[] split = oftenid.split(",");
		System.err.println(split);
		for (String id : split) {
			System.err.println(id);
			Map<String, String> map = new HashMap<>();
			map.put("oftenid", id);
			map.put("memid", memid);
			departmentService.delOftenMember(map);
		}
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		return dataGridView;
	}*/
}
