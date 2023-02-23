package org.shoppingMall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.RecommendVo;

import mybatis.SqlSessionBean;

//추천상품
public class RecommendDao {
	private static final RecommendDao dao = new RecommendDao();
	private RecommendDao() {};
	public static RecommendDao getInstance() {
		return dao;
	}
	
	public List<RecommendVo> list() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<RecommendVo> list = mapperSession.selectList("product.selectAll");
		mapperSession.close();
		return list;
	}
	
	public int insert(RecommendVo item) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.insert("product.insertrecommend",item);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public int delete(String name) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("product.deleterecommend",name);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	

	
}
