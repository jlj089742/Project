package com.huiyou.service;

import java.util.List;

import com.huiyou.model.Member;

public interface LoginService {

	List<Member> selUser(Member member);

	void updateMember(Member member);

}
