package org.shoppingMall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.SearchVo;

import mybatis.SqlSessionBean;

public class SearchDao {

	private static final SearchDao dao = new SearchDao();
	private SearchDao() {};
	public static SearchDao getInstance() {
		return dao;
	}
	
	public List<SearchVo> searchtop(String searchname) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<SearchVo> list = mapperSession.selectList("search.searchtop",searchname);
		mapperSession.close();
		return list;
	}
	
	public List<SearchVo> searchCategory() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<SearchVo> list = mapperSession.selectList("search.searchCategory");
		mapperSession.close();
		return list;
	}
	
	public List<SearchVo> searchPrice() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<SearchVo> list = mapperSession.selectList("search.searchPrice");
		mapperSession.close();
		return list;
	}
	
	public List<SearchVo> searchName() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<SearchVo> list = mapperSession.selectList("search.searchName");
		mapperSession.close();
		return list;
	}
	
	public List<SearchVo> searchLowPrice() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<SearchVo> list = mapperSession.selectList("search.searchLowPrice");
		mapperSession.close();
		return list;
	}
	
	public List<SearchVo> searchHighPrice() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<SearchVo> list = mapperSession.selectList("search.searchHighPrice");
		mapperSession.close();
		return list;
	}
}
