<%@page import="org.shoppingMall.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheck</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	MemberDao dao = MemberDao.getInstance();
	
	int result = dao.idcheck(id);
	if(result == 1){
		out.print("no");
	}else{
		out.print("ok");
	}
%>
</body>
</html>