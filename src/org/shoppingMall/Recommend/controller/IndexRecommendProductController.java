package org.shoppingMall.Recommend.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.ProductDAO;
import org.shoppingMall.dao.RecommendDao;
import org.shoppingMall.vo.ProductFileList;
import org.shoppingMall.vo.RecommendVo;

public class IndexRecommendProductController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			RecommendDao dao = RecommendDao.getInstance();
			List<ProductFileList> list = dao.selectAll();
			request.setAttribute("list", list);
			ProductDAO dao2 = ProductDAO.getInstance();
			List<RecommendVo> list2 =  dao2.selectrecommend();
			request.setAttribute("list2", list2);
			
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("RecommendProductView.jsp");
		dispatcher.forward(request, response);
	}
}
