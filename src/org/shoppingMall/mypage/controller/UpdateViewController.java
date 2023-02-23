package org.shoppingMall.mypage.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.MemberDao;
import org.shoppingMall.vo.Member;

public class UpdateViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("idx");
		long idx=0;
		HttpSession session = request.getSession();
		Member user = (Member) session.getAttribute("user");
		try {
		idx= Long.parseLong(temp);
//		long idx = Long.parseLong(request.getParameter("idx"));
		MemberDao dao = MemberDao.getInstance();
		Member vo = dao.selectidx(idx);
	if(vo==null || !vo.getId().equals(user.getId())) throw new RuntimeException();
		request.setAttribute("vo", vo);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
		dispatcher.forward(request, response);
		}catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath());
		}
		
	}

}
