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
	public Member Idfind(Map<String,String> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		Member vo = mapper.selectOne("member.findId", map);
		mapper.close();
		return vo;
	}

	public Member findPwd(Map<String,String> map) {
		SqlSession mapper = SqlSessionBean.getSession();
		Member vo = mapper.selectOne("member.findPwd", map);
		mapper.close();
		return vo;
	}
}
