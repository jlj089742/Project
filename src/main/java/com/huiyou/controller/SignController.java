package com.huiyou.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huiyou.model.DataGridView;
import com.huiyou.model.Sign;
import com.huiyou.service.SignService;

@Controller
@Component
@RequestMapping("sign")
public class SignController {
	@Autowired
	private SignService signService;
	private SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	private String checkPlace;
	private String amcheck;
	private String amleave;
	private String pmcheck;
	private String pmleave;
	private int dos;// -1单休,-2双休

	@RequestMapping("showSign")
	@ResponseBody
	public DataGridView showSign(Sign sign, String token) throws Exception {
		System.err.println("打开签到界面");
		System.err.println(sign.getTime());
		String msg;
		// 输入参数token,place,time
		DataGridView dataGridView = new DataGridView();
		Integer id = LoginController.checkToken(token);
		if (id != -1) {
			sign.setMemid(id);
			List<Sign> signrule = signService.selSignRule(sign);
			dos = signrule.get(0).getType();// 拿到当前单双休状态
			System.err.println(dos);
			int memid = sign.getMemid();
			String time1 = sign.getTime().substring(0, 10) + " 00:00:00";
			System.err.println(time1);
			String time2 = sign.getTime().substring(0, 10) + " 23:59:59";
			Map<String, Object> map = new HashMap<>();
			map.put("time1", time1);
			map.put("time2", time2);
			map.put("memid", memid);
			List<Object> signtoday = signService.selSignToday(map);// 拿到当天的考勤记录
			if (signtoday.size() == 0) {
				msg = "上班打卡";
			} else if (signtoday.size() == 1) {
				msg = "下班打卡";
			} else {
				msg = "无法打卡";
			}
			int week = dayForWeek(sign.getTime());
			System.err.println(week);
			if (week==7) {
				msg = "周日休息";
			} else if (week==6 && dos == -2) {
				msg = "周六休息";
			}
			dataGridView.setData(signtoday);
			dataGridView.setMsg(msg);
			dataGridView.setCount(signtoday.size());
			dataGridView.setCode(0);
		} else {
			dataGridView.setCode(-1);
			dataGridView.setMsg("token已失效");
		}
		
		//AutoCheck();//用于测试
		
		return dataGridView;
	}

	@RequestMapping("addSign")
	@ResponseBody
	public DataGridView addSign(Sign sign, String token) throws ParseException {
		System.err.println("签到");
		System.err.println(sign);
		// 输入参数token,place,time
		DataGridView dataGridView = new DataGridView();
		Integer id = LoginController.checkToken(token);
		if (id != -1) {
			sign.setMemid(id);
			SimpleDateFormat myFormatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			List<Sign> signrule = signService.selSignRule(sign);
			dos = signrule.get(0).getType();
			amcheck = sdf.format(signrule.get(0).getSigndate());
			amleave = sdf.format(signrule.get(1).getSigndate());
			pmcheck = sdf.format(signrule.get(2).getSigndate());
			pmleave = sdf.format(signrule.get(3).getSigndate());
			int memid = sign.getMemid();
			String time = sign.getTime();
			Date signdate = myFormatter.parse(time);
			String time1 = sign.getTime().substring(0, 10) + " 00:00:00";
			String time2 = sign.getTime().substring(0, 10) + " 23:59:59";
			amcheck = sign.getTime().substring(0, 10) + " " + amcheck;
			amleave = sign.getTime().substring(0, 10) + " " + amleave;
			pmcheck = sign.getTime().substring(0, 10) + " " + pmcheck;
			pmleave = sign.getTime().substring(0, 10) + " " + pmleave;
			Date Amcheck = myFormatter.parse(amcheck);
			Date Amleave = myFormatter.parse(amleave);
			Date Pmcheck = myFormatter.parse(pmcheck);
			Date Pmleave = myFormatter.parse(pmleave);
			Map<String, Object> map1 = new HashMap<>();
			map1.put("memid", memid);
			map1.put("Amcheck", Amcheck);
			List<Map<String, Object>> checkchange = signService
					.selItemCheck(map1);
			System.err.println(checkchange.toString());// 影响上班时间的数据
			if (checkchange.size() != 0) {
				Date cc = (Date) checkchange.get(0).get("enddate");
				if (cc.getTime() >= Amleave.getTime()
						&& cc.getTime() <= Pmcheck.getTime()) {
					Amcheck = Pmcheck;// 跳过午休时间
				} else {
					Amcheck = cc;
				}
			} else {
				System.err.println("无请假影响");
			}
			System.err.println(Amcheck.toString());// 最终上班时间
			Map<String, Object> map2 = new HashMap<>();
			map2.put("memid", memid);
			map2.put("Pmleave", Pmleave);
			List<Map<String, Object>> leavechange = signService
					.selItemLeave(map2);
			System.err.println(leavechange.toString());// 影响下班时间的数据
			if (leavechange.size() != 0) {
				Date lc = (Date) leavechange.get(0).get("startdate");
				if (lc.getTime() >= Amleave.getTime()
						&& lc.getTime() <= Pmcheck.getTime()) {
					Pmleave = Amleave;// 跳过午休时间
				} else {
					Pmleave = lc;
				}
			} else {
				System.err.println("无请假影响");
			}
			System.err.println(Pmleave.toString());// 最终下班时间

			dos = signrule.get(0).getType();// 拿到当前单双休状态
			System.err.println(dos);
			Map<String, Object> map = new HashMap<>();
			map.put("time1", time1);
			map.put("time2", time2);
			map.put("memid", memid);
			List<Object> signtoday = signService.selSignToday(map);// 当天签到记录
			System.err.println(signtoday);
			Calendar cal = Calendar.getInstance();
			cal.setTime(Amcheck);
			cal.add(Calendar.MINUTE, 30);
			Date AmcheckM30 = cal.getTime();
			cal.setTime(Amcheck);
			cal.add(Calendar.MINUTE, 180);
			Date AmcheckM180 = cal.getTime();
			System.err.println(AmcheckM30);// 迟到节点
			System.err.println(AmcheckM180);// 旷工节点
			cal.setTime(Pmleave);
			cal.add(Calendar.MINUTE, -30);
			Date PmleaveM30 = cal.getTime();
			System.err.println(PmleaveM30);// 早退节点
			if (signtoday.size() == 0) {
				if (signdate.getTime() <= Amcheck.getTime()) {
					sign.setType(1);// 正常打卡
				} else if (signdate.getTime() <= AmcheckM30.getTime()) {
					sign.setType(2);// 迟到
				} else if (signdate.getTime() <= AmcheckM180.getTime()) {
					sign.setType(11);// 旷工半天
				} else {
					sign.setType(12);// 旷工一天
				}
			} else if (signtoday.size() == 1) {
				if (signdate.getTime() >= Pmleave.getTime()) {
					sign.setType(1);// 正常打卡
				} else if (signdate.getTime() >= PmleaveM30.getTime()) {
					sign.setType(3);// 早退
				} else {
					sign.setType(11);// 旷工半天
				}
			} else {
				System.err.println("异常打卡");
			}

			System.err.println(sign);
			signService.addSign(sign);// 插入签到表
			dataGridView.setCode(0);
		} else {
			dataGridView.setCode(-1);
			dataGridView.setMsg("token已失效");
		}
		return dataGridView;
	}

	@RequestMapping("selSignOut")
	@ResponseBody
	public DataGridView selSignOut(String token) throws ParseException {
		System.err.println("外勤记录");
		System.err.println(token);
		// 传入参数token
		DataGridView dataGridView = new DataGridView();
		Integer id = LoginController.checkToken(token);
		if (id != -1) {
			Sign sign = new Sign();
			sign.setMemid(id);
			List<Sign> list = signService.selSignOut(sign);// 查询总签到
			List<Object> signOut = new ArrayList<>();
			System.err.println(list.toString());
			List<Sign> signrule = signService.selSignRule(sign);
			checkPlace = signrule.get(0).getPlace();
			for (Sign data : list) {
				if (!data.getPlace().equals(checkPlace)) {
					signOut.add(data);
				}
			}
			System.err.println(signOut.toString());

			dataGridView.setData(signOut);
			dataGridView.setCount(signOut.size());
			dataGridView.setCode(0);
		} else {
			dataGridView.setCode(-1);
			dataGridView.setMsg("token已失效");
		}

		return dataGridView;
	}

	/**
	 * 
	 * @param pTime
	 * @return
	 * @throws Exception
	 */
	public static int dayForWeek(String pTime) throws Exception {
		  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		  Calendar c = Calendar.getInstance();
		  c.setTime(format.parse(pTime));
		  int dayForWeek = 0;
		  if(c.get(Calendar.DAY_OF_WEEK) == 1){
		   dayForWeek = 7;
		  }else{
		   dayForWeek = c.get(Calendar.DAY_OF_WEEK) - 1;
		  }
		  return dayForWeek;
		 }

	@Scheduled(cron = "0 59 23 ? * *")
	public void AutoCheck() throws Exception {
		System.err.println("每日出勤记录系统启动！");
		Date today=new Date();
		SimpleDateFormat myFormatter = new SimpleDateFormat(
				"yyyy-MM-dd");
		String time=myFormatter.format(today);
		//String time="2019-07-11";
		int week=dayForWeek(time);//周几
		Sign sign=new Sign();
		List<Sign> signrule = signService.selSignRule(sign);
		amcheck = sdf.format(signrule.get(0).getSigndate());
		amleave = sdf.format(signrule.get(1).getSigndate());
		pmcheck = sdf.format(signrule.get(2).getSigndate());
		pmleave = sdf.format(signrule.get(3).getSigndate());
		amcheck = time + " " + amcheck;
		amleave = time + " " + amleave;
		pmcheck = time + " " + pmcheck;
		pmleave = time + " " + pmleave;
		dos = signrule.get(0).getType();//当前单双休
		System.err.println(time);
		String time1=time+" 00:00:00";
		String time2=time+" 23:59:59";
		List<Integer> memid=signService.selMemid();
		System.err.println(memid);
		for(int id:memid){
			float nowork=0;
			Map<String, Object> map = new HashMap<>();
			map.put("memid", id);
			map.put("time1", time1);
			map.put("time2", time2);
			map.put("amcheck", amcheck);
			map.put("pmleave", pmleave);
			List<Map<String,Object>> todayleave=signService.selTodayLeave(map);//当天有效请假数据(全天)
			System.err.println(todayleave);
			List<Map<String,Object>> todaysign=signService.selTodaySign(map);//当天打卡数据
			System.err.println(todaysign);
			if(dos==-1){
				if(week!=7&&todaysign.size()==0&&todayleave.size()==0){
					nowork=1;
				}
			}else{
				if(week!=7&&week!=6&&todaysign.size()==0&&todayleave.size()==0){
					nowork=1;
				}
			}
			if(todaysign.size()!=0){
				for(Map<String,Object> data:todaysign){
					System.err.println(data.get("type"));
					if((int)data.get("type")==12){
						nowork+=1;
					}else if((int)data.get("type")==11){
						nowork+=0.5;
					}
				}
			}
			if(nowork>1){
				nowork=1;
			}
			Map<String, Object> data = new HashMap<>();
			data.put("memid", id);
			data.put("date", time);
			data.put("nowork", nowork);//当日旷工情况
			System.err.println(data);
			signService.addAutocheck(data);
		}
	}
}
