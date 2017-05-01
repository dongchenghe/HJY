package pers.hjy.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import pers.hjy.bean.Manager;
import pers.hjy.bean.User;
import pers.hjy.dao.AdminInterfaceDao;
import pers.hjy.dao.impl.AdminInterfaceImplDao;
import pers.hjy.service.AdminInterfaceService;
import pers.hjy.util.Pager;

public class AdminInterfaceImplService implements AdminInterfaceService {
	private AdminInterfaceDao dao = new AdminInterfaceImplDao();

	@Override
	public Manager managerLogin(String dba_name) {
		// TODO Auto-generated method stub
		return dao.managerLogin(dba_name);
	}


	@Override
	public Pager<Map<String, Object>> queryOrderList(Map map, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		return dao.queryOrderListt(map, pageNum, pageSize);
	}

	@Override
	public Pager<Map<String, Object>> queryGooodsList(Map map, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		return dao.queryGooodsList(map, pageNum, pageSize);
	}

	@Override
	public ArrayList<User> queryUsersList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager<Map<String, Object>> queryUserList(Map map, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		return dao.queryUserList(map, pageNum, pageSize);
	}

	@Override
	public int updateOderState(String order_id, String state, String admin_id) {
		// TODO Auto-generated method stub
		return dao.updateOderState(order_id, state, admin_id);
	}


	@Override
	public List<Map<String, Object>> queryGoodsById(String goods_color_id) {
		// TODO Auto-generated method stub
		return dao.queryGoodsById(goods_color_id);
	}


	@Override
	public int updateGoods(String table, String filed, String value, String idname, String id) {
		// TODO Auto-generated method stub
		return dao.updateGoods(table, filed, value, idname, id);
	}


	@Override
	public int insertGoodsAndColor(Map map) {
		// TODO Auto-generated method stub
		return dao.insertGoodsAndColor(map);
	}


	@Override
	public int insertGoodsColor(String goods_id, String color, String count, String price, String img) {
		// TODO Auto-generated method stub
		return dao.insertGoodsColor(goods_id, color, count, price, img);
	}


	@Override
	public int updatePwd(String pwd, String user_id) {
		// TODO Auto-generated method stub
		return dao.updatePwd(pwd, user_id);
	}


	@Override
	public int updateUser(String filed, String value, String user_id) {
		// TODO Auto-generated method stub
		return dao.updateUser(filed, value, user_id);
	}


	@Override
	public List<Map<String, Object>> queryTypeList(String type) {
		// TODO Auto-generated method stub
		return dao.queryTypeList(type);
	}


	@Override
	public int updatTypeById(String goods_id, String sequen, String goods_show_id) {
		// TODO Auto-generated method stub
		return dao.updatTypeById(goods_id, sequen, goods_show_id);
	} 

}
