package org.shoppingMall.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.MemberDao;
import org.shoppingMall.vo.Member;


public class IDViewController implements Controller{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Map<String, String> map = new HashMap<>();
		HttpSession session = request.getSession();
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberDao dao = MemberDao.getInstance();
			
			map.put("name", name);
			map.put("email", email);
			Member vo = dao.Idfind(map);
			
			session.setAttribute("vo", vo);
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath());
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("findmem.jsp");
		dispatcher.forward(request, response);
	}
	
}
