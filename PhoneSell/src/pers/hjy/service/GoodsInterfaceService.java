package pers.hjy.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import pers.hjy.bean.Goods;

public interface GoodsInterfaceService {
	Goods getGoods(String goodId);
	//ArrayList<Goods> getSearchGoods(String str);
	ArrayList<Goods> getGoodsByShow(int i);
	List<Map<String, Object>> getGoodsColor(String goodsId);
}
