package org.shoppingMall.dao;

import java.util.List;

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

}
