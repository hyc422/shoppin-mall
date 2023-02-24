package org.shoppingMall.search.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.ProductDAO;
import org.shoppingMall.vo.Paging;
import org.shoppingMall.vo.ProductFileList;

public class LowPriceSearchController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO dao = ProductDAO.getInstance();

		//검색내용
		String name = request.getParameter("name");
		List<ProductFileList> vo = dao.searchtop(name);
		int count  = vo.size();
		
		//페이징
		int currentPage = 1;
		String page = request.getParameter("page");
		if(page != null) currentPage = Integer.parseInt(page);
		int pageSize = 8;
		Paging paging = new Paging(currentPage, count, pageSize);
		Map<String, Object> map = new HashMap<>();
		map.put("productcategories", name);
		map.put("start", paging.getStartNo());
		map.put("end", paging.getEndNo());		
		
		//페이징
		request.setAttribute("list", dao.searchLowPricepagelist(map));
		request.setAttribute("paging", paging);
		
		//검색내용
		request.setAttribute("vo", vo);
		request.setAttribute("count", count);
		request.setAttribute("name", name);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Search/searchView.jsp");
		dispatcher.forward(request, response);
	}

}
