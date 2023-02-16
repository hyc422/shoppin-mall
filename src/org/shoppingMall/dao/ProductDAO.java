package org.shoppingMall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.ProductFileList;
import org.shoppingMall.vo.ProductVO;

import lombok.ToString;
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

	public List<ProductFileList> selectOneList(String vo){
		SqlSession mapper = SqlSessionBean.getSession();
		List<ProductFileList> list = mapper.selectList("product.selectOneList", vo);
		mapper.close();
		return list;
	}
	
	public List<ProductVO> categoiesList() {
		SqlSession mapper = SqlSessionBean.getSession();
		List<ProductVO> list = mapper.selectList("product.categoiesList");
		mapper.close();
		return list;
	}
	
	
	
	
}
