package org.shoppingMall.community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.QnaCommentsDao;
import org.shoppingMall.dao.QnaDao;
import org.shoppingMall.vo.QnaCommentsVo;
import org.shoppingMall.vo.QnaVo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommunityCheckActionController implements Controller 
{
	private static final Logger logger = LoggerFactory.getLogger(CommunityCheckActionController.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		Long idx = Long.parseLong(request.getParameter("idx"));
		String category = request.getParameter("category");
		String page = request.getParameter("page");
		
		request.setAttribute("idx", idx);
		request.setAttribute("category", category);
		request.setAttribute("page", page);
		
		try 
		{
			
			QnaDao qdao = QnaDao.getInstance();
			QnaCommentsDao qcdao = QnaCommentsDao.getInstance();
			
			qdao.setReadCount(idx);
			
			QnaVo vo = qdao.selectByIdx(idx);
			
			if(vo==null) throw new RuntimeException();
			
			logger.debug("::::::: vo-{}:::::::",vo);
			request.setAttribute("vo", vo);
			
			List<QnaCommentsVo> cmtlist = qcdao.comments(idx);
			request.setAttribute("cmtlist", cmtlist);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("communityread.jsp");
			dispatcher.forward(request, response);
			
		}
		catch (NumberFormatException  e) 
		{response.sendRedirect("communitylist");}
	}	// method end
}	// Class end
