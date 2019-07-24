package com.huiyou.service;

import java.util.List;
import java.util.Map;

import com.huiyou.model.Item;
import com.huiyou.model.ItemContent;

public interface ItemService {

	List<Object> selPassItem(Item item);

	List<Object> selCopyItem(Item item);

	List<Object> selItemContent(ItemContent itemContent);

	List<Object> selMyItem(Item item);
	
	void addItemContent(ItemContent itemContent);

	void addItem(Item item);

	Integer selNewItemId();

	void addItempass(Map<String, Object> map);

	void addItemcopy(Map<String, Object> map);

	void checkItem(Integer itemid);

}
