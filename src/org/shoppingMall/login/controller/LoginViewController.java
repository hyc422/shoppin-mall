package org.shoppingMall.login.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.shoppingMall.controller.Controller;

public class LoginViewController implements Controller{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//CGH추가
		String temp = request.getParameter("back");
		HttpSession session = request.getSession();
		if(temp!=null && temp.equals("w")) {
			session.setAttribute("back", "cart");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request,response);
	}

}
