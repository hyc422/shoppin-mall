package org.shoppingMall.community.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.QnaDao;
import org.shoppingMall.vo.QnaVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommunityCheckViewController implements Controller 
{
	private static final Logger logger = LoggerFactory.getLogger(CommunityCheckViewController.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String idx = request.getParameter("idx");
		String category = request.getParameter("category");
		String page = request.getParameter("page");
		String password= request.getParameter("vo.password");
		
		request.setAttribute("idx", idx);
		request.setAttribute("category", category);
		request.setAttribute("page", page);
		request.setAttribute("listpassword", password);
		
		try 
		{
			QnaDao dao = QnaDao.getInstance();
			
			QnaVo vo = dao.selectByIdx(Long.parseLong(idx));
			
			if(vo==null) throw new RuntimeException();
						
			logger.debug("::::::: vo-{}:::::::",vo);
			request.setAttribute("vo", vo);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("communitycheck.jsp");
			dispatcher.forward(request, response);
		}
		catch (NumberFormatException  e) 
		{response.sendRedirect("communitylist");}
	}	// method end
}	// Class end
