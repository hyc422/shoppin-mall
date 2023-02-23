package org.shoppingMall.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.CartDao;
import org.shoppingMall.vo.CartVo;

public class PaylistViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartDao dao = CartDao.getInstance();
		
		request.setAttribute("vo", dao.list("admin"));
		//List<CartVo> list = dao.list(request.getParameter("admin"));
//		int sum = 0;
//		for(int i=0; i<list.size(); i++) {
//			list.get(i).getAmount();
//			sum += list.get(i).getAmount();
//		}
//		int totalPrice = 0;
//		for(int i=0; i<list.size(); i++) {
//			totalPrice += (list.get(i).getProductPrice()*list.get(i).getAmount());
//		}
		//request.setAttribute("Price", totalPrice);
	//	request.setAttribute("sum",sum);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/paylist.jsp");
		dispatcher.forward(request, response);
	}

}
