package org.shoppingMall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.AnnouncementVo;

import mybatis.SqlSessionBean;

public class AnnouncementDao 
{
	// Singleton Pattern
	private static final AnnouncementDao dao = new AnnouncementDao();
	private AnnouncementDao() {};
	public static AnnouncementDao getInstance()
	{return dao;}
	
	public List<AnnouncementVo> pagelist(Map<String,Integer> map) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<AnnouncementVo> list = mapperSession.selectList("announcement.pagelist",map);
		
		mapperSession.close();
		
		return list;
	}	// method end
	
	public AnnouncementVo selectByIdx(long idx)
	{
		SqlSession mapper = SqlSessionBean.getSession();
		AnnouncementVo vo = mapper.selectOne("announcement.selectByIdx", idx);
		
		mapper.close();
		
		return vo;
	}	// method end
	
	public int setReadCount(long idx)
	{
		SqlSession mapper = SqlSessionBean.getSession();
		int result = mapper.update("announcement.setReadCount", idx);
		
		mapper.commit();
		mapper.close();
		
		return result;
	}	// method end
	
	public long insert(AnnouncementVo vo) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		mapperSession.insert("announcement.insert",vo);
		
		mapperSession.commit();
		mapperSession.close();
		
		return vo.getIdx();
	}	// method end
	
	public int update(AnnouncementVo vo) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("announcement.update",vo);
		
		mapperSession.commit();
		mapperSession.close();
		
		return result;
	}	// method end
	
	public int delete(long idx) 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("announcement.delete",idx);
		
		mapperSession.commit();
		mapperSession.close();
		
		return result;
	}	// method end
	
	public int count() 
	{
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.selectOne("announcement.count");
		
		mapperSession.close();
		
		return result;
	}	// method end
}	// Class end
