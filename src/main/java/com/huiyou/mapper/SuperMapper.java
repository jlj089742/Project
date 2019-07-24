package com.huiyou.mapper;

import java.util.List;
import java.util.Map;

import com.huiyou.model.Department;
import com.huiyou.model.Item;
import com.huiyou.model.Member;
import com.huiyou.model.Sign;

public interface SuperMapper {

	List<Object> selMember(Member member);

	List<Object> selItem(Item item);

	void updateMember(Member member);

	List<Object> selDepartment(Department department);

	List<Object> selDepMember(Member member);

	List<Sign> selSignRule(Sign sign);

	void updateSignRule(Sign sign);

	Integer selNormalSign(Map<String, Object> map);

	Integer selLateSign(Map<String, Object> map);

	Integer selEarlySign(Map<String, Object> map);

	Integer selOvertime(Map<String, Object> map);

	Integer selWorkout(Map<String, Object> map);

	Integer selLeave(Map<String, Object> map);

	List<Object> selLostSign(Map<String, Object> map);

	List<Sign> selSignDay(int id);

	Integer selNowork(Map<String, Object> map);

	List<Object> selLeaveList(Map<String, Object> map);

	List<Object> selNoworkList(Map<String, Object> map);

	List<Object> superLogin(Map<String, Object> map);

}
