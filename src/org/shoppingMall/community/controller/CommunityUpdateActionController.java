package org.shoppingMall.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.AnnouncementDao;
import org.shoppingMall.dao.QnaDao;
import org.shoppingMall.dao.ReviewDao;
import org.shoppingMall.vo.AnnouncementVo;
import org.shoppingMall.vo.QnaVo;
import org.shoppingMall.vo.ReviewVo;

public class CommunityUpdateActionController implements Controller 
{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		
		int result = 0;
		long idx = Long.parseLong(request.getParameter("idx"));
		int category = Integer.parseInt(request.getParameter("category"));
		String page = request.getParameter("page");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		
		if(category == 1)
		{
			AnnouncementVo vo = AnnouncementVo.builder()
					.idx(idx)
					.title(title)
					.content(content)
					.ip(ip)
					.build();
			
			AnnouncementDao dao = AnnouncementDao.getInstance();
			
			result = dao.update(vo);
			
			if(result==1) 
				response.sendRedirect("communityread?idx=" + idx + "&category=" + category + "&page=" + page);   
			else 
				response.sendRedirect(request.getContextPath());
		}
		else if(category == 2)
		{
			ReviewVo vo = ReviewVo.builder()
					.idx(idx)
					.title(title)
					.content(content)
					.ip(ip)
					.build();
			
			ReviewDao dao = ReviewDao.getInstance();
			
			result = dao.update(vo);
			
			if(result==1) 
				response.sendRedirect("communityread?idx=" + idx + "&category=" + category + "&page=" + page);
				// 링크 확인
			else 
				response.sendRedirect(request.getContextPath());
		}
		else if(category == 3)
		{
			QnaVo vo = QnaVo.builder()
					.idx(idx)
					.title(title)
					.content(content)
					.ip(ip)
					.build();
			
			QnaDao dao = QnaDao.getInstance();
			
			result = dao.update(vo);
			
			if(result==1) 
				response.sendRedirect("communityread?idx=" + idx + "&category=" + category + "&page=" + page);
			else 
				response.sendRedirect(request.getContextPath());
		}
	}	// method end
}	// Class end
