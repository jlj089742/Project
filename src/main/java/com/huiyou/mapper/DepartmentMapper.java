package com.huiyou.mapper;

import java.util.List;
import java.util.Map;

import com.huiyou.model.Department;
import com.huiyou.model.Member;

public interface DepartmentMapper {

	List<Object> selDepartment(Department department);

	List<Object> selMember(Member member);

	List<Object> oftenMember(Member member);

	void delOftenMember(Map<String, String> map);

	void addOftenMember(Map<String, String> map);

	void addMember(Member member);

	List<Object> selMemberInfo(Member member);

	List<Object> selCompany(Integer id);


}
