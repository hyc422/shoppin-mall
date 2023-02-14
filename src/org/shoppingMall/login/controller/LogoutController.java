package org.shoppingMall.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.shoppingMall.controller.Controller;

public class LogoutController implements Controller{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		session.invalidate();		//세션 무효화 : 기존 세션ID 삭제
		response.sendRedirect(request.getContextPath());//메인페이지에 요청

	}
}
