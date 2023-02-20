package org.shoppingMall.mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.MemberDao;
import org.shoppingMall.vo.Member;

public class DeleteViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = MemberDao.getInstance();
		request.setAttribute("vo", dao.selectidx(24));
		RequestDispatcher dispatcher = request.getRequestDispatcher("deleteForm.jsp");
		dispatcher.forward(request, response);
	}

}
