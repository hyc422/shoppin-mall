package org.shoppingMall.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.CartDao;
import org.shoppingMall.vo.CartVo;

import lombok.Builder;

public class ProductActionController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String page = request.getParameter("page");
		int productNum = Integer.parseInt(request.getParameter("productNum"));
		String productName = request.getParameter("productName");
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		String productCategories = request.getParameter("productCategories");
		String fileName = request.getParameter("fileName");
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		CartDao dao = CartDao.getInstance();
		int result = dao.insertCart(CartVo.builder()
				.id(id)
				.productNum(productNum)
				.productName(productName)
				.productPrice(productPrice)
				.productCategories(productCategories)
				.fileName(fileName)
				.amount(amount)
				.build()
				);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		if(result !=0) {
			response.sendRedirect(request.getContextPath()+"/Product/product?productNum="+productNum+"&page="+page);
		}else {
			response.sendRedirect(request.getContextPath());	//메인화면으로 이동
		}
	}
	

}
