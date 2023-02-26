package org.shoppingMall.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.ProductDAO;
import org.shoppingMall.vo.PaymentVO;

public class ProductAddPaymentController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = (String)request.getSession().getAttribute("id");				//id
		int productNum = Integer.parseInt(request.getParameter("productNum"));		//상품코드
		String productName = request.getParameter("productName");					//상품명
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));	//상픔 가격
		String productCategories = request.getParameter("productCategories");		//카테고리
		String fileName = request.getParameter("fileName");							//이미지
		int amount = Integer.parseInt(request.getParameter("amount"));				//상품 개수
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));		//합계 금액
		
		String zipcode = request.getParameter("zipcode");							//우편번호
		String address = request.getParameter("address");							//도로명주소
		String addressDetail = request.getParameter("addressDetail");				//상세주소
		String addressEtc = request.getParameter("addressEtc");						//참고항목
		
		PaymentVO vo = 
				new PaymentVO(id, productNum, productName, productPrice, productCategories, 
						fileName, amount, zipcode, address, addressDetail, addressEtc);
		
		ProductDAO dao = ProductDAO.getInstance();
		
		dao.insertPayment(vo);
		
		request.setAttribute("vo", vo);
		request.setAttribute("totalPrice", totalPrice);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("productAddPaymentSuccess.jsp");
		dispatcher.forward(request, response);

	}

}
