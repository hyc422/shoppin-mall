package org.shoppingMall.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.ProductDAO;

public class ProductAddViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ProductDAO dao = ProductDAO.getInstance();
		
		request.setAttribute("productNum", dao.nextSeq()); 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("productAdd.jsp");
		dispatcher.forward(request, response);
	}
}
