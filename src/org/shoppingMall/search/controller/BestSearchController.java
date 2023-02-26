package org.shoppingMall.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.BestItemDao;
import org.shoppingMall.vo.ProductFileList;

public class BestSearchController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BestItemDao dao = BestItemDao.getInstance();
		
		List<ProductFileList> list =  dao.selectAll();
		
		
		request.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Search/bestSearch.jsp");
		dispatcher.forward(request, response);
	}

}
