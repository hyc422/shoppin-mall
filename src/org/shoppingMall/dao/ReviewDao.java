package org.shoppingMall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.QnaVo;
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
	
	public ReviewVo selectByIdx(long idx)
	{
		SqlSession mapper = SqlSessionBean.getSession();
		ReviewVo vo = mapper.selectOne("review.selectByIdx", idx);
		
		mapper.close();
		
		return vo;
	}	// method end
	
	public int setReadCount(long idx)
	{
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("review.setReadCount", idx);
		
		mapper.commit();
		mapper.close();
		
		return result;
	}// method end
  
	public List<ReviewVo> selectnickname(String nickname)
  {
		SqlSession mapper = SqlSessionBean.getSession();
		List<ReviewVo> list = mapper.selectList("review.selectnickname",nickname);
		mapper.close();
		return list;
	} // method end

	}	// method end
	
	public long insert(ReviewVo vo) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		mapperSession.insert("review.insert",vo);
		
		mapperSession.commit();
		mapperSession.close();
		
		return vo.getIdx();
	}	// method end
	
	public int update(ReviewVo vo) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("review.update",vo);
		
		mapperSession.commit();
		mapperSession.close();
		
		return result;
	}	// method end
	
	public int delete(long idx) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("review.delete",idx);
		
		mapperSession.commit();
		mapperSession.close();
		
		return result;
	}	// method end
	
	public int count() 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.selectOne("review.count");
		
		mapperSession.close();
		
		return result;
	}	// method end
}	// Class end
