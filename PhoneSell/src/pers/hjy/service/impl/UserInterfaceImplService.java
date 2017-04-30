package pers.hjy.service.impl;

import pers.hjy.bean.User;
import pers.hjy.dao.UserInterfaceDao;
import pers.hjy.dao.impl.UserInterfaceImplDao;
import pers.hjy.service.UserInterfaceService;

public class UserInterfaceImplService implements UserInterfaceService{

	private UserInterfaceDao dao = new UserInterfaceImplDao();
	public UserInterfaceImplService(UserInterfaceDao dao) {
		this.dao=dao;
	}
	public UserInterfaceImplService() {
		
	}
	public int save(User user) {
		// TODO Auto-generated method stub
		return dao.save(user);
	}

	public boolean isExistUsername(String user_name) {
		// TODO Auto-generated method stub
		return dao.isExistUsername(user_name);
	}

	public User findUser(String userName, String passWord) {
		// TODO Auto-generated method stub
		return dao.findUser(userName, passWord);
	}
	@Override
	public int updateUser(String user_id, String filed, String value) {
		// TODO Auto-generated method stub
		return dao.updateUser(user_id, filed, value);
	}
	
}
