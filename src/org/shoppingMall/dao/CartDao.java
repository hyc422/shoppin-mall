package org.shoppingMall.dao;

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
}
