package org.shoppingMall.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.MemberDao;
import org.shoppingMall.vo.Member;

public class LoginActionController implements Controller{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		Map<String, String> map = new HashMap<>();
		map.put("id",id);
		map.put("password",password);
		String url = request.getContextPath();
		
		MemberDao dao = MemberDao.getInstance();
		Member vo = dao.login(map);
		
		if(vo != null) {
			session.setAttribute("user", vo);
		}else {
			url="login?fail";
		}
		
		response.sendRedirect(url); //메인페이지로 요정 redirect

		
	}

}
