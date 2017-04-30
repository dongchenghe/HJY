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
	public int updateType(String position_name, int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> queryGoodsList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> getAllTypeGooods() {
		// TODO Auto-generated method stub
		return null;
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
	public int updatePwd(String pwd, int user_id) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int updateOderState(String order_id, String state, String admin_id) {
		// TODO Auto-generated method stub
		return dao.updateOderState(order_id, state, admin_id);
	} 

}
