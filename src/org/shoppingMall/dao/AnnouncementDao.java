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
}	// Class end
