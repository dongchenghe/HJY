package pers.hjy.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import pers.hjy.bean.Address;
import pers.hjy.dao.AddrInterfaceDao;
import pers.hjy.util.DBUtils;
import pers.hjy.util.DBUtilsTest;

public class AddrInterfaceImplDao implements AddrInterfaceDao{
	public ArrayList<Address> getReceive(String user_id){
		String sql = "SELECT * FROM user_addr WHERE user_id ='%s' and is_valid='0'";
		sql = sql.format(sql, user_id);
		List<Map<String,Object>> list = DBUtils.execQuery(sql);
		// 查询不到就返回null
		if(list==null||list.size()==0){
			return null;
		}
		ArrayList<Address> address_list = new ArrayList<Address>();
		for(int i=0;i<list.size();i++){
			Address address = new Address();
			Map map = list.get(i);
			address.setUserId(map.get("USER_ID")==null?"":map.get("USER_ID").toString());
			address.setAddrId(map.get("ADDR_ID")==null?"":map.get("ADDR_ID").toString());
			address.setAddress(map.get("ADDR")==null?"":map.get("ADDR").toString());
			address.setReceiver(map.get("RECEIVER")==null?"":map.get("RECEIVER").toString());
			address.setRemark(map.get("REMARK")==null?"":map.get("REMARK").toString());
			address.setTell(map.get("TELL")==null?"":map.get("TELL").toString());
			address_list.add(address);
		}
		return address_list;
	}
	public int updatePersonalInfoDao(String user_id,String field,String value){
		String sql="update user_addr set "+field+" ='"+value+"' where user_id='"+user_id+"'";
		int result = DBUtils.execUpdate(sql);
		return result;
	}
	@Override
	public int insertAddr(Address addr) {
		// TODO Auto-generated method stub
		String sql="insert into user_addr (user_id,RECEIVER,TELL,ADDR,REMARK) values('"+addr.getUserId()+"','"+addr.getReceiver()+"','"+addr.getTell()+"','"+addr.getAddress()+"','"+addr.getRemark()+"')";
		int result = DBUtils.execUpdate(sql);
		return result;
	}
	@Override
	public int deletaddr(String addr_id,String user_id) {
		// TODO Auto-generated method stub
		String sql="update USER_ADDR set IS_VALID = '1' where addr_id='"+addr_id+"' and user_id='"+user_id+"'";
		int result = DBUtils.execUpdate(sql);
		return result;
	}
}
