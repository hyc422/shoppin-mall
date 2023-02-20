package org.shoppingMall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.PaymentVO;
import org.shoppingMall.vo.ProductFileList;
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

	public void insertPayment(PaymentVO vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		mapper.insert("product.insertPayment", vo);
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
}
