package com.huiyou.mapper;

import java.util.List;

import com.huiyou.model.Member;

public interface LoginMapper {

	List<Member> selUser(Member member);

	void updateMember(Member member);

}
