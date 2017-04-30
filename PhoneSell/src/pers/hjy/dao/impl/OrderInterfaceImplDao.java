package pers.hjy.dao.impl;

import java.util.List;
import java.util.Map;

import pers.hjy.dao.OrderInterfaceDao;
import pers.hjy.util.DBUtils;
import pers.hjy.util.Pager;

public class OrderInterfaceImplDao implements OrderInterfaceDao {

	@Override
	public int insertNewOrderDao(String order_id,String user_id, String order_tatal, String addr_id) {
		
		String sql="insert into orders (order_id,user_id,Create_date,order_tatal,addr_id) values('%s','%s',sysdate,'%s','%s')";
		sql=sql.format(sql,order_id, user_id,order_tatal,addr_id);
		int result =DBUtils.execUpdate(sql);
		return result;
	}

	@Override
	public int insertOrderDetailsDao(String order_id, String goods_id, String goods_amount, String goods_price) {
		// TODO Auto-generated method stub
		String sql="insert into ORDER_DETAIL (ORDER_ID,GOODS_ID,PRICE,COUNT) values('%s','%s','%s','%s')";
		sql=sql.format(sql, order_id,goods_id,goods_price,goods_amount);
		int result =DBUtils.execUpdate(sql);
		return result;
	}

	@Override
	public int updateOrderMaser(String fild, String value, String order_id) {
		// TODO Auto-generated method stub
		String sql="update orders set %s = '%s' where order_id='%s'";
		sql=sql.format(sql, fild,value,order_id);
		if(fild.toLowerCase().equals("order_state")){
			if(value.equals("1")){
				sql="update orders set %s = '%s',PAY_DATE = sysdate where order_id='%s'";
				sql=sql.format(sql, fild,value,order_id);
			}else if(value.equals("4")){
				sql="update orders set %s = '%s',OVER_DATE = sysdate where order_id='%s'";
				sql=sql.format(sql, fild,value,order_id);
			}
		}
		int result =DBUtils.execUpdate(sql);
		return result;
	}

	@Override
	public String getIndexBySeqName(String seqName) {
		// TODO Auto-generated method stub
		String sql="select %s.nextval as inde from dual";
		sql=sql.format(sql, seqName);
		String  result =DBUtils.execQuery(sql).get(0).get("INDE").toString();
		return result;
	}

	@Override
	public int updateOrderDetail(String fild, String value, String orderDetail_id) {
		// TODO Auto-generated method stub
		String sql="update ORDER_DETAIL set %s = '%s' where ORDER_DETAIL_ID='%s'";
		sql=sql.format(sql, fild,value,orderDetail_id);
		int result =DBUtils.execUpdate(sql);
		return result;
	}

	@Override
	public List<Map<String, Object>> getUserOrderList(String user_id, Map map) {
		// TODO Auto-generated method stub
		String sql="select * from orders where user_id='%s'";
		sql=sql.format(sql, user_id);
		if(map.get("order_state")!=null){
			sql = sql + " and order_state='"+map.get("order_state")+"'";
		}
		return DBUtils.execQuery(sql);
	}

	@Override
	public List<Map<String, Object>> getUserOrderDeteil(String order_id) {
		// TODO Auto-generated method stub
		String sql="select mast.order_id,mast.user_id,mast.order_tatal, mast.create_date,mast.addr_id,mast.order_state,de.order_detail_id,de.price,de.count,pc.phone_color_id,pc.phone_id,pc.color,pc.img,g.name,g.detaile,g.img_src,g.count_name "
				+ "from orders mast left join ORDER_DETAIL de on mast.ORDER_ID=de.ORDER_ID "
				+ "left join phone_color pc on pc.phone_color_id=de.goods_id left join goods g on g.goods_id=pc.phone_id where mast.order_id='%s'";
		sql=sql.format(sql, order_id);
		return DBUtils.execQuery(sql);
	}

	@Override
	public Pager<Map<String, Object>> findrOrderListt(Map map, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		String user_id = (String) map.get("user_id");
		List<Map<String, Object>> list = getUserOrderList(user_id,map);
		Pager<Map<String, Object>> pager = new Pager<Map<String, Object>>(pageNum, pageSize,list);
		return pager;
	}

}
