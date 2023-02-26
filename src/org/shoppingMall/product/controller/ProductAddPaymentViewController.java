package org.shoppingMall.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.CartDao;
import org.shoppingMall.vo.CartVo;

public class ProductAddPaymentViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		CartDao cDao = CartDao.getInstance();
		String id = (String)request.getSession().getAttribute("id");
		
		if(request.getParameter("productNum") != "") {	//바로 결제
			CartVo vo = new CartVo();
			
			int productNum = Integer.parseInt(request.getParameter("productNum"));
			String productName = request.getParameter("productName");
			String productCategories = request.getParameter("productCategories");
			String fileName = request.getParameter("fileName");
			int productPrice = Integer.parseInt(request.getParameter("productPrice"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			
			vo.setId(id);
			vo.setProductNum(productNum);
			vo.setProductName(productName);
			vo.setProductCategories(productCategories);
			vo.setFileName(fileName);
			vo.setProductPrice(productPrice);
			vo.setAmount(amount);
			
			/*request.setAttribute("productNum", productNum);
			request.setAttribute("productName", productName);
			request.setAttribute("productPrice", productPrice);
			request.setAttribute("amount", amount);
			request.setAttribute("productCategories", productCategories);
			request.setAttribute("fileName", fileName);*/
			
			request.setAttribute("vo", vo);
			
		} else {	//장바구니 결제
			List<CartVo> vo = new ArrayList<>();
			
			vo = cDao.list(id);
			
			request.setAttribute("vo", vo);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("productAddPayment.jsp");
		dispatcher.forward(request, response);
		
	}

}
