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

	@SuppressWarnings("unused")
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		CartDao dao = CartDao.getInstance();
		String cartNums = request.getParameter("cartNum2");
		String[] num = cartNums.split(",");
		int[] cartNumArr = new int[num.length];
		int totalPrice = 0;
		List<CartVo>list = new ArrayList<>();
		if(cartNums.equals("0")) {
			CartVo vo1 = new CartVo();

			int productNum = Integer.parseInt(request.getParameter("productNum"));
			String productName = request.getParameter("productName");
			String productCategories = request.getParameter("productCategories");
			String fileName = request.getParameter("fileName");
			int productPrice = Integer.parseInt(request.getParameter("productPrice"));
			int amount = Integer.parseInt(request.getParameter("amount"));

			vo1.setId(id);
			vo1.setProductNum(productNum);
			vo1.setProductName(productName);
			vo1.setProductCategories(productCategories);
			vo1.setFileName(fileName);
			vo1.setProductPrice(productPrice);
			vo1.setAmount(amount);

			list.add(vo1);
			totalPrice = productPrice*amount;
		}else {
			for (int i = 0; i < num.length; i++) {
				cartNumArr[i] = Integer.parseInt(num[i]);
			}

			int size = cartNumArr.length;
			for(int i=0; i<size; i++) {
				list.add(dao.selectNum(cartNumArr[i]));
			}

			for (int i = 0; i < list.size(); i++) {
				totalPrice += (list.get(i).getProductPrice() * list.get(i).getAmount());
			}

		}
		request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("vo", list);
        request.setAttribute("id", id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("productAddPayment.jsp");
		dispatcher.forward(request, response);

	}

}

