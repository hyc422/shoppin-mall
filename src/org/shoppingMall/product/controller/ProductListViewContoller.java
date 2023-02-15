package org.shoppingMall.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.ProductDAO;

public class ProductListViewContoller implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO dao = ProductDAO.getInstance();
		String a = request.getParameter("Categories");
		
		request.setAttribute("Pvo", dao.categoiesList());
		
		request.setAttribute("selectOneList1", dao.selectOneList(a));
		
		
		System.out.println(a);
		System.out.println("+++++++++++++++++");
		System.out.println(dao.categoiesList());

		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("productList.jsp");
		dispatcher.forward(request, response);
		
	}

}

