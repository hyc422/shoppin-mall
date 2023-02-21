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
		
		int currentPage = 1; 
		AnnouncementDao dao = AnnouncementDao.getInstance();
		
		String page=request.getParameter("page"); 
		if(page != null) currentPage = Integer.parseInt(page); //list.jsp 에 page 파라미터를 찾아보세요. 
		int pageSize = 5;
		int totalCount = 1;
		
		//위의 값들을 이용해서 Paging 객체를 생성하면서 다른 필드값을 계산합니다. 
		Paging paging = new Paging(currentPage, totalCount, pageSize);
		logger.info(":::::::: ListController paging : {} ::::::::",paging);
		
		Map<String,Integer> map = new HashMap<>();
		map.put("start",paging.getStartNo()); map.put("end",paging.getEndNo());
		
		request.setAttribute("list", dao.pagelist(map));
		request.setAttribute("paging", paging); 
		request.setAttribute("today", LocalDate.now());
		 
		int category = 1;
		
		String temp = request.getParameter("category");
		if(temp != null) category = Integer.parseInt(request.getParameter("category"));

		request.setAttribute("category", category);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("communitylist.jsp");
		dispatcher.forward(request, response);	
	}	// method end
}	// Class end
