package pers.hjy.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import pers.hjy.bean.Goods;
import pers.hjy.dao.GoodsInterfaceDao;
import pers.hjy.dao.impl.GoodsInterfaceImplDao;
import pers.hjy.service.GoodsInterfaceService;

public class GoodsInterfaceImplService implements GoodsInterfaceService {

	private GoodsInterfaceDao dao = new GoodsInterfaceImplDao();
	public GoodsInterfaceImplService(GoodsInterfaceDao dao) {
		this.dao=dao;
	}
	public GoodsInterfaceImplService() {
		// TODO Auto-generated constructor stub
	}
 	@Override
	public Goods getGoods(String goodId) {
		// TODO Auto-generated method stub
		return dao.getGoods(goodId);
	}

	@Override
	public ArrayList<Goods> getGoodsByShow(int i) {
		// TODO Auto-generated method stub
		return dao.getGoodsByShow(i);
	}
	public List<Map<String, Object>> getGoodsColor(String goodsId){
		return dao.getGoodsColor(goodsId);
	}

}
