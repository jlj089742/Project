package com.huiyou.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huiyou.mapper.SuperMapper;
import com.huiyou.model.Department;
import com.huiyou.model.Item;
import com.huiyou.model.Member;
import com.huiyou.model.Sign;
import com.huiyou.service.SuperService;
@Service
public class SuperServiceImpl implements SuperService{
	@Autowired
	private SuperMapper superMapper;

	@Override
	public List<Object> selMember(Member member) {
		return superMapper.selMember(member);
	}

	@Override
	public List<Object> selItem(Item item) {
		return superMapper.selItem(item);
	}

	@Override
	public void updateMember(Member member) {
		superMapper.updateMember(member);
	}

	@Override
	public List<Object> selDepartment(Department department) {
		return superMapper.selDepartment(department);
	}

	@Override
	public List<Object> selDepMember(Member member) {
		return superMapper.selDepMember(member);
	}

	@Override
	public List<Sign> selSignRule(Sign sign) {
		return superMapper.selSignRule(sign);
	}

	@Override
	public void updateSignRule(Sign sign) {
		superMapper.updateSignRule(sign);
	}

	@Override
	public Integer selNormalSign(Map<String, Object> map) {
		return superMapper.selNormalSign(map);
	}

	@Override
	public Integer selLateSign(Map<String, Object> map) {
		return superMapper.selLateSign(map);
	}

	@Override
	public Integer selEarlySign(Map<String, Object> map) {
		return superMapper.selEarlySign(map);
	}

	@Override
	public Integer selOvertime(Map<String, Object> map) {
		return superMapper.selOvertime(map);
	}

	@Override
	public Integer selWorkout(Map<String, Object> map) {
		return superMapper.selWorkout(map);
	}

	@Override
	public Integer selLeave(Map<String, Object> map) {
		return superMapper.selLeave(map);
	}

	@Override
	public List<Object> selLostSign(Map<String, Object> map) {
		return superMapper.selLostSign(map);
	}

	@Override
	public List<Sign> selSignDay(int id) {
		return superMapper.selSignDay(id);
	}

	@Override
	public Integer selNowork(Map<String, Object> map) {
		return superMapper.selNowork(map);
	}

	@Override
	public List<Object> selLeaveList(Map<String, Object> map) {
		return superMapper.selLeaveList(map);
	}

	@Override
	public List<Object> selNoworkList(Map<String, Object> map) {
		return superMapper.selNoworkList(map);
	}

	@Override
	public List<Object> superLogin(Map<String, Object> map) {
		return superMapper.superLogin(map);
	}

}
