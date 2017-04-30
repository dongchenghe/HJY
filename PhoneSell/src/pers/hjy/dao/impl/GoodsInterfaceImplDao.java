package pers.hjy.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import pers.hjy.bean.Goods;
import pers.hjy.dao.GoodsInterfaceDao;
import pers.hjy.util.DBUtils;

public class GoodsInterfaceImplDao implements GoodsInterfaceDao {

	//查询展示的商品
		public  ArrayList<Goods> getGoodsByShow(int showId){
			ArrayList<Goods> goodsArr = new ArrayList<Goods>();
			String sql="SELECT * FROM goods WHERE goods_id IN(SELECT goods_id FROM goods_show WHERE SHOW_ID='"+showId+"')";
			if(showId==3){
				sql="SELECT * FROM goods";
			}
			List<Map<String, Object>> list = DBUtils.execQuery(sql);
			if(list!=null&&list.size()>0){
				for(int i=0;i<list.size();i++){
					Map map = list.get(i);
					Goods goods = new Goods();
					goods.setCountName(map.get("COUNT_NAME")==null?"":map.get("COUNT_NAME").toString());
					goods.setDetaile(map.get("DETAILE")==null?"":map.get("DETAILE").toString());
					goods.setGoodsId(map.get("GOODS_ID")==null?"":map.get("GOODS_ID").toString());
					goods.setImgSrc(map.get("IMG_SRC")==null?"":map.get("IMG_SRC").toString());
					goods.setIsValid(map.get("IS_GROUND")==null?"":map.get("IS_GROUND").toString());
					goods.setName(map.get("NAME")==null?"":map.get("NAME").toString());
					goods.setPrice(map.get("PRICE")==null?null:new Float(map.get("PRICE").toString()));
					goods.setRemark(map.get("REMARK")==null?"":map.get("REMARK").toString());
					goodsArr.add(goods);
				}
			}
			return goodsArr;
		}
		public Goods getGoods(String goodsId){
			String sql="SELECT * FROM goods WHERE goods_id ="+goodsId;
			List<Map<String, Object>> list = DBUtils.execQuery(sql);
			if(list==null || list.size()==0){
				//异常处理
				return null;
			}else{
				Map map = list.get(0);
				Goods goods = new Goods();
				goods.setCountName(map.get("COUNT_NAME")==null?"":map.get("COUNT_NAME").toString());
				goods.setDetaile(map.get("DETAILE")==null?"":map.get("DETAILE").toString());
				goods.setGoodsId(map.get("GOODS_ID")==null?"":map.get("GOODS_ID").toString());
				goods.setImgSrc(map.get("IMG_SRC")==null?"":map.get("IMG_SRC").toString());
				goods.setIsValid(map.get("IS_GROUND")==null?"":map.get("IS_GROUND").toString());
				goods.setName(map.get("NAME")==null?"":map.get("NAME").toString());
				goods.setPrice(map.get("PRICE")==null?null:new Float(map.get("PRICE").toString()));
				goods.setRemark(map.get("REMARK")==null?"":map.get("REMARK").toString());
				return goods;
			}
		}
		@Override
		public List<Map<String, Object>> getGoodsColor(String goodsId) {
			String sql = "select * from  phone_color where phone_id='"+goodsId+"'";
			List<Map<String, Object>> list = DBUtils.execQuery(sql);
			return list;
		}
}
