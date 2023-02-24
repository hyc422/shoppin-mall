package org.shoppingMall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.QnaCommentsVo;

import mybatis.SqlSessionBean;

public class QnaCommentsDao 
{
	private static final QnaCommentsDao dao = new QnaCommentsDao();
	private QnaCommentsDao () {};
	public static QnaCommentsDao getInstance()
	{return dao;}
	
	public List<QnaCommentsVo> comments(long mref)
	{
		SqlSession mapper = SqlSessionBean.getSession();
		List<QnaCommentsVo> commentList = mapper.selectList("qna.comments", mref);
		
		mapper.close();
		
		return commentList;
	}	// method end
	
	public int insert(QnaCommentsVo vo) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		int idx = mapperSession.insert("qna.commentsinsert",vo);
		
		mapperSession.commit();
		mapperSession.close();
		
		return idx;
	}	// method end
	
	public int delete(int idx) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("qna.commentsdelete",idx);
		
		mapperSession.commit();
		mapperSession.close();
		
		return result;
	}	// method end
	
	public int setCommentCount(long idx) 
	{
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("qna.setCommentCount", idx);
		
		session.commit();
		session.close();
		
		return result;
	}	// method end
}	// Class end
