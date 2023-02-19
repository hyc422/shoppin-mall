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
		String password = request.getParameter("password");
		
		Member vo = dao.selectidx(3);
		request.setAttribute("vo", dao.selectidx(3));
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print("<script>");
		if(password == null) {
			out.print("alert('비밀번호 입력 바랍니다.')");
			out.print("location.href='update'");
		}
		
			if(password.equals(vo.getPassword())) {
				dao.delete(3);
				out.print("alert('회원탈퇴 완료 되었습니다.')");
				out.print("location.href='index'");
				
			}else {
				out.print("alert('비밀번호 재 입력 바랍니다.')");
			}
		
		out.print("</script>");
	}

}