package org.shoppingMall.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.CartDao;

public class CartSelectDeleteAllController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		CartDao dao = CartDao.getInstance();
		String cartNums = request.getParameter("cartNum1");
		System.out.println(cartNums);
		String[] num = cartNums.split(",");
		int[] cartNumArr = new int[num.length];
		
        for (int i = 0; i < num.length; i++) {
        		cartNumArr[i] = Integer.parseInt(num[i]);
        }
        
        int size = cartNumArr.length;
        int result = 0;
        for(int i=0; i<size; i++) {
        	result = dao.delete(cartNumArr[i]);
        }
        System.out.println(result);
        if(result !=0) {
			response.sendRedirect(request.getContextPath()+"/cart?id="+id);
		}
        
	}

}
