package pers.hjy.service.impl;

import java.util.List;
import java.util.Map;

import pers.hjy.dao.OrderInterfaceDao;
import pers.hjy.dao.impl.OrderInterfaceImplDao;
import pers.hjy.service.OrderInterfaceService;
import pers.hjy.util.Pager;

public class OrderInterfaceImplService implements OrderInterfaceService {
	private OrderInterfaceDao dao = new OrderInterfaceImplDao();
	@Override
	public int insertNewOrderDao(String order_id,String user_id, String order_tatal, String addr_id) {
		// TODO Auto-generated method stub
		return dao.insertNewOrderDao(order_id, user_id, order_tatal, addr_id);
	}

	@Override
	public int insertOrderDetailsDao(String order_id, String goods_id, String goods_amount, String goods_price) {
		// TODO Auto-generated method stub
		return dao.insertOrderDetailsDao(order_id, goods_id, goods_amount, goods_price);
	}

	@Override
	public int updateOrderMaser(String fild, String value, String order_id) {
		// TODO Auto-generated method stub
		return dao.updateOrderMaser(fild, value, order_id);
	}

	@Override
	public int updateOrderDetail(String fild, String value, String orderDetail_id) {
		// TODO Auto-generated method stub
		return dao.updateOrderDetail(fild, value, orderDetail_id);
	}

	@Override
	public List<Map<String, Object>> getUserOrderList(String user_id, Map map) {
		// TODO Auto-generated method stub
		return dao.getUserOrderList(user_id, map);
	}

	@Override
	public List<Map<String, Object>> getUserOrderDeteil(String order_id) {
		// TODO Auto-generated method stub
		return dao.getUserOrderDeteil(order_id);
	}

	@Override
	public String getIndexBySeqName(String seqName) {
		// TODO Auto-generated method stub
		return dao.getIndexBySeqName(seqName);
	}

	@Override
	public Pager<Map<String, Object>> findrOrderListt(Map map, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		return dao.findrOrderListt(map, pageNum, pageSize);
	}

}
