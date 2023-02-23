package org.shoppingMall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.PaymentVO;
import org.shoppingMall.vo.ProductFileList;
import org.shoppingMall.vo.ProductVO;
import org.shoppingMall.vo.RecommendVo;

import mybatis.SqlSessionBean;

public class ProductDAO {
	private static final ProductDAO dao = new ProductDAO();
	private ProductDAO() {	}
	public static ProductDAO getInstance() {
		return dao;
	}

	public int productInsert(ProductVO vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		
		int result = mapper.insert("product.productInsert", vo);
		mapper.commit();
		mapper.close();
		
		return result;
	}
	
	public int getSeq() {
		SqlSession mapper = SqlSessionBean.getSession();
		int result =  mapper.selectOne("product.getSeq");
		mapper.close();
		return result;
		
	}

	public int nextSeq() {
		SqlSession mapper = SqlSessionBean.getSession();
		return mapper.selectOne("product.nextSeq");
	}

	public ProductVO productSelectOne(int productNum) {
		SqlSession mapper = SqlSessionBean.getSession();
		return mapper.selectOne("product.productSelectOne", productNum);
	}
	
	public void productAddUpdate(ProductVO vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		mapper.update("product.productAddUpdate", vo);
		mapper.commit();
		mapper.close();
	}
	
	public void productAddDelete(int productNum) {
		SqlSession mapper = SqlSessionBean.getSession();
		mapper.delete("product.productAddDelete", productNum);
		mapper.commit();
		mapper.close();
	}
	//CGH
	public List<ProductFileList> selectOneList(String vo){
		SqlSession mapper = SqlSessionBean.getSession();
		List<ProductFileList> list = mapper.selectList("product.selectOneList", vo);
		mapper.close();
		return list;
	}
	//CGH
	public List<ProductVO> categoiesList() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<ProductVO> list = mapper.selectList("product.categoiesList");
		mapper.close();
		return list;
	}
	//CGH
	public ProductFileList selectOne(int vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		ProductFileList PFL = mapper.selectOne("product.selectOne",vo);
		mapper.close();
		return PFL;
	}

	public int insertPayment(PaymentVO vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		
		int result = mapper.insert("product.insertPayment", vo);
		mapper.commit();
		mapper.close();
		
		return result;
	}


	//CGH
	public List<ProductFileList> pagelist(Map<String,Object> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		List<ProductFileList> list = mapper.selectList("product.pagelist",map);
		mapper.close();
		return list;
	}
	//CGH
	public int count(String vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.selectOne("product.count",vo);
		mapper.commit();
		mapper.close();
		return result;
	}
	
	//동해
	//추천상품 조회
	public List<RecommendVo> selectrecommend() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<RecommendVo> list = mapper.selectList("product.selectrecommend");
		mapper.close();
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
	//검색물품 조회
	public List<ProductFileList> searchtop(String searchname) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<ProductFileList> list = mapperSession.selectList("product.selectproduct",searchname);
		mapperSession.close();
		return list;
	}
	
	//동해
	//높은가격순 조회
	public List<ProductFileList> searchHighPrice(String searchname) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<ProductFileList> list = mapperSession.selectList("product.selecthighprice",searchname);
		mapperSession.close();
		return list;
	}
	
	//동해
	//낮은가격순 조회
	public List<ProductFileList> searchLowPrice(String searchname) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<ProductFileList> list = mapperSession.selectList("product.selectlowprice",searchname);
		mapperSession.close();
		return list;
	}
	
	
	//동해
	//검색 페이징
	public int searchCount() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.selectOne("product.searchCount");
		mapperSession.close();
		return result;		
	}
	
	//동해
	//페이지 리스트
	public List<ProductFileList> searchpagelist(Map<String, Object> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<ProductFileList> list = mapperSession.selectList("product.searchpagelistname",map);
		mapperSession.close();
		return list;
	}
	
	public List<ProductFileList> searchHighPricepagelist(Map<String, Object> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<ProductFileList> list = mapperSession.selectList("product.searchpagelisthighprice",map);
		mapperSession.close();
		return list;
	}
	
	public List<ProductFileList> searchLowPricepagelist(Map<String, Object> map) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<ProductFileList> list = mapperSession.selectList("product.searchpagelistlowprice",map);
		mapperSession.close();
		return list;
	}

}
