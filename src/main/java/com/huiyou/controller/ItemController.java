package com.huiyou.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huiyou.model.DataGridView;
import com.huiyou.model.Item;
import com.huiyou.model.ItemContent;
import com.huiyou.service.ItemService;

@Controller
@RequestMapping("item")
public class ItemController {
	@Autowired
	private ItemService itemService;

	@RequestMapping("selPassItem")
	@ResponseBody
	public DataGridView selPassItem(Item item, String token) {
		System.err.println("待我审批");
		System.err.println(item);
		System.err.println(token);
		// 传入参数token
		// 筛选参数type,pass(事务类型,审核状态)
		DataGridView dataGridView = new DataGridView();
		Integer id = LoginController.checkToken(token);
		if (id != -1) {
			item.setMemid(id);
			List<Object> list = itemService.selPassItem(item);
			dataGridView.setCode(0);
			dataGridView.setData(list);
			dataGridView.setCount(list.size());
		} else {
			dataGridView.setCode(-1);
			dataGridView.setMsg("token已失效");
		}
		return dataGridView;
	}

	@RequestMapping("selCopyItem")
	@ResponseBody
	public DataGridView selCopyItem(Item item, String token) {
		System.err.println("抄送我的");
		System.err.println(item);
		// 传入参数token
		// 筛选参数type,pass(事务类型,审核状态)
		DataGridView dataGridView = new DataGridView();
		Integer id = LoginController.checkToken(token);
		if (id != -1) {
			item.setMemid(id);
			List<Object> list = itemService.selCopyItem(item);
			dataGridView.setCode(0);
			dataGridView.setData(list);
			dataGridView.setCount(list.size());
		} else {
			dataGridView.setCode(-1);
			dataGridView.setMsg("token已失效");
		}
		return dataGridView;
	}

	@RequestMapping("selMyItem")
	@ResponseBody
	public DataGridView selMyItem(Item item, String token) {
		System.err.println("我发起的");
		System.err.println(item);
		// 传入参数memid
		// 筛选参数type,pass(事务类型,审核状态)
		DataGridView dataGridView = new DataGridView();
		Integer id = LoginController.checkToken(token);
		if (id != -1) {
			item.setMemid(id);
			List<Object> list = itemService.selMyItem(item);
			dataGridView.setCode(0);
			dataGridView.setData(list);
			dataGridView.setCount(list.size());
		} else {
			dataGridView.setCode(-1);
			dataGridView.setMsg("token已失效");
		}
		return dataGridView;
	}

	@RequestMapping("selItemContent")
	@ResponseBody
	public DataGridView selItemContent(ItemContent itemContent) {
		System.err.println("审批内容详情");
		System.err.println(itemContent);
		// 传入参数itemid
		List<Object> list = itemService.selItemContent(itemContent);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		dataGridView.setData(list);
		dataGridView.setCount(list.size());
		return dataGridView;
	}

	@RequestMapping("addItem")
	@ResponseBody
	public DataGridView addItem(Item item, String token, String typeJson,
			String passID, String copyID) {
		System.err.println("添加表单");
		System.err.println(item);
		System.err.println(typeJson);
		System.err.println(passID);
		System.err.println(copyID);
		// 传入参数token,type,day,cost,reason
		// typeJson为子表类数据段(leavetype,place,startdate,enddate)
		// passID为审核人，copyID为抄送人
		DataGridView dataGridView = new DataGridView();
		Integer id = LoginController.checkToken(token);
		if (id != -1) {
			item.setMemid(id);
			itemService.addItem(item);// 添加主表
			Integer newid = itemService.selNewItemId();// 查出当前插入表的id
			System.err.println(newid);
			List<ItemContent> list = JSON.parseArray(typeJson,
					ItemContent.class);
			System.err.println(list);
			String[] passid = passID.split(",");
			for (String data : passid) {
				Map<String, Object> map = new HashMap<>();
				map.put("itemid", newid);
				map.put("passid", data);
				itemService.addItempass(map);// 添加审核
			}
			String[] copyid = copyID.split(",");
			for (String data : copyid) {
				Map<String, Object> map = new HashMap<>();
				map.put("itemid", newid);
				map.put("copyid", data);
				itemService.addItemcopy(map);// 添加抄送
			}
			for (ItemContent data : list) {
				ItemContent itemContent = new ItemContent();
				itemContent.setItemid(newid);
				itemContent.setLeavetype(data.getLeavetype());
				itemContent.setPlace(data.getPlace());
				itemContent.setTime1(data.getTime1());
				itemContent.setTime2(data.getTime2());
				System.err.println(itemContent);
				itemService.addItemContent(itemContent);// 插入子表
			}
			dataGridView.setCode(0);
		} else {
			dataGridView.setCode(-1);
			dataGridView.setMsg("token已失效");
		}
		return dataGridView;
	}

	@RequestMapping("checkItem")
	@ResponseBody
	public DataGridView checkItem(Integer itemid) {
		System.err.println("审批表单(通过)");
		System.err.println(itemid);
		// 传入参数itemid
		itemService.checkItem(itemid);
		DataGridView dataGridView = new DataGridView();
		dataGridView.setCode(0);
		return dataGridView;
	}

}
