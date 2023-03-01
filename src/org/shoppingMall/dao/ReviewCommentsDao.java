package org.shoppingMall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.ReviewCommentsVo;

import mybatis.SqlSessionBean;

public class ReviewCommentsDao 
{
	private static final ReviewCommentsDao dao = new ReviewCommentsDao();
	private ReviewCommentsDao () {};
	public static ReviewCommentsDao getInstance()
	{return dao;}
	
	public List<ReviewCommentsVo> comments(long mref)
	{
		SqlSession mapper = SqlSessionBean.getSession();
		List<ReviewCommentsVo> commentList = mapper.selectList("review.comments", mref);
		
		mapper.close();
		
		return commentList;
	}	// method end
	
	public int insert(ReviewCommentsVo vo) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		int idx = mapperSession.insert("review.commentsinsert",vo);
		
		mapperSession.commit();
		mapperSession.close();
		
		return idx;
	}	// method end
	
	public int delete(int idx) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("review.commentsdelete",idx);
		
		mapperSession.commit();
		mapperSession.close();
		
		return result;
	}	// method end
	
	public int setCommentCount(long idx) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("review.setCommentCount", idx);
		
		mapperSession.commit();
		mapperSession.close();
		
		return result;
	}	// method end
}	// Class end
