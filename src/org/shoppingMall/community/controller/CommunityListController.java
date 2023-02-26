package org.shoppingMall.community.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.AnnouncementDao;
import org.shoppingMall.dao.QnaDao;
import org.shoppingMall.dao.ReviewDao;
import org.shoppingMall.vo.Paging;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//list.jsp에서 페이지 번호를 클릭할 때마다 새로운 페이지번호 파라미터값으로 요청을 받고 실행됩니다.
public class CommunityListController implements Controller 
{
	private static final Logger logger = LoggerFactory.getLogger(CommunityListController.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		logger.info(":::::::: 요청 CommunityListController 처리 시작 : {} ::::::::",request.getServletPath());
		
		// 게시판 구분
		int category = 1;
		String temp = request.getParameter("category");
		if(temp != null) category = Integer.parseInt(request.getParameter("category"));
		int currentPage = 1;
		
		String page = request.getParameter("page");
		if(page != null) currentPage = Integer.parseInt(page);
		int pageSize = 5;
		int totalCount = 0;
		
		if(category == 1)
		{
			AnnouncementDao dao = AnnouncementDao.getInstance();
			totalCount = dao.count();
		}
		else if(category == 2)
		{
			ReviewDao dao = ReviewDao.getInstance();
			totalCount = dao.count();
		}
		else if(category == 3)
		{
			QnaDao dao = QnaDao.getInstance();
			totalCount = dao.count();
		}
			
		Paging paging = new Paging(currentPage, totalCount, pageSize);
		logger.info(":::::::: ListController paging : {} ::::::::",paging);
		
		Map<String,Integer> map = new HashMap<>();
		map.put("start",paging.getStartNo()); map.put("end",paging.getEndNo());
		
		request.setAttribute("paging", paging); 
		request.setAttribute("today", LocalDate.now());
		
		
		if(category == 1)
		{
			AnnouncementDao dao = AnnouncementDao.getInstance();
			request.setAttribute("list", dao.pagelist(map));
		}
		else if(category == 2)
		{
			ReviewDao dao = ReviewDao.getInstance();
			request.setAttribute("list", dao.pagelist(map));
		}
		else if(category == 3)
		{
			QnaDao dao = QnaDao.getInstance();
			request.setAttribute("list", dao.pagelist(map));
		}
		
		request.setAttribute("category", category);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("communitylist.jsp");
		dispatcher.forward(request, response);	
	}	// method end
}	// Class end
