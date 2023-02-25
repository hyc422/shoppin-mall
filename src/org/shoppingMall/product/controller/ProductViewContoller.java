package org.shoppingMall.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.ProductDAO;
import org.shoppingMall.vo.Paging;

public class ProductViewContoller implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO dao = ProductDAO.getInstance();
		int a = Integer.parseInt(request.getParameter("productNum"));
	//	int b = Integer.parseInt(request.getParameter("page"));
		int currentPage = 1;	
		String page=request.getParameter("page");
		if(page != null) currentPage = Integer.parseInt(page);
		int pageSize=5;		//pageSize 를 15 또는 10으로 변경해서 실행해 봅시다.
	//	request.setAttribute("b", b);
		request.setAttribute("a", a);
		//상품 정보
		request.setAttribute("Pvo", dao.selectOne(a));
		
		
		//리뷰 페이징
		int RevCount = dao.RevCount(a);
		Paging RevPaging = new Paging(currentPage, RevCount, pageSize);
		Map<String,Integer> map1 = new HashMap<>();
		map1.put("productNum", a);
		map1.put("start",RevPaging.getStartNo());
		map1.put("end",RevPaging.getEndNo());
		
		request.setAttribute("Rev", dao.RevPagelist(map1));
		
		request.setAttribute("RevPaging", RevPaging);
		
		
		//QnA 페이징
		int QnaCount = dao.QnaCount(a);
		Paging QnaPaging = new Paging(currentPage, QnaCount, pageSize);
		Map<String,Integer> map2 = new HashMap<>();
		map2.put("productNum", a);
		map2.put("start",QnaPaging.getStartNo());
		map2.put("end",QnaPaging.getEndNo());
		
		request.setAttribute("Qna", dao.QnaPagelist(map2));
		
		request.setAttribute("QnaPaging", QnaPaging);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("product.jsp");
		dispatcher.forward(request, response);
	}

}