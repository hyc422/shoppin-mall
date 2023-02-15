package org.shoppingMall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.RecommendItemVo;

import mybatis.SqlSessionBean;

//추천상품
public class RecommendItemDao {
	private static final RecommendItemDao dao = new RecommendItemDao();
	private RecommendItemDao() {};
	public static RecommendItemDao getInstance() {
		return dao;
	}
	
	public List<RecommendItemVo> list() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<RecommendItemVo> list = mapperSession.selectList("RecommendItem.selectlistItem");
		mapperSession.close();
		return list;
	}
	
	public int insert(RecommendItemVo item) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.insert("RecommendItem.insertItem",item);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	public int delete(RecommendItemVo item) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("RecommendItem.insertItem",item);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
}
