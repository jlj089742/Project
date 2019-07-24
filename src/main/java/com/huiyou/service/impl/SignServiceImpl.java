package com.huiyou.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huiyou.mapper.SignMapper;
import com.huiyou.model.Sign;
import com.huiyou.service.SignService;
@Service
public class SignServiceImpl implements SignService{
	@Autowired
	private SignMapper signMapper;

	@Override
	public void addSign(Sign sign) {
		signMapper.addSign(sign);
	}

	@Override
	public List<Sign> selSignOut(Sign sign) {
		return signMapper.selSignOut(sign);
	}

	@Override
	public List<Sign> selSignRule(Sign sign) {
		return signMapper.selSignRule(sign);
	}

	@Override
	public List<Object> selSignToday(Map<String, Object> map) {
		return signMapper.selSignToday(map);
	}

	@Override
	public List<Map<String, Object>> selItemCheck(Map<String, Object> map1) {
		return signMapper.selItemCheck(map1);
	}

	@Override
	public List<Map<String, Object>> selItemLeave(Map<String, Object> map2) {
		return signMapper.selItemLeave(map2);
	}

	@Override
	public List<Integer> selMemid() {
		return signMapper.selMemid();
	}

	@Override
	public List<Map<String, Object>> selTodayLeave(Map<String, Object> map) {
		return signMapper.selTodayLeave(map);
	}

	@Override
	public List<Map<String, Object>> selTodaySign(Map<String, Object> map) {
		return signMapper.selTodaySign(map);
	}

	@Override
	public void addAutocheck(Map<String, Object> data) {
		signMapper.addAutocheck(data);
	}

}
