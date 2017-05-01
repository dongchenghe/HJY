package pers.hjy.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import pers.hjy.bean.Manager;
import pers.hjy.bean.User;
import pers.hjy.util.Pager;

public interface AdminInterfaceDao {
	/*登录有关*/
	Manager managerLogin(String dba_name);
	
	/*订单有关*/
	List<Map<String,Object>> queryOrdersList(Map map);
	Pager<Map<String, Object>> queryOrderListt(Map map, int pageNum, int pageSize);
	int updateOderState(String order_id,String state,String admin_id);
	/*商品有关*/
	int updateGoods(String table,String filed,String value,String idname,String id);
	int insertGoodsAndColor(Map map);
	int insertGoodsColor(String goods_id ,String color,String count,String price,String img );
	List<Map<String,Object>> queryGoodsById(String goods_color_id);
	Pager<Map<String, Object>> queryGooodsList(Map map, int pageNum, int pageSize);
	/*用户相关*/
	ArrayList<User> queryUsersList(Map map);
	Pager<Map<String, Object>> queryUserList(Map map, int pageNum, int pageSize);
	int updatePwd(String pwd,String user_id);
	int updateUser(String filed,String value,String user_id);
	/*商品展示有关*/
	List<Map<String,Object>> queryTypeList(String type);
	int updatTypeById(String goods_id,String sequen,String goods_show_id);
}
