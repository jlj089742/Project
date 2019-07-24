package com.huiyou.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huiyou.model.DataGridView;
import com.huiyou.model.Department;
import com.huiyou.model.Item;
import com.huiyou.model.Member;
import com.huiyou.model.Sign;
import com.huiyou.service.SuperService;

@Controller
@RequestMapping("super")
public class SuperController {
	@Autowired
	private SuperService superService;
	
	@RequestMapping("superLogin")
	@ResponseBody
	public DataGridView superLogin(String username,String password){
		System.err.println(username);
		System.err.println(password);
		Map<String,Object> map=new HashMap<>();
		map.put("username",username);
		map.put("password",password);
		List<Object> list=superService.superLogin(map);
		System.err.println(list);
		DataGridView dataGridView=new DataGridView();
		dataGridView.setData(list);
		dataGridView.setCode(0);
		dataGridView.setCount(list.size());
		return dataGridView;
	}

	@RequestMapping("selMember")
	@ResponseBody
	public DataGridView selMember(Member member) {
		System.err.println("后台搜索成员");
		System.err.println(member);
		List<Object> list = superService.selMember(member);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		dataGridView.setData(list);
		dataGridView.setCount(list.size());
		return dataGridView;
	}

	@RequestMapping("selItem")
	@ResponseBody
	public DataGridView selItem(Item item) {
		System.err.println("后台搜索表单");
		System.err.println(item);
		List<Object> list = superService.selItem(item);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		dataGridView.setData(list);
		dataGridView.setCount(list.size());
		return dataGridView;
	}

	@RequestMapping("selDepartment")
	@ResponseBody
	public DataGridView selDepartment(Department department) {
		System.err.println("搜索部门");
		System.err.println(department);
		List<Object> list = superService.selDepartment(department);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		dataGridView.setData(list);
		dataGridView.setCount(list.size());
		return dataGridView;
	}

	@RequestMapping("selDepMember")
	@ResponseBody
	public DataGridView selDepMember(Member member) {
		System.err.println("部门搜索成员");
		System.err.println(member);
		List<Object> list = superService.selDepMember(member);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		dataGridView.setData(list);
		dataGridView.setCount(list.size());
		return dataGridView;
	}

	@RequestMapping("selSignSum")
	@ResponseBody
	public Map<String, Object> selSignSum(String department, String time)
			throws Exception {
		System.err.println("后台出勤统计");
		System.err.println(department);
		System.err.println(time);
		Map<String, Object> map = new HashMap<>();
		map.put("depid", department);
		map.put("time", time);
		Integer normalsign = superService.selNormalSign(map);// 正常打卡次数
		Integer latesign = superService.selLateSign(map);// 迟到打卡次数
		Integer earlysign = superService.selEarlySign(map);// 早退打卡次数
		Integer lostsign = superService.selLostSign(map).size();// 缺卡次数
		Integer overtime = superService.selOvertime(map);// 加班次数
		Integer workout = superService.selWorkout(map);// 出差次数
		Integer leave = superService.selLeave(map);// 请假次数
		Integer nowork = superService.selNowork(map);// 旷工次数
		if(nowork==null){
			nowork=0;
		}
		Map<String, Object> mapsum = new HashMap<>();
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
		Date date = dateFormat.parse(time);
		calendar.setTime(date);
		Sign sign = new Sign();
		int ruletype = superService.selSignRule(sign).get(0).getType();
		int workday = getMonthInfo(calendar, ruletype).get("workDaysAmount");// 工作日天数
		mapsum.put("workday", workday);
		mapsum.put("normalsign", normalsign);
		mapsum.put("latesign", latesign);
		mapsum.put("earlysign", earlysign);
		mapsum.put("lostsign", lostsign);
		mapsum.put("overtime", overtime);
		mapsum.put("workout", workout);
		mapsum.put("leave", leave);
		mapsum.put("nowork", nowork);
		return mapsum;
	}

	@RequestMapping("updateMember")
	@ResponseBody
	public DataGridView updateMember(Member member) {
		System.err.println("更新用户信息");
		System.err.println(member);
		superService.updateMember(member);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		return dataGridView;
	}

	@RequestMapping("updateSignRule")
	@ResponseBody
	public DataGridView updateSignRule(Sign sign) {
		System.err.println("更新考勤规则");
		System.err.println(sign);
		sign.setAmcheck("2019-01-01 " + sign.getAmcheck());
		sign.setAmleave("2019-01-01 " + sign.getAmleave());
		sign.setPmcheck("2019-01-01 " + sign.getPmcheck());
		sign.setPmleave("2019-01-01 " + sign.getPmleave());
		System.err.println(sign);
		superService.updateSignRule(sign);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		return dataGridView;
	}
	
	@RequestMapping("selLeaveList")
	@ResponseBody
	public DataGridView selLeaveList(Integer depid,String time) {
		System.err.println("请假列表详情");
		System.err.println(depid);
		System.err.println(time);
		Map<String,Object> map=new HashMap<>();
		map.put("depid",depid);
		map.put("time",time);
		List<Object> list = superService.selLeaveList(map);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		dataGridView.setData(list);
		dataGridView.setCount(list.size());
		return dataGridView;
	}
	
	@RequestMapping("selNoworkList")
	@ResponseBody
	public DataGridView selNoworkList(Integer depid,String time) {
		System.err.println("旷工列表详情");
		System.err.println(depid);
		System.err.println(time);
		Map<String,Object> map=new HashMap<>();
		map.put("depid",depid);
		map.put("time",time);
		List<Object> list = superService.selNoworkList(map);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		dataGridView.setData(list);
		dataGridView.setCount(list.size());
		return dataGridView;
	}

	@RequestMapping("toMemberEdit")
	public String toMemberEdit(Member member, Model model) {
		System.err.println("到用户详情");
		System.err.println(member);
		List<Object> list = superService.selMember(member);
		System.err.println(list.get(0).toString());
		model.addAttribute("member", list.get(0));
		return "userEdit";
	}

	@RequestMapping("toItemEdit")
	public String toItemEdit(Item item, Model model) {
		System.err.println("到表单详情");
		System.err.println(item);
		List<Object> list = superService.selItem(item);
		System.err.println(list.get(0).toString());
		model.addAttribute("item", list.get(0));
		return "itemEdit";
	}

	@RequestMapping("toDepartmentEdit")
	public String toDepartmentEdit(Department department, Model model) {
		System.err.println("到部门详情");
		System.err.println(department);
		List<Object> list = superService.selDepartment(department);
		System.err.println(list.get(0).toString());
		model.addAttribute("department", list.get(0));
		return "departmentEdit";
	}

	@RequestMapping("toEdit3")
	public String toList3(Sign sign, Model model) {
		System.err.println("到出勤规则");
		System.err.println(sign);
		List<Sign> list = superService.selSignRule(sign);
		model.addAttribute("place", list.get(0).getPlace());
		model.addAttribute("type", list.get(0).getType());
		model.addAttribute("amcheck", list.get(0).getTime().substring(11, 19));
		model.addAttribute("amleave", list.get(1).getTime().substring(11, 19));
		model.addAttribute("pmcheck", list.get(2).getTime().substring(11, 19));
		model.addAttribute("pmleave", list.get(3).getTime().substring(11, 19));
		System.err.println(model.toString());
		return "workEdit";
	}
	
	@RequestMapping("toLeaveList")
	public String toLeaveList(Integer department,String time, Model model) {
		System.err.println("到请假人次详情");
		System.err.println(department);
		System.err.println(time);
		model.addAttribute("department", department);
		model.addAttribute("time", time);
		System.err.println(model.toString());
		return "leaveList";
	}
	
	@RequestMapping("toNoworkList")
	public String toNoworkList(Integer department,String time, Model model) {
		System.err.println("到旷工人次详情");
		System.err.println(department);
		System.err.println(time);
		model.addAttribute("department", department);
		model.addAttribute("time", time);
		System.err.println(model.toString());
		return "noworkList";
	}

	/**
	 * 当月工作日
	 * 
	 * @param calendar
	 * @param ruletype
	 * @return
	 */
	private static Map<Object, Integer> getMonthInfo(Calendar calendar,
			int ruletype) {
		Map<Object, Integer> map = new HashMap<>();
		int workDays = 0;
		int days = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		try {
			calendar.set(Calendar.DATE, 1);// 从每月1号开始
			for (int i = 0; i < days; i++) {
				int day = calendar.get(Calendar.DAY_OF_WEEK);
				if (ruletype != -1) {
					if (!(day == Calendar.SUNDAY || day == Calendar.SATURDAY)) {
						workDays++;
					}
				} else {
					if (!(day == Calendar.SUNDAY)) {
						workDays++;
					}
				}
				calendar.add(Calendar.DATE, 1);
			}
			map.put("workDaysAmount", workDays);// 工作日
			map.put("year", calendar.get(Calendar.YEAR));// 实时年份
			map.put("month", calendar.get(Calendar.MONTH));// 实时月份
			map.put("daysAmount", days);// 自然日
			map.put("weeksAmount",
					calendar.getActualMaximum(Calendar.WEEK_OF_MONTH));// 周
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
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

}
