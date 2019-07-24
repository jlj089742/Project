package com.huiyou.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/*import javax.servlet.http.Cookie;
 import javax.servlet.http.HttpServlet;
 import javax.servlet.http.HttpServletResponse;*/

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huiyou.model.DataGridView;
import com.huiyou.model.Member;
import com.huiyou.service.LoginService;

@Controller
@RequestMapping("login")
public class LoginController {
	@Autowired
	private LoginService loginService;

	public LoginController() {
		super();
	}

	@RequestMapping("check")
	@ResponseBody
	public DataGridView selUser(Member member) {
		System.out.println("用户登录");
		System.out.println(member.toString());
		// 输入参数为username,password
		List<Member> list = loginService.selUser(member);
		System.err.println(list.size());
		DataGridView dataGridView = new DataGridView();
		if (list.size() == 0) {
			dataGridView.setCode(-1);
			dataGridView.setMsg("账号密码错误！");
		} else {
			int id = list.get(0).getId();
			System.err.println(id);
			String token = setToken(id);// 生成token
			Map<String,Object> map= new HashMap<>();
			map.put("token",token);
			List<Object> data = new ArrayList<>();
			data.add(map);
			dataGridView.setData(data);
			dataGridView.setCode(0);
			dataGridView.setMsg("登录成功！");
		}
		return dataGridView;
	}

	@RequestMapping("updateMember")
	@ResponseBody
	public DataGridView updateMember(String token, String password) {
		System.out.println("修改密码");
		System.out.println(token);
		// 输入参数token,password可修改密码
		DataGridView dataGridView = new DataGridView();
		if (checkToken(token) != -1) {
			Member member = new Member();
			member.setId(checkToken(token));
			member.setPassword(password);
			loginService.updateMember(member);
			dataGridView.setCode(0);
		} else {
			dataGridView.setCode(-1);
			dataGridView.setMsg("token已失效");
		}
		return dataGridView;
	}

	public String setToken(int id) {
		Date nowtime = new Date();
		String now = Long.toString(nowtime.getTime());
		System.err.println(now);
		String token = now + id;
		System.err.println(token);
		return token;
	}

	public static int checkToken(String token) {
		long checktime = Long.parseLong(token.substring(0, 13)) + 24*60 * 60 * 1000;// 时效1小时
		System.err.println(checktime);
		Date nowtime = new Date();
		int id;
		if (nowtime.getTime() > checktime) {
			id = -1;
			System.err.println("token已经失效");
		} else {
			id = Integer.parseInt(token.substring(13));
		}
		return id;
	}
}
