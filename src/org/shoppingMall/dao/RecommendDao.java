package org.shoppingMall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.ProductFileList;
import org.shoppingMall.vo.RecommendVo;

import mybatis.SqlSessionBean;

//추천상품
public class RecommendDao {
	private static final RecommendDao dao = new RecommendDao();
	private RecommendDao() {};
	public static RecommendDao getInstance() {
		return dao;
	}
	
	//동해
	//추천상품 조회
	public List<RecommendVo> list() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<RecommendVo> list = mapperSession.selectList("product.selectAll");
		mapperSession.close();
		return list;
	}
	
	//동해
	//추천상품 등록
	public int insert(RecommendVo item) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.insert("product.insertrecommend",item);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	//동해
	//추천상품 삭제
	public int delete(String name) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("product.deleterecommend",name);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	
	//동해
	//모든상품 가져오기
	public List<ProductFileList> selectAll() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<ProductFileList> result = mapperSession.selectList("product.selectAll");
		mapperSession.close();
		return result;
	}
	
	//동해
	//이름으로 조회
	public List<ProductFileList> selectName(String name) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<ProductFileList> result = mapperSession.selectList("product.selectName");
		mapperSession.close();
		return result;
	}
	
}
