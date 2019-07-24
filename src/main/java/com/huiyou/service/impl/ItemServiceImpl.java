package com.huiyou.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huiyou.mapper.ItemMapper;
import com.huiyou.model.Item;
import com.huiyou.model.ItemContent;
import com.huiyou.service.ItemService;
@Service
public class ItemServiceImpl implements ItemService{
	@Autowired
	private ItemMapper itemMapper;

	@Override
	public List<Object> selPassItem(Item item) {
		return itemMapper.selPassItem(item);
	}

	@Override
	public List<Object> selCopyItem(Item item) {
		return itemMapper.selCopyItem(item);
	}

	@Override
	public List<Object> selItemContent(ItemContent itemContent) {
		return itemMapper.selItemContent(itemContent);
	}

	@Override
	public List<Object> selMyItem(Item item) {
		return itemMapper.selMyItem(item);
	}

	@Override
	public void addItemContent(ItemContent itemContent) {
		itemMapper.addItemContent(itemContent);
	}

	@Override
	public void addItem(Item item) {
		itemMapper.addItem(item);
	}

	@Override
	public Integer selNewItemId() {
		return itemMapper.selNewItemId();
	}

	@Override
	public void addItempass(Map<String, Object> map) {
		itemMapper.addItempass(map);
	}

	@Override
	public void addItemcopy(Map<String, Object> map) {
		itemMapper.addItemcopy(map);
	}

	@Override
	public void checkItem(Integer itemid) {
		itemMapper.checkItem(itemid);
	}

}
