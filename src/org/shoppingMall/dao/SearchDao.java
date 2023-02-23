package org.shoppingMall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.ProductVO;
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
	

	public  List<SearchVo> searchpricehigh(String searchname) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<SearchVo> list = mapperSession.selectList("search.pricehigh",searchname);
		mapperSession.close();
		return list;
	}
	
	public  List<SearchVo> searchpricelow(String searchname) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<SearchVo> list = mapperSession.selectList("search.pricelow",searchname);
		mapperSession.close();
		return list;
	}
	
	public List<ProductVO> searchtop2(String searchname) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<ProductVO> list = mapperSession.selectList("product.selectproduct",searchname);
		mapperSession.close();
		return list;	
	}

}
