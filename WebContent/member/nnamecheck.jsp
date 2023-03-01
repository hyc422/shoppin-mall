<%@page import="org.shoppingMall.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nickname = request.getParameter("nickname");
	MemberDao dao = MemberDao.getInstance();
	
	int result = dao.nnamecheck(nickname);
	if(result >= 1){
		out.print("no");
	}else{
		out.print("ok");
	}
%>
