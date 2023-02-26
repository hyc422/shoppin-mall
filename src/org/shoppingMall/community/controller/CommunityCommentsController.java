package org.shoppingMall.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.QnaCommentsDao;
import org.shoppingMall.dao.ReviewCommentsDao;
import org.shoppingMall.vo.QnaCommentsVo;
import org.shoppingMall.vo.ReviewCommentsVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommunityCommentsController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(CommunityCommentsController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String f = request.getParameter("f");
		String url = null;
		long mref = Long.parseLong(request.getParameter("mref"));
		
		logger.info("::::::CommentesController  f={} :::::::",f);
		
		String page = request.getParameter("page");
		int category = Integer.parseInt(request.getParameter("category"));
		
		if(category == 2)
		{
			ReviewCommentsDao dao = ReviewCommentsDao.getInstance();
			
			if(f.equals("1")) 
			{
				ReviewCommentsVo vo =ReviewCommentsVo.builder()
						.mref(mref)
						.nickname(request.getParameter("nickname"))
						.content(request.getParameter("content"))
						.ip(request.getRemoteAddr())
						.build();
				
				if(dao.insert(vo) == 1) url="communityread?idx="+mref +"&category=" + category + "&page="+page;
				
				else url="list";
				
			}
			else if(f.equals("2")) 
			{	
				int idx = Integer.parseInt(request.getParameter("idx"));
				
				if(dao.delete(idx) == 1) url="communityread?idx="+mref +"&category=" + category + "&page="+page;
				else url="communitylist?category=" + category;
			}
			
			dao.setCommentCount(mref);
		}
		else if(category == 3)
		{
			QnaCommentsDao dao = QnaCommentsDao.getInstance();
			
			if(f.equals("1")) 
			{
				QnaCommentsVo vo =QnaCommentsVo.builder()
						.mref(mref)
						.nickname(request.getParameter("nickname"))
						.content(request.getParameter("content"))
						.ip(request.getRemoteAddr())
						.build();
				
				if(dao.insert(vo) == 1) url="communityread?idx="+mref +"&category=" + category + "&page="+page;
				
				else url="communitylist?category=" + category;
				
			}
			else if(f.equals("2")) 
			{	
				int idx = Integer.parseInt(request.getParameter("idx"));
				
				if(dao.delete(idx)==1) url="communityread?idx="+mref +"&category=" + category + "&page="+page;
				else url="communitylist?category=" + category;
			}
			dao.setCommentCount(mref);
		}	// if end
		response.sendRedirect(url);
	}	// method end
}	// Class end
