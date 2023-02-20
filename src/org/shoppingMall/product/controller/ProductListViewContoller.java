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
import org.shoppingMall.vo.ProductFileList;

public class ProductListViewContoller implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO dao = ProductDAO.getInstance();
		String a = request.getParameter("Categories");
		request.setAttribute("Pvo", dao.categoiesList());
//		request.setAttribute("selectOneList1", dao.selectOneList(a));
		int currentPage = 1;	
		String page=request.getParameter("page");
		if(page != null) currentPage = Integer.parseInt(page);
		int pageSize=20;		//pageSize 를 15 또는 10으로 변경해서 실행해 봅시다.
		int totalCount = dao.count(a);
		Paging paging = new Paging(currentPage, totalCount, pageSize);
		Map<String,Object> map = new HashMap<>();
		map.put("value", a);
		map.put("start",paging.getStartNo());
		map.put("end",paging.getEndNo());
		
		request.setAttribute("selectOneList1", dao.pagelist(map));
		
		request.setAttribute("paging", paging);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("productList.jsp");
		dispatcher.forward(request, response);
		
	}

}

