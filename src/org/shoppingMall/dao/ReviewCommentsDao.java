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
}	// Class end
