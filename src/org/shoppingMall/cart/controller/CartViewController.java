package org.shoppingMall.cart.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.CartDao;

public class CartViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartDao dao = CartDao.getInstance();
		
		request.setAttribute("vo", dao.list(request.getParameter("id")));
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/cart.jsp");
		dispatcher.forward(request, response);
	}

}
