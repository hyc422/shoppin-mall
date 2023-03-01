package org.shoppingMall.community.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.AnnouncementDao;
import org.shoppingMall.dao.QnaDao;
import org.shoppingMall.dao.ReviewDao;
import org.shoppingMall.vo.AnnouncementVo;
import org.shoppingMall.vo.Member;
import org.shoppingMall.vo.QnaVo;
import org.shoppingMall.vo.ReviewVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// 요청 매핑 :	mapping.put(new RequestKeyValue("/community/update","GET"), new UpdateViewController() );
public class CommunityUpdateViewController implements Controller 
{
	private static final Logger logger = LoggerFactory.getLogger(CommunityUpdateViewController.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		String temp = request.getParameter("idx");
		int category = Integer.parseInt(request.getParameter("category"));
		
		long idx=0;
		
		HttpSession session = request.getSession();
		Member user = (Member) session.getAttribute("user");
		
		request.setAttribute("category", category);
		
		// page값 없을 시 page = 1
		if (request.getParameter("page") == null)
			request.setAttribute("page", 1);
		else
			request.setAttribute("page", request.getParameter("page"));
		
		logger.info(":::::nickname-{}:::::",user.getNickname());
		
		if(category == 1)
		{
			try 
			{
				idx = Long.parseLong(temp);
				AnnouncementDao dao = AnnouncementDao.getInstance();
				AnnouncementVo vo = dao.selectByIdx(idx);
				
				if(vo==null || !vo.getNickname().equals(user.getNickname())) throw new RuntimeException();
				
				request.setAttribute("vo", vo);				
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("communityupdate.jsp");
				dispatcher.forward(request, response);
			}
			catch (NumberFormatException e) 
			{
				response.sendRedirect("communitylist?category=" + category);
			}		
		}
		if(category == 2)
		{
			try 
			{
				idx = Long.parseLong(temp);
				ReviewDao dao = ReviewDao.getInstance();
				ReviewVo vo = dao.selectByIdx(idx);
				
				if(vo==null || !vo.getNickname().equals(user.getNickname())) throw new RuntimeException();
				
				request.setAttribute("vo", vo);				
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("communityupdate.jsp");
				dispatcher.forward(request, response);
			}
			catch (NumberFormatException e) 
			{
				response.sendRedirect("communitylist?category=" + category);	// 링크확인
			}		
		}
		if(category == 3)
		{
			try 
			{
				idx = Long.parseLong(temp);
				QnaDao dao = QnaDao.getInstance();
				QnaVo vo = dao.selectByIdx(idx);
				
				if(vo==null || !vo.getNickname().equals(user.getNickname())) throw new RuntimeException();
				
				request.setAttribute("vo", vo);				
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("communityupdate.jsp");
				dispatcher.forward(request, response);
			}
			catch (NumberFormatException e) 
			{
				response.sendRedirect("communitylist?category=" + category);
			}		
		}	// if-elseif end
	}	// method end
}	// Class end
