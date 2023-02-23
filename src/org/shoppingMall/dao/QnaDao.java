package org.shoppingMall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.QnaVo;

import mybatis.SqlSessionBean;

public class QnaDao 
{
	// Singleton Pattern
	private static final QnaDao dao = new QnaDao();
	private QnaDao() {};
	public static QnaDao getInstance()
	{return dao;}
	
	public List<QnaVo> pagelist(Map<String,Integer> map) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<QnaVo> list = mapperSession.selectList("qna.pagelist",map);
		
		mapperSession.close();
		
		return list;
	}	// method end
}	// Class end
