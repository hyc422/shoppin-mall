package org.shoppingMall.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//@WebFilter(servletNames = {"FrontController"})
public class SessionFilter implements Filter 
{
	private static final Logger logger = LoggerFactory.getLogger(SessionFilter.class);

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		List<String> nosessions = List.of("");
		// login 시 접근할 수 없는 url
		List<String> logins = List.of("");
		// login 시 접근할 수 있는 url
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		logger.info(":::::::: 요청 전 SessionFilter: {} ::::::::",httpRequest.getServletPath());
		
		HttpSession session = httpRequest.getSession();

		// NewMember user = (NewMember) session.getAttribute("user");
		// login 시 접근할 수 없는 url입니다. 또는 로그인을 해야 접근할 수 있는 url 입니다.
		/*
		 * if(nosessions.contains(httpRequest.getServletPath()) && user != null ||
		 * logins.contains(httpRequest.getServletPath()) && user==null) { // 접근이 안되는 경우
		 * contextPath로 redirect
		 * httpResponse.sendRedirect(httpRequest.getContextPath()); return; //ㄷ 다음
		 * Filter 적용하지 않도록 종료 }
		 */
		
		chain.doFilter(request, response);

		logger.info(":::::::: 요청 후  SessionFilter: {} ::::::::",httpRequest.getServletPath());
	}	// method end
}	// Class end