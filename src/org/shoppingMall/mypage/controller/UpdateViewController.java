package org.shoppingMall.mypage.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.MemberDao;
import org.shoppingMall.vo.Member;

public class UpdateViewController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("idx");
		System.out.println("temp >>>" + temp);
		long idx=0;
		
		try {
			idx= Long.parseLong(temp);
	//		long idx = Long.parseLong(request.getParameter("idx"));
			MemberDao dao = MemberDao.getInstance();
			Member vo = dao.selectidx(idx);
			
			String email = vo.getEmail();
			String[] email1 =email.split("@");
			String email2 = email1[0];
			String email3 = email1[1];
			
			request.setAttribute("email2",email2);
			request.setAttribute("email2",email2);
			request.setAttribute("email3",email3);
			
			System.out.println(email1);
			System.out.println(email2);
			System.out.println(email3);
		
			HttpSession session = request.getSession();
			Member user = (Member) session.getAttribute("user");
			System.out.println("user >>>" + user.getId());
		
			if(vo == null || !vo.getId().equals(user.getId())) {
				throw new RuntimeException();
			}
			request.setAttribute("vo", vo);
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
			dispatcher.forward(request, response);
		}catch (NumberFormatException e) {
			System.out.println("e >>> " + e.getMessage());
			response.sendRedirect(request.getContextPath());
		}
		
	}

}
