package com.huiyou.mapper;

import java.util.List;
import java.util.Map;

import com.huiyou.model.Sign;

public interface SignMapper {

	void addSign(Sign sign);

	List<Sign> selSignOut(Sign sign);

	List<Sign> selSignRule(Sign sign);

	List<Object> selSignToday(Map<String, Object> map);

	List<Map<String, Object>> selItemCheck(Map<String, Object> map1);

	List<Map<String, Object>> selItemLeave(Map<String, Object> map2);

	List<Integer> selMemid();

	List<Map<String, Object>> selTodayLeave(Map<String, Object> map);

	List<Map<String, Object>> selTodaySign(Map<String, Object> map);

	void addAutocheck(Map<String, Object> data);

}
