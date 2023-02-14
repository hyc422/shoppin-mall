package org.shoppingMall.dao;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.ProductVO;

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
		return mapper.selectOne("product.getSeq");
	}

	
	
	
	
	
	
	
}
