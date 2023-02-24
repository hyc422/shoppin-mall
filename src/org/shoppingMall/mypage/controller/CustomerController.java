package org.shoppingMall.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.MemberDao;

public class CustomerController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));

		System.out.println(idx);

		MemberDao dao = MemberDao.getInstance();

		String url = "location.href='./'";

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		out.print("<script>");
		if (dao.delete(idx) == 1) {
			out.print("alert('회원 탈퇴 성공');");
		} else {
			out.print("alert('회원 탈퇴 실패');");
		}
		out.print(url);
		out.print("</script>");
	}

}