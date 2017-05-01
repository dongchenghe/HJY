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
	public Pager<Map<String, Object>> queryGooodsList(Map map, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		StringBuffer sql= new StringBuffer("select g.* ,pc.phone_color_id,pc.color,pc.count,pc.price as c_price  from goods g left join phone_color pc on g.goods_id=pc.phone_id where 1=1 ");
		String goods_name = (String) map.get("goods_name");
		if(goods_name!=null&&!goods_name.equals("")){
			sql.append(" and g.name like '%"+goods_name+"%'");
		}
		String goods_color = (String) map.get("goods_color");
		if(goods_color!=null&&!goods_color.equals("")){
			sql.append(" and pc.color like '%"+goods_color+"%'");
		}
		String kc1 = (String) map.get("kc1");
		if(kc1!=null&&!kc1.equals("")){
			sql.append(" and pc.count>='"+kc1+"'");
		}
		String kc2 = (String) map.get("kc2");
		if(kc2!=null&&!kc2.equals("")){
			sql.append(" and g.sell_count<='"+kc2+"'");
		}
		String sell_count1 = (String) map.get("sell_count1");
		if(sell_count1!=null&&!sell_count1.equals("")){
			sql.append(" and g.sell_count>='"+sell_count1+"'");
		}
		String sell_count2 = (String) map.get("sell_count2");
		if(sell_count2!=null&&!sell_count2.equals("")){
			sql.append(" and g.sell_count<='"+sell_count2+"'");
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
		
		StringBuffer sql= new StringBuffer("select * from t_user where 1=1 ");
		String user_id = (String) map.get("user_id");
		if(user_id!=null&&!user_id.equals("")){
			sql.append(" and user_id = '"+user_id+"'");
		}
		String user_name = (String) map.get("user_name");
		if(user_name!=null&&!user_name.equals("")){
			sql.append(" and user_name like '%"+user_name+"%'");
		}
		String sex = (String) map.get("sex");
		if(sex!=null&&!sex.equals("")){
			sql.append(" and sex='"+sex+"'");
		}
		String is_valid = (String) map.get("is_valid");
		if(is_valid!=null&&!is_valid.equals("")){
			sql.append(" and is_valid='"+is_valid+"'");
		}
		String createdate1 = (String) map.get("createdate1");
		if(createdate1!=null&&!createdate1.equals("")){
			sql.append(" and to_char(create_date,'yyyymmdd')>='"+createdate1+"'");
		}
		String createdate2 = (String) map.get("createdate2");
		if(createdate2!=null&&!createdate2.equals("")){
			sql.append(" and to_char(create_date,'yyyymmdd')<='"+createdate2+"'");
		}
		
		List<Map<String,Object>> list = DBUtils.execQuery(sql.toString());
		Pager<Map<String, Object>> pager = new Pager<Map<String, Object>>(pageNum, pageSize,list);
		return pager;
	}



	@Override
	public int updateOderState(String order_id, String state, String admin_id) {
		// TODO Auto-generated method stub
		String sql="" ;
		if(state.equals("2")){
			sql = "update orders set order_state = '2',t_date = sysdate,TRUE_USER_ID='%s' where order_id='%s'";
			sql = sql.format(sql,admin_id,order_id);
		}
		if(state.equals("3")){
			sql = "update orders set order_state = '3',SEND_DATE = sysdate,SEND_USER_ID='%s' where order_id='%s'";
			sql = sql.format(sql,admin_id,order_id);
		}
		int result = DBUtils.execUpdate(sql);
		return result;
	}



	@Override
	public List<Map<String, Object>> queryGoodsById(String goods_color_id) {
		// TODO Auto-generated method stub
		String sql = "select g.* ,pc.phone_color_id,pc.color,pc.count,pc.price as c_price  from goods g left join phone_color pc on g.goods_id=pc.phone_id where pc.phone_color_id='%s'";
		sql = sql.format(sql, goods_color_id);
		return  DBUtils.execQuery(sql);
	}



	@Override
	public int updateGoods(String table, String filed, String value, String idname, String id) {
		// TODO Auto-generated method stub
		String sql = "update %s set %s = '%s' where %s='%s'";
		sql = sql.format(sql, table,filed,value,idname,id);
		int result = DBUtils.execUpdate(sql);
		return result;
	}


	@Override
	public int insertGoodsAndColor(Map map) {
		// TODO Auto-generated method stub
		String name = (String) map.get("name");
		String price = (String) map.get("price");
		String color = (String) map.get("color");
		String img_src =(String) map.get("img_src");
		String count = (String) map.get("count");
		String is_ground = (String) map.get("is_ground");
		String detaile = (String) map.get("detaile");
		String count_name = (String) map.get("count_name");
		String goods_id = (String) map.get("goods_id");
		String img = (String) map.get("img");
		
		String sql = "insert into goods (goods_id,NAME,PRICE,DETAILE,COUNT_NAME,IMG_SRC,IS_GROUND,GROUND_DATE) values('%s','%s','%s','%s','%s','%s','%s',sysdate)";
		sql = sql.format(sql, goods_id,name,price,detaile,count_name,img_src,is_ground);
		int result = DBUtils.execUpdate(sql);
		
		String sql1 = "insert into PHONE_COLOR (PHONE_ID,COLOR,COUNT,PRICE,IMG) values('%s','%s','%s','%s','%s')";
		sql1 = sql1.format(sql1, goods_id,color,count,price,img);
		result = DBUtils.execUpdate(sql1);
		return result;
	}



	@Override
	public int insertGoodsColor(String goods_id, String color, String count, String price, String img) {
		// TODO Auto-generated method stub
		String sql1 = "insert into PHONE_COLOR (PHONE_ID,COLOR,COUNT,PRICE,IMG) values('%s','%s','%s','%s','%s')";
		sql1 = sql1.format(sql1, goods_id,color,count,price,img);
		int result = DBUtils.execUpdate(sql1);
		return result;
	}


	@Override
	public int updatePwd(String pwd, String user_id) {
		String sql1 = "update t_user set USER_PWD ='%s' where user_id='%s'";
		sql1 = sql1.format(sql1, pwd,user_id);
		int result = DBUtils.execUpdate(sql1);
		return result;
	}


	@Override
	public int updateUser(String filed, String value, String user_id) {
		// TODO Auto-generated method stub
		String sql1 = "update t_user set %s ='%s' where user_id='%s'";
		sql1 = sql1.format(sql1,filed, value,user_id);
		int result = DBUtils.execUpdate(sql1);
		return result;
	}


	@Override
	public List<Map<String, Object>> queryTypeList(String type) {
		// TODO Auto-generated method stub
		String sql = "select gs.goods_show_id,gs.show_id,gs.sequen,gs.show_name, g.* from goods_show gs left join goods g on g.goods_id=gs.goods_id where gs.show_id='%s'";
		sql = sql.format(sql, type);
		return DBUtils.execQuery(sql);
	}


	@Override
	public int updatTypeById(String goods_id, String sequen,String goods_show_id) {
		// TODO Auto-generated method stub
		String sql = "update GOODS_SHOW set goods_id='%s',sequen='%s' where goods_show_id='%s'";
		sql = sql.format(sql, goods_id,sequen,goods_show_id);
		int result = DBUtils.execUpdate(sql);
		return result;
	}

}
