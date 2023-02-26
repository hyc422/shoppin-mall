package org.shoppingMall.community.controller;

import java.io.IOException;

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

public class CommunityDeleteController implements Controller 
{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		long idx = Long.parseLong(request.getParameter("idx"));   
		
		HttpSession session = request.getSession();
		Member user = (Member) session.getAttribute("user");
		
		int category = Integer.parseInt(request.getParameter("category"));
		
		long result = 0;
		
		if(category == 1)
		{
			AnnouncementDao dao = AnnouncementDao.getInstance();
			AnnouncementVo vo = dao.selectByIdx(idx);
			
			if(vo==null || !vo.getNickname().equals(user.getNickname())) throw new RuntimeException();
			
			result = dao.delete(idx);
		}
		else if(category == 2)
		{
			ReviewDao dao = ReviewDao.getInstance();
			ReviewVo vo = dao.selectByIdx(idx);
			
			if(vo==null || !vo.getNickname().equals(user.getNickname())) throw new RuntimeException();
			
			result = dao.delete(idx);
		}
		else if(category == 3)
		{
			QnaDao dao = QnaDao.getInstance();
			QnaVo vo = dao.selectByIdx(idx);
			
			if(vo==null || !vo.getNickname().equals(user.getNickname())) throw new RuntimeException();
			
			result = dao.delete(idx);
		}	// if else-if end
		
		if(result == 1) 
			response.sendRedirect("communitylist?category=" + category + "&page="+request.getParameter("page"));
		else 
			response.sendRedirect(request.getContextPath());
	}	// method end
}	// Class end
