package org.shoppingMall.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;

public class ProductAddPaymentViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		int productNum = Integer.parseInt(request.getParameter("productNum"));
		String productName = request.getParameter("productName");
		String productCategories = request.getParameter("productCategories");
		String fileName = request.getParameter("fileName");
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		request.setAttribute("productNum", productNum);
		request.setAttribute("productName", productName);
		request.setAttribute("productPrice", productPrice);
		request.setAttribute("amount", amount);
		request.setAttribute("productCategories", productCategories);
		request.setAttribute("fileName", fileName);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("productAddPayment.jsp");
		dispatcher.forward(request, response);
		
	}

}
