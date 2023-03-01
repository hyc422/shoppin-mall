package org.shoppingMall.community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.AnnouncementDao;
import org.shoppingMall.dao.QnaCommentsDao;
import org.shoppingMall.dao.QnaDao;
import org.shoppingMall.dao.ReviewCommentsDao;
import org.shoppingMall.dao.ReviewDao;
import org.shoppingMall.vo.AnnouncementVo;
import org.shoppingMall.vo.QnaCommentsVo;
import org.shoppingMall.vo.QnaVo;
import org.shoppingMall.vo.ReviewCommentsVo;
import org.shoppingMall.vo.ReviewVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommunityReadController implements Controller 
{
	private static final Logger logger = LoggerFactory.getLogger(CommunityReadController.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String temp1 = request.getParameter("idx");
		String temp2 = request.getParameter("category");
		
		long idx = 0;
		int category = 0;
		
		// page값 없을 시 page = 1
		if (request.getParameter("page") == null)
			request.setAttribute("page", 1);
		else
			request.setAttribute("page", request.getParameter("page"));
		
		request.setAttribute("category", request.getParameter("category"));
		
		try 
		{
			idx = Long.parseLong(temp1);
			category = Integer.parseInt(temp2);
			if(category == 1)
			{	// announcement
				AnnouncementDao dao = AnnouncementDao.getInstance();

				dao.setReadCount(idx);
				
				AnnouncementVo vo = dao.selectByIdx(idx);
				
				if(vo==null) throw new RuntimeException();
				
				logger.debug("::::::: vo-{}:::::::",vo);
				
				request.setAttribute("vo", vo);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("communityread.jsp");
				dispatcher.forward(request, response);
			}
			else if(category == 2)
			{	// review
				ReviewDao rdao = ReviewDao.getInstance();
				ReviewCommentsDao rcdao = ReviewCommentsDao.getInstance();
				
				rdao.setReadCount(idx);
				
				ReviewVo vo = rdao.selectByIdx(idx);
				
				if(vo==null) throw new RuntimeException();
				
				logger.debug("::::::: vo-{}:::::::",vo);
				request.setAttribute("vo", vo);
				
				List<ReviewCommentsVo> cmtlist = rcdao.comments(idx);
				request.setAttribute("cmtlist", cmtlist);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("communityread.jsp");
				dispatcher.forward(request, response);
			}
			else if(category == 3)
			{	// qna
				QnaDao qdao = QnaDao.getInstance();
				QnaCommentsDao qcdao = QnaCommentsDao.getInstance();
				
				qdao.setReadCount(idx);
				
				QnaVo vo = qdao.selectByIdx(idx);
				
				if(vo==null) throw new RuntimeException();
				
				logger.debug("::::::: vo-{}:::::::",vo);
				logger.info("::::::: vo.commentcount{}:::::::",vo.getCommentCount());
				request.setAttribute("vo", vo);
				
				List<QnaCommentsVo> cmtlist = qcdao.comments(idx);
				request.setAttribute("cmtlist", cmtlist);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("communityread.jsp");
				dispatcher.forward(request, response);
			}
		}
		catch (NumberFormatException  e) 
		{response.sendRedirect("communitylist");}
	}	// method end
}	// Class end
