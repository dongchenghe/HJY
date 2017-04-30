package pers.hjy.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public interface CartInterfaceService {
	int addGoods(String userId,String goodsId,String amount);
	int addPhone(String userId,String goodsId,String phone_color,String amount);
	List<Map<String, Object>> getCarGoods(String userId);
	int deleteGoods(String user_id,String carId);
	int setGoodsCount(String car_id,String goodsCount);
}
