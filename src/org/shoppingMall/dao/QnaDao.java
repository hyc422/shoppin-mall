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
	
	public QnaVo selectByIdx(long idx)
	{
		SqlSession mapper = SqlSessionBean.getSession();
		QnaVo vo = mapper.selectOne("qna.selectByIdx", idx);
		
		mapper.close();
		
		return vo;
	}	// method end
	
	public int setReadCount(long idx)
	{
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("qna.setReadCount", idx);
		
		mapper.commit();
		mapper.close();
		
		return result;
	}	// method end
	public List<QnaVo> selectqnalist(String nickname){
		SqlSession mapper = SqlSessionBean.getSession();
		List<QnaVo> list = mapper.selectList("qna.selectqnalist",nickname);
		mapper.close();
		return list;
	}
	
}	// Class end
