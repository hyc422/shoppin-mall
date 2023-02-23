package org.shoppingMall.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.CartDao;
import org.shoppingMall.vo.CartVo;

public class PaylistActionController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String id = request.getParameter("admin");
		int amount = Integer.parseInt(request.getParameter("p_num"));
		int cartNum = Integer.parseInt(request.getParameter("cartNum"));
		CartDao dao = CartDao.getInstance();
		int result = dao.cartUpdate(CartVo.builder()
				.amount(amount)
				.cartNum(cartNum)
				.build()
				);
		if(result !=0) {
			response.sendRedirect(request.getContextPath()+"/cart?id="+id);
		}

}
}