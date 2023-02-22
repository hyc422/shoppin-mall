package org.shoppingMall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.ReviewVo;

import mybatis.SqlSessionBean;

public class ReviewDao 
{
	// Singleton Pattern
	private static final ReviewDao dao = new ReviewDao();
	private ReviewDao() {};
	public static ReviewDao getInstance()
	{return dao;}
	
	public List<ReviewVo> pagelist(Map<String,Integer> map) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<ReviewVo> list = mapperSession.selectList("review.pagelist",map);
		
		mapperSession.close();
		
		return list;
	}	// method end
}	// Class end
