package org.shoppingMall.community.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;

public class CommunityWriteViewController implements Controller
{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setAttribute("category", request.getParameter("category"));
		request.setAttribute("page", request.getParameter("page"));
		
		request.setAttribute("productNum", request.getParameter("pNum"));
		request.setAttribute("productName", request.getParameter("pName"));
		request.setAttribute("fileName", request.getParameter("fName"));
			
		RequestDispatcher dispatcher = request.getRequestDispatcher("communitywrite.jsp");
		dispatcher.forward(request, response);
	}	// method end
}	// Class end
