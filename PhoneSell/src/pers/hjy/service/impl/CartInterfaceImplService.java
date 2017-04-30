package pers.hjy.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import pers.hjy.dao.CartInterfaceDao;
import pers.hjy.dao.impl.CartInterfaceImplDao;
import pers.hjy.service.CartInterfaceService;

public class CartInterfaceImplService implements CartInterfaceService {

	private CartInterfaceDao dao = new CartInterfaceImplDao();
	public CartInterfaceImplService(CartInterfaceDao dao) {
		this.dao = dao;
	}
	public CartInterfaceImplService() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public int addGoods(String userId, String goodsId, String amount) {
		// TODO Auto-generated method stub
		return dao.addGoods(userId, goodsId, amount);
	}

	@Override
	public List<Map<String, Object>> getCarGoods(String userId) {
		// TODO Auto-generated method stub
		return dao.getCarGoods(userId);
	}

	@Override
	public int deleteGoods(String user_id, String carId) {
		// TODO Auto-generated method stub
		return dao.deleteGoods(user_id, carId);
	}

	@Override
	public int setGoodsCount(String car_id, String goodsCount) {
		// TODO Auto-generated method stub
		return dao.setGoodsCount(car_id, goodsCount);
	}
	@Override
	public int addPhone(String userId, String goodsId, String phone_color, String amount) {
		// TODO Auto-generated method stub
		return dao.addPhone(userId, goodsId, phone_color, amount);
	}

}
