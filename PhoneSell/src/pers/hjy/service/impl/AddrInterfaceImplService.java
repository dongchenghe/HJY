package pers.hjy.service.impl;

import java.util.ArrayList;

import pers.hjy.bean.Address;
import pers.hjy.dao.AddrInterfaceDao;
import pers.hjy.dao.impl.AddrInterfaceImplDao;
import pers.hjy.service.AddrInterfaceService;

public class AddrInterfaceImplService implements AddrInterfaceService {
	private AddrInterfaceDao dao = new AddrInterfaceImplDao();
	@Override
	public ArrayList<Address> getReceive(String user_id) {
		// TODO Auto-generated method stub
		return dao.getReceive(user_id);
	}

	@Override
	public int updatePersonalInfoDao(String user_id, String field, String value) {
		// TODO Auto-generated method stub
		return dao.updatePersonalInfoDao(user_id, field, value);
	}

	@Override
	public int insertAddr(Address addr) {
		// TODO Auto-generated method stub
		return dao.insertAddr(addr);
	}

	@Override
	public int deletaddr(String addr_id,String user_id) {
		// TODO Auto-generated method stub
		return dao.deletaddr(addr_id,user_id);
	}

}
