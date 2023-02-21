package org.shoppingMall.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.SearchDao;
import org.shoppingMall.vo.SearchVo;

public class LowPriceSearchController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SearchDao dao = SearchDao.getInstance();
		String name = request.getParameter("name");
		List<SearchVo> vo = dao.searchpricelow(name);
		int count  = vo.size();
		
		request.setAttribute("vo", vo);
		request.setAttribute("count", count);
		request.setAttribute("name", name);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Search/searchView.jsp");
		dispatcher.forward(request, response);
	}

}
