package org.shoppingMall.community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.QnaDao;
import org.shoppingMall.dao.ReviewDao;
import org.shoppingMall.vo.PaymentVO;
import org.shoppingMall.vo.QnaProductVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommunityWriteViewController implements Controller
{
	private static final Logger logger = LoggerFactory.getLogger(CommunityWriteViewController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		int category = Integer.parseInt(request.getParameter("category"));
		
		request.setAttribute("category", category);
		
		// page값 없을 시 page = 1
		if(request.getParameter("page") == null)
			request.setAttribute("page", 1);
		else
			request.setAttribute("page", request.getParameter("page"));
		
		if(category == 2)
		{
			ReviewDao dao = ReviewDao.getInstance();
			
			int idx = Integer.parseInt(request.getParameter("idx"));
			
			PaymentVO vo = dao.paymentSelectByIdx(idx);
			
			if(vo == null) throw new RuntimeException();
			
			logger.debug("::::::: vo-{}:::::::",vo);
			
			request.setAttribute("vo", vo);
		}
		
		if(category == 3)
		{
			QnaDao dao = QnaDao.getInstance();
			
			List<QnaProductVo> list = dao.selectProductList();
			
			if(list == null) throw new RuntimeException();
			
			logger.debug("::::::: list-{}:::::::",list);
			
			request.setAttribute("list", list);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("communitywrite.jsp");
		dispatcher.forward(request, response);
	}	// method end
}	// Class end
