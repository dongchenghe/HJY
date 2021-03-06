package pers.hjy.service;

import java.util.Map;

import pers.hjy.bean.User;

public interface UserInterfaceService {
	int save(User user);
	boolean isExistUsername(String user_name);
	User findUser(String userName, String passWord);
	int updateUser(String user_id, String filed, String value);
}
