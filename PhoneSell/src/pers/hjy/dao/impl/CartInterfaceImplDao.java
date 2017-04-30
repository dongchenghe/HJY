package pers.hjy.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import pers.hjy.dao.CartInterfaceDao;
import pers.hjy.util.DBUtils;

public class CartInterfaceImplDao implements CartInterfaceDao {

	@Override
	public int addGoods(String userId, String goodsId, String amount) {
		String sql="SELECT * FROM cart WHERE goods_id ="+goodsId+" and user_id="+userId;
		List<Map<String, Object>> list = DBUtils.execQuery(sql);
		if(list==null && list.size()==0){
			String sql1="INSERT INTO cart (user_id,goods_id,count) VALUES("+userId+","+goodsId+","+amount+")";
			int x = DBUtils.execUpdate(sql1);
			if(x==0){
				System.out.println("数据库插入操作出错");
				return 0;
			}
			return x;
		}else{
			Map<String, Object> map = list.get(0);
			Integer s = (Integer)(map.get("COUNT"));
			int count= Integer.parseInt(amount)+s;
			String sql2="UPDATE cart SET amount = %s WHERE user_id=%s AND goods_id=%s ";
			sql2=sql2.format(sql2, count,userId,goodsId);
			int x = DBUtils.execUpdate(sql2);
			if(x==0){
				System.out.println("数据库更新操作出错");
				return 0;
			}
			return x;
		}
	}

	@Override
	public List<Map<String, Object>> getCarGoods(String userId) {
		// TODO Auto-generated method stub
		String sql="select t.*,pc.color,pc.count as kc,pc.price as c_price,pc.img from (select car.*, g.name,g.price,g.detaile,g.count_name, g.img_src, g.is_ground,g.ground_date,g.remark from cart car,goods g where car.goods_id=g.goods_id) t "
				+ "left join phone_color pc on pc.phone_color_id=t.coods_color_id where user_id='"+userId+"'" ;
		List<Map<String, Object>> list = DBUtils.execQuery(sql);
		if(list==null || list.size()==0){
			return null;
		}
		return list;
	}

	@Override
	public int deleteGoods(String user_id, String carId) {
		String sql="DELETE FROM cart WHERE cart_id="+carId;
		DBUtils.execUpdate(sql);
		sql="SELECT * FROM cart WHERE user_id ="+user_id;
		List<Map<String, Object>> list = DBUtils.execQuery(sql);
		if(list==null || list.size()==0){
			return 0;
		}
		return 1;
	}

	@Override
	public int setGoodsCount(String carId, String goodsCount) {
		// TODO Auto-generated method stub
		String sql="UPDATE cart SET count="+goodsCount+" WHERE Cart_id ="+carId;
		int result = DBUtils.execUpdate(sql);
		return result;
	}

	@Override
	public int addPhone(String userId, String goodsId, String phone_color, String amount) {
		// TODO Auto-generated method stub
		String sql="SELECT * FROM cart WHERE goods_id ="+goodsId+" and user_id="+userId+" and COODS_COLOR_ID = "+phone_color;
		List<Map<String, Object>> list = DBUtils.execQuery(sql);
		if(list==null || list.size()==0){
			String sql1="INSERT INTO cart (user_id,goods_id,count,COODS_COLOR_ID) VALUES('"+userId+"','"+goodsId+"','"+amount+"','"+phone_color+"')";
			int x = DBUtils.execUpdate(sql1);
			if(x==0){
				System.out.println("数据库插入操作出错");
				return 0;
			}
			return x;
		}else{
			Map<String, Object> map = list.get(0);
			Object ob = map.get("COUNT");
			Integer s = new Integer(map.get("COUNT").toString());
			int count= Integer.parseInt(amount)+s;
			String sql2="UPDATE cart SET COUNT = %s WHERE user_id=%s AND goods_id=%s and COODS_COLOR_ID=%s";
			sql2=sql2.format(sql2, count,userId,goodsId,phone_color);
			int x = DBUtils.execUpdate(sql2);
			if(x==0){
				System.out.println("数据库更新操作出错");
				return 0;
			}
			return x;
		}
	}

}
