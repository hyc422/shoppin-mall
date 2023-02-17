package org.shoppingMall.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.ProductDAO;

public class ProductViewContoller implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO dao = ProductDAO.getInstance();
		request.setAttribute("Pvo", dao.selectOne(Integer.parseInt(request.getParameter("productNum"))));
		RequestDispatcher dispatcher = request.getRequestDispatcher("product.jsp");
		dispatcher.forward(request, response);
	}

}
