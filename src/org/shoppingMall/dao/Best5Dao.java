package org.shoppingMall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.Best5Vo;

import mybatis.SqlSessionBean;

public class Best5Dao {

	private static final Best5Dao dao2 = new Best5Dao();
	private Best5Dao() {};
	public static Best5Dao getInstance() {
		return dao2;
	}
	
	public List<Best5Vo> Best5() {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<Best5Vo> list = mapperSession.selectList("product.selectBest5");
		mapperSession.close();
		return list;
	}

	
}