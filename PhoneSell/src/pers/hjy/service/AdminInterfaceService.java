package pers.hjy.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import pers.hjy.bean.Manager;
import pers.hjy.bean.User;
import pers.hjy.util.Pager;

public interface AdminInterfaceService {
	/*登录有关*/
	Manager managerLogin(String dba_name);
	
	/*订单有关*/
	Pager<Map<String, Object>> queryOrderList(Map map, int pageNum, int pageSize);
	int updateOderState(String order_id,String state,String admin_id);
	/*商品有关*/
	int updateType(String position_name,int id);
	List<Map<String,Object>> queryGoodsList(Map map);
	List<Map<String,Object>> getAllTypeGooods();
	Pager<Map<String, Object>> queryGooodsList(Map map, int pageNum, int pageSize);
	/*用户相关*/
	ArrayList<User> queryUsersList(Map map);
	Pager<Map<String, Object>> queryUserList(Map map, int pageNum, int pageSize);
	int updatePwd(String pwd,int user_id);
}
