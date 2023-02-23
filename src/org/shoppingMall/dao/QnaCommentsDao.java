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
}	// Class end
