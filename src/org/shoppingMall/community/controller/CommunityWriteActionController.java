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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//글쓰기 저장 POST
public class CommunityWriteActionController implements Controller 
{
	private static final Logger logger = LoggerFactory.getLogger(CommunityWriteActionController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		
		int category = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");
		String nickname = request.getParameter("nickname");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		
		long result = 0;
		
		if(category == 1)
		{
			AnnouncementVo vo = AnnouncementVo.builder()
					.title(title)
					.nickname(nickname)
					.content(content)
					.ip(ip)
					.build();
			
			AnnouncementDao dao = AnnouncementDao.getInstance();
			
			result = dao.insert(vo);
		}
		else if(category == 2)
		{
			int productNum = Integer.parseInt(request.getParameter("productNum"));
			String fileName = request.getParameter("fileName");
			String productName = request.getParameter("productName");
			int point = Integer.parseInt(request.getParameter("point"));
			
			logger.info(":::::::::::::point-{}",point);
			
			ReviewVo vo = ReviewVo.builder()
					.title(title)
					.nickname(nickname)
					.productNum(productNum)
					.fileName(fileName)
					.productName(productName)
					.content(content)
					.point(point)
					.ip(ip)
					.build();
			
			ReviewDao dao = ReviewDao.getInstance();
			
			result = dao.insert(vo);
		}
		else if(category == 3)
		{
			String productNum = request.getParameter("productNum");
			String fileName = request.getParameter("fileName");
			String productName = request.getParameter("productName");
			String password = request.getParameter("password");
			
			QnaVo vo = QnaVo.builder()
					.title(title)
					.nickname(nickname)
					.productNum(productNum)
					.fileName(fileName)
					.productName(productName)
					.content(content)
					.password(password)
					.ip(ip)
					.build();
			
			QnaDao dao = QnaDao.getInstance();
			
			if(productNum == null && password == null)
				result = dao.insert1(vo);
			else if(productNum == null && password != null)
				result = dao.insert2(vo);
			else if(productNum != null && password == null)
				result = dao.insert3(vo);
			else if(!(productNum == null || password == null))
				result = dao.insert4(vo);
		}	// if else-if end
		
		if(result!=0) 
			response.sendRedirect("communitylist?category=" + category);
		else
			response.sendRedirect(request.getContextPath());
	}	// method end
}	// Class end
