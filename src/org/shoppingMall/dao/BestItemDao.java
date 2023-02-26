package org.shoppingMall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.BestItemVo;
import org.shoppingMall.vo.ProductFileList;

import mybatis.SqlSessionBean;

public class BestItemDao {

	private static final BestItemDao dao = new BestItemDao();
	private BestItemDao() {};
	public static BestItemDao getInstance() {
		return dao;
	}
	
	public List<ProductFileList> selectAll() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<ProductFileList> list = mapperSession.selectList("product.selectAll");
		mapperSession.close();
		return list;	
	}
	
	public int insertbest(BestItemVo vo) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int item = mapperSession.insert("product.insertbest",vo);
		mapperSession.commit();
		mapperSession.close();
		return item;
	}
}
