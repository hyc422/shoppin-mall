package org.shoppingMall.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.CartDao;
import org.shoppingMall.dao.ProductDAO;
import org.shoppingMall.vo.CartVo;
import org.shoppingMall.vo.PaymentVO;

public class ProductAddPaymentController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		CartDao cDao = CartDao.getInstance();
		ProductDAO pDao = ProductDAO.getInstance();
		List<PaymentVO> vo = new ArrayList<>();
		
		String id = request.getParameter("id");				//id		
		String zipcode = request.getParameter("zipcode");							//우편번호
		String address = request.getParameter("address");							//도로명주소
		String addressDetail = request.getParameter("addressDetail");				//상세주소
		String addressEtc = request.getParameter("addressEtc");						//참고항목
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));		//합계 금액
		
		String[] productNum = request.getParameterValues("productNum");
		String[] productName = request.getParameterValues("productName");
		String[] productPrice = request.getParameterValues("productPrice");
		String[] productCategories = request.getParameterValues("productCategories");
		String[] fileName = request.getParameterValues("fileName");
		String[] amount = request.getParameterValues("amount");
		int[] productNumArr = new int[productNum.length];
		int[] productPriceArr = new int[productPrice.length];
		int[] amountArr = new int[amount.length];
		for (int i = 0; i < productNum.length; i++) {
			productNumArr[i] = Integer.parseInt(productNum[i]);
			productPriceArr[i] = Integer.parseInt(productPrice[i]);
			amountArr[i] = Integer.parseInt(amount[i]);
		}
		int size = productNumArr.length;
		for(int i=0; i<size; i++) {
			PaymentVO vo1 = 
					new PaymentVO(id, productNumArr[i], productName[i], productPriceArr[i], productCategories[i], 
							fileName[i], amountArr[i], zipcode, address, addressDetail, addressEtc);
			pDao.insertPayment(vo1);
			vo.add(vo1);
			
			if(cDao.list(id)!=null) {
				Map<String,Object> map = new HashMap<>();
				map.put("value",id);
				map.put("productNum",productNumArr[i]);
				cDao.selectDelete(map);
			}
		}
//		if(cDao.list(id) == null) {	//일반 구매
//			
//			int productNum = Integer.parseInt(request.getParameter("productNum"));		//상품코드
//			String productName = request.getParameter("productName");					//상품명
//			int productPrice = Integer.parseInt(request.getParameter("productPrice"));	//상픔 가격
//			String productCategories = request.getParameter("productCategories");		//카테고리
//			String fileName = request.getParameter("fileName");							//이미지
//			int amount = Integer.parseInt(request.getParameter("amount"));				//상품 개수
//			
//			PaymentVO vo1 = 
//					new PaymentVO(id, productNum, productName, productPrice, productCategories, 
//							fileName, amount, zipcode, address, addressDetail, addressEtc);
//			
//			vo.add(vo1);
//			pDao.insertPayment(vo1);	//결제내역 저장
//			int result = pDao.insertPayment(vo1);
//			System.out.println(result);
//		}
//		else {	//장바구니 구매
//			
//			PaymentVO vo1 = new PaymentVO();
//			
//			for (CartVo cVo : cDao.list(id)) {
//				vo1.setId(cVo.getId());
//				vo1.setProductNum(cVo.getProductNum());
//				vo1.setProductName(cVo.getProductName());
//				vo1.setProductPrice(cVo.getProductPrice());
//				vo1.setProductCategories(cVo.getProductCategories());
//				vo1.setFileName(cVo.getFileName());
//				vo1.setAmount(cVo.getAmount());
//				vo1.setZipcode(zipcode);
//				vo1.setAddress(address);
//				vo1.setAddressDetail(addressDetail);
//				vo1.setAddressEtc(addressEtc);
//				
//				pDao.insertPayment(vo1);	//결제내역 저장
//				
//				vo.add(vo1);
//			}
//		}
//		
//		cDao.deleteAll(id);	//결제 후 장바구니 내역 삭제
		
		request.setAttribute("vo", vo);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("zipcode", zipcode);
		request.setAttribute("address", address);
		request.setAttribute("addressDetail", addressDetail);
		request.setAttribute("addressEtc", addressEtc);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("productAddPaymentSuccess.jsp");
		dispatcher.forward(request, response);

	}

}
