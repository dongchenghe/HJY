package pers.hjy.dao;

import java.util.ArrayList;

import pers.hjy.bean.Address;

public interface AddrInterfaceDao {
	ArrayList<Address> getReceive(String user_id);
	int updatePersonalInfoDao(String user_id,String field,String value);
	int insertAddr(Address addr);
	int deletaddr(String addr_id,String user_id);
}
