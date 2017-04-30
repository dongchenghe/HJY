package pers.hjy.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import pers.hjy.bean.Manager;
import pers.hjy.bean.User;
import pers.hjy.dao.AdminInterfaceDao;
import pers.hjy.util.DBUtils;
import pers.hjy.util.Pager;

public class AdminInterfaceImplDao implements AdminInterfaceDao {

	@Override
	public Manager managerLogin(String dba_name) {
		// TODO Auto-generated method stub
		String sql="select * from STAFF_USER where NAME='%s'";
		sql=sql.format(sql, dba_name);
		List<Map<String,Object>> list = DBUtils.execQuery(sql);
		if(list!=null&&list.size()>0){
			Manager manager = new Manager();
			Map map = list.get(0);
			manager.setAddr(map.get("ADDR")==null?"":map.get("ADDR").toString());
			manager.setDbaId(map.get("USER_ID")==null?"":map.get("USER_ID").toString());
			manager.setDbaName(map.get("NAME")==null?"":map.get("NAME").toString());
			manager.setPassWord(map.get("PASSWORD")==null?"":map.get("PASSWORD").toString());
			manager.setRemark(map.get("REMARK")==null?"":map.get("REMARK").toString());
			manager.setTell(map.get("TELL")==null?"":map.get("TELL").toString());
			return manager;
		}
		return null;
	}

	

	@Override
	public int updatePwd(String pwd, int user_id) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public List<Map<String, Object>> queryOrdersList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Pager<Map<String, Object>> queryOrderListt(Map map, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		StringBuffer sql= new StringBuffer("select ord.*,u.user_name,ad.receiver,ad.tell,ad.addr from orders ord left join t_user u on u.user_id=ord.user_id left join user_addr ad on ad.addr_id=ord.addr_id where 1=1 ");
		String user_id = (String) map.get("user_id");
		if(user_id!=null&&!user_id.equals("")){
			sql.append(" and ord.user_id='"+user_id+"'");
		}
		String order_id = (String) map.get("order_id");
		if(order_id!=null&&!order_id.equals("")){
			sql.append(" and ord.order_id='"+order_id+"'");
		}
		String create_date1 = (String) map.get("create_date1");
		if(create_date1!=null&&!create_date1.equals("")){
			sql.append(" and to_char(ord.create_date,'yyyymmdd')>='"+create_date1+"'");
		}
		String create_date2 = (String) map.get("create_date2");
		if(create_date2!=null&&!create_date2.equals("")){
			sql.append(" and to_char(ord.create_date,'yyyymmdd')<='"+create_date2+"'");
		}
		String order_state = (String) map.get("order_state");
		if(order_state!=null&&!order_state.equals("")){
			sql.append(" and order_state='"+order_state+"'");
		}
		String kddh = (String) map.get("kddh");
		if(kddh!=null&&!kddh.equals("")){
			sql.append(" and kddh='"+kddh+"'");
		}
		List<Map<String,Object>> list = DBUtils.execQuery(sql.toString());
		Pager<Map<String, Object>> pager = new Pager<Map<String, Object>>(pageNum, pageSize,list);
		return pager;
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
		StringBuffer sql= new StringBuffer("select ord.*,u.user_name,ad.receiver,ad.tell,ad.addr from orders ord left join t_user u on u.user_id=ord.user_id left join user_addr ad on ad.addr_id=ord.addr_id where 1=1 ");
		String user_id = (String) map.get("user_id");
		if(user_id!=null&&!user_id.equals("")){
			sql.append(" and ord.user_id='"+user_id+"'");
		}
		String order_id = (String) map.get("order_id");
		if(order_id!=null&&!order_id.equals("")){
			sql.append(" and ord.order_id='"+order_id+"'");
		}
		String create_date1 = (String) map.get("create_date1");
		if(create_date1!=null&&!create_date1.equals("")){
			sql.append(" and to_char(ord.create_date,'yyyymmdd')>='"+create_date1+"'");
		}
		String create_date2 = (String) map.get("create_date2");
		if(create_date2!=null&&!create_date2.equals("")){
			sql.append(" and to_char(ord.create_date,'yyyymmdd')<='"+create_date2+"'");
		}
		String order_state = (String) map.get("order_state");
		if(order_state!=null&&!order_state.equals("")){
			sql.append(" and order_state='"+order_state+"'");
		}
		String kddh = (String) map.get("kddh");
		if(kddh!=null&&!kddh.equals("")){
			sql.append(" and kddh='"+kddh+"'");
		}
		List<Map<String,Object>> list = DBUtils.execQuery(sql.toString());
		Pager<Map<String, Object>> pager = new Pager<Map<String, Object>>(pageNum, pageSize,list);
		return pager;
	}



	@Override
	public ArrayList<User> queryUsersList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Pager<Map<String, Object>> queryUserList(Map map, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int updateOderState(String order_id, String state, String admin_id) {
		// TODO Auto-generated method stub
		String sql="" ;
		if(state.equals("2")){
			sql = "update orders set order_state = '2',t_date = sysdate,TRUE_USER_ID='%s' where order_id='%s'";
			sql = sql.format(sql, state,admin_id,order_id);
		}
		if(state.equals("3")){
			sql = "update orders set order_state = '3',SEND_DATE = sysdate,SEND_USER_ID='%s' where order_id='%s'";
			sql = sql.format(sql, state,admin_id,order_id);
		}
		int result = DBUtils.execUpdate(sql);
		return result;
	}

}
