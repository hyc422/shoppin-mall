package org.shoppingMall.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.CartDao;
import org.shoppingMall.vo.CartVo;

import lombok.Builder;

public class CartActoinController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String id = request.getParameter("id");
//		int productNum = Integer.parseInt(request.getParameter("productNum"));
//		String productName = request.getParameter("productName");
//		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
//		String productCategories = request.getParameter("productCategories");
//		String fileName = request.getParameter("fileName");
		int amount = Integer.parseInt(request.getParameter("p_num"));
		int cartNum = Integer.parseInt(request.getParameter("cartNum"));
		CartDao dao = CartDao.getInstance();
		int result = dao.cartUpdate(CartVo.builder()
//				.id(id)
//				.productNum(productNum)
//				.productName(productName)
//				.productPrice(productPrice)
//				.productCategories(productCategories)
//				.fileName(fileName)
				.amount(amount)
				.cartNum(cartNum)
				.build()
				);
		System.out.println(amount);
		System.out.println(cartNum);
		System.out.println(id);
		System.out.println(result);
		if(result !=0) {
			response.sendRedirect(request.getContextPath()+"/cart?id="+id);
		}
		
		
	}

}
