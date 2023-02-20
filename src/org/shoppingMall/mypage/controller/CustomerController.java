package org.shoppingMall.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.MemberDao;
import org.shoppingMall.vo.Member;


public class CustomerController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = MemberDao.getInstance();
		long idx = Long.parseLong(request.getParameter("pw3"));
		
		String password = request.getParameter("pw2");
		Member vo = dao.selectidx(24);
		System.out.println(password);
		System.out.println(vo);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
			if(password.equals(vo.getPassword())) {
				dao.delete(24);
				response.sendRedirect(request.getContextPath());
			}
		
	
	}

}