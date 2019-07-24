package com.huiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huiyou.mapper.LoginMapper;
import com.huiyou.model.Member;
import com.huiyou.service.LoginService;
@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginMapper loginMapper;

	@Override
	public List<Member> selUser(Member member) {
		return loginMapper.selUser(member);
	}

	@Override
	public void updateMember(Member member) {
		loginMapper.updateMember(member);
	}

}
