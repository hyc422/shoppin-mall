package org.shoppingMall.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.QnaDao;
import org.shoppingMall.vo.Member;
import org.shoppingMall.vo.QnaVo;


public class qnalistViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member user =(Member)session.getAttribute("user");
		
		String nickname = request.getParameter("nickname");
		QnaDao dao = QnaDao.getInstance();
		List<QnaVo> list = dao.selectqnalist(nickname);
		
		request.setAttribute("vo", list);
		System.out.println(list);
		System.out.println(nickname);
		RequestDispatcher dispatcher = request.getRequestDispatcher("qnalist.jsp");
		dispatcher.forward(request, response);

	}

}
