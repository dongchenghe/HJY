package pers.hjy.dao.impl;

import java.util.List;
import java.util.Map;

import pers.hjy.bean.User;
import pers.hjy.dao.UserInterfaceDao;
import pers.hjy.util.DBUtils;

public class UserInterfaceImplDao implements UserInterfaceDao{
	
	public int save(User user) {
		// 获取数据
		String name = user.getName();
		String pwd =user.getPassWord();
		String sex = user.getSex();
		String phone = user.getPhoneNumber();
		String email = user.getEmail();
		String sql = "insert into t_user(user_name,user_pwd,sex,phone_number,email)"
				+ "values('"+name+"','"+pwd+"','"+sex+"','"+phone+"','"+email+"')";
		// 插入数据
		return DBUtils.execUpdate(sql);
	}
	// 通过用户名来判断用户是否存在
	public boolean isExistUsername(String user_name) {
		String sql = "select * from t_user where user_name = '"+user_name+"'";
		List<Map<String,Object>> userList = DBUtils.execQuery(sql);
		if(userList==null||userList.size()==0){
			return false;
		}
		return true;
	}
	public User findUser(String userName, String passWord) {
		String sql = "select * from t_user where user_name = '"+userName+"'and user_pwd ='"+passWord+"'";
		List<Map<String,Object>> userList = DBUtils.execQuery(sql);
		// 查询不到就返回null
		if(userList==null||userList.size()==0){
			return null;
		}
		// 查到了就将数据存在javabean中
		User user = new User();
		Map map = userList.get(0);
		user.setUserId(map.get("USER_ID")==null?"":map.get("USER_ID").toString());
		user.setName(map.get("USER_NAME")==null?"":map.get("USER_NAME").toString());
		user.setPassWord(map.get("USER_PWD")==null?"":map.get("USER_PWD").toString());
		user.setIsValid(map.get("IS_VALID")==null?"":map.get("IS_VALID").toString());
		user.setRemark(map.get("REMARK")==null?"":map.get("REMARK").toString());
		user.setSex(map.get("SEX")==null?"":map.get("SEX").toString());
		user.setTell(map.get("TELL")==null?"":map.get("TELL").toString());
		user.setPhoneNumber(map.get("PHONE_NUMBER")==null?"":map.get("PHONE_NUMBER").toString());
		user.setDefaultAddr(map.get("DEFAULT_ADDR")==null?"":map.get("DEFAULT_ADDR").toString());
		user.setEmail(map.get("EMAIL")==null?"":map.get("EMAIL").toString());
		return user;
	}
	@Override
	public int updateUser(String user_id, String filed, String value) {
		// TODO Auto-generated method stub
		String sql = "update t_user set "+filed+"='"+value+"' where user_id='"+user_id+"'";
		int result = DBUtils.execUpdate(sql);
		return result;
	}
}
