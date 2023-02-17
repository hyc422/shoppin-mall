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
}
