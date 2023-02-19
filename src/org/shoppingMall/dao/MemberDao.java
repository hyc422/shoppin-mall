package org.shoppingMall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.shoppingMall.vo.Member;

import mybatis.SqlSessionBean;

public class MemberDao {
	private static final MemberDao dao = new MemberDao();
	private MemberDao() {	}
	public static MemberDao getInstance() {
		return dao;
		
		
		
	}
	
	public List<Member> selectAll(){
		SqlSession mapper = SqlSessionBean.getSession();
		List<Member> list = mapper.selectList("selectAll");
		
		mapper.close(); // 필수
		return list;
	}
	public long register(Member vo){
		SqlSession mapper = SqlSessionBean.getSession();
		long result = mapper.insert("member.register",vo);
		
		mapper.commit();
		mapper.close();
		return result;
	}
	public Member login(Map<String,String> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		Member vo = mapper.selectOne("member.login",map);
		mapper.close();
		return vo;
	}
	public Member selectidx(long idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		Member vo = mapperSession.selectOne("member.selectidx",idx);
		mapperSession.close();
		return vo;
	}
	public int update(Member vo) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.update("member.update",vo);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	public int delete(long idx) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.delete("member.delete",idx);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	public Member seletepass(String password) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		Member vo = mapperSession.selectOne("member.selectpass",password);
		mapperSession.close();
		return vo;
	}
}
