package org.shoppingMall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.CartVo;

import mybatis.SqlSessionBean;

public class CartDao {
	private static final CartDao dao = new CartDao();
	private CartDao() {};
	public static CartDao getInstance() {
		return dao;
	}
	
	public int insertCart(CartVo vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.insert("cart.insertCart",vo);
		mapper.commit();
		mapper.close();
		return result;
	}
	public List<CartVo> list(String id){
		SqlSession mapper = SqlSessionBean.getSession();
		List<CartVo>list = mapper.selectList("cart.selectid",id);
		mapper.close();
		return list;
	}
	public int cartUpdate(CartVo vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("cart.cartUpdate",vo);
		mapper.commit();
		mapper.close();
		return result;
	}
	public int getSeq() {
		SqlSession mapper = SqlSessionBean.getSession();
		int result =  mapper.selectOne("cart.getSeq");
		mapper.close();
		return result;
		
	}
	
	public int delete(int vo) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("cart.delete",vo);
		mapper.commit();
		mapper.close();
		return result;
	}
	public int deleteAll(String id) {
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.delete("cart.deleteAll",id);
		mapper.commit();
		mapper.close();
		return result;
	}
	public CartVo selectNum(int num) {
		SqlSession mapper = SqlSessionBean.getSession();
		CartVo vo = mapper.selectOne("cart.selectNum",num);
		mapper.close();
		return vo;
	}
	public void selectDelete(Map<String, Object>map) {
		SqlSession mapper = SqlSessionBean.getSession();
		mapper.selectOne("cart.SelectDelete",map);
		mapper.commit();
		mapper.close();
	}
}
