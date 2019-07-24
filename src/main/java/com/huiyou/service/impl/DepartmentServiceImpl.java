package com.huiyou.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huiyou.mapper.DepartmentMapper;
import com.huiyou.model.Department;
import com.huiyou.model.Member;
import com.huiyou.service.DepartmentService;
@Service
public class DepartmentServiceImpl implements DepartmentService{
	@Autowired
	private DepartmentMapper departmentMapper;
	@Override
	public List<Object> selDepartment(Department department) {
		return departmentMapper.selDepartment(department);
	}
	@Override
	public List<Object> selMember(Member member) {
		return departmentMapper.selMember(member);
	}
	@Override
	public List<Object> oftenMember(Member member) {
		return departmentMapper.oftenMember(member);
	}
	@Override
	public void delOftenMember(Map<String, String> map) {
		departmentMapper.delOftenMember(map);
	}
	@Override
	public void addOftenMember(Map<String, String> map) {
		departmentMapper.addOftenMember(map);
	}
	@Override
	public void addMember(Member member) {
		departmentMapper.addMember(member);
	}
	@Override
	public List<Object> selMemberInfo(Member member) {
		return departmentMapper.selMemberInfo(member);
	}
	@Override
	public List<Object> selCompany(Integer id) {
		return departmentMapper.selCompany(id);
	}

}
