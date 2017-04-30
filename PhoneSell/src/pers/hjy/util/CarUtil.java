package pers.hjy.util;

public class CarUtil {
	public static String getString(String goods,String goods_id,String count){
		String[] a = goods.split(",");
		boolean isCun = false;
		for(int i=0;i<a.length;i++){
			String id = a[i].substring(0, a[i].indexOf(':'));
			String c = a[i].substring(a[i].indexOf(':')+1);
			if(goods_id.equals(id)){
				int x = Integer.parseInt(c)+Integer.parseInt(count);
				a[i] = id+":"+x;
				isCun = true;
				break;
			}
		}
		String newgoods = new String();
		for(int i= 0;i<a.length;i++){
			if(i==0){
				newgoods = a[i];
			}else{
				newgoods =newgoods+","+ a[i];
			}
		}
		if(!isCun){
			if(!newgoods.equals("")){
				newgoods = newgoods+","+goods_id+":"+count;
			}else{
				newgoods = goods_id+":"+count;
			}
		}
		return newgoods;
	}
}
