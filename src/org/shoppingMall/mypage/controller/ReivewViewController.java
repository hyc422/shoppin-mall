package org.shoppingMall.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.ReviewDao;
import org.shoppingMall.vo.ReviewVo;

public class ReivewViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname = request.getParameter("nickname");
		ReviewDao dao = ReviewDao.getInstance();
		List<ReviewVo> list = dao.selectnickname(nickname);
		
		request.setAttribute("vo", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("rivewlist.jsp");
		dispatcher.forward(request, response);
	}

}
