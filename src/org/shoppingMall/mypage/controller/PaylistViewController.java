package org.shoppingMall.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.ProductDAO;
import org.shoppingMall.vo.PaymentVO;

public class PaylistViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String id = request.getParameter("id");
			System.out.println(id);
			ProductDAO dao = ProductDAO.getInstance();
			List<PaymentVO> list = dao.selectId(id);
			//request.setAttribute("vo", dao.selectId(request.getParameter("id")));
			System.out.println(list);
	
			request.setAttribute("vo", list);
			RequestDispatcher dispatcher = request.getRequestDispatcher("paylist.jsp");
			dispatcher.forward(request, response);
			//List<PaymentVO> list = dao.selectId(request.getParameter("id"));
		
	}
//
}
