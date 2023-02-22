package org.shoppingMall.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.CartDao;

public class CartDeleteAllController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CartDao dao = CartDao.getInstance();
		String id = request.getParameter("id");
		
		int result = dao.deleteAll(id);
		
		if(result !=0) {
			response.sendRedirect(request.getContextPath()+"/cart?id="+id);
		}
		

	}

}
