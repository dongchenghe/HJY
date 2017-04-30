package pers.hjy.dao;

import java.util.List;
import java.util.Map;

import pers.hjy.util.Pager;

public interface OrderInterfaceDao {
	int insertNewOrderDao(String order_id,String user_id,String order_tatal,String addr_id);
	int insertOrderDetailsDao(String order_id,String goods_id,String goods_amount,String goods_price);
	int updateOrderMaser(String fild,String value,String order_id);
	int updateOrderDetail(String fild,String value,String orderDetail_id);
	List<Map<String, Object>> getUserOrderList(String user_id,Map map);
	List<Map<String, Object>> getUserOrderDeteil(String order_id);
	String getIndexBySeqName(String seqName);
	Pager<Map<String, Object>> findrOrderListt(Map map, int pageNum, int pageSize);
}
