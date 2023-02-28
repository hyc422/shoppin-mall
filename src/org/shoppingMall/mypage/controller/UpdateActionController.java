package org.shoppingMall.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.shoppingMall.controller.Controller;
import org.shoppingMall.dao.MemberDao;
import org.shoppingMall.vo.Member;

public class UpdateActionController implements Controller {

	@Override 
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Member vo = new Member(Integer.parseInt(request.getParameter("idx")),request.getParameter("id"),
				request.getParameter("password"),request.getParameter("name"),request.getParameter("nickname")
				,request.getParameter("email"),request.getParameter("address1"),request.getParameter("address2"),
				request.getParameter("phone2"),request.getParameter("address3")
				,request.getParameter("c_code"),request.getParameter("birth"), request.getParameter("admin"));
		
		MemberDao dao = MemberDao.getInstance();
		int result=0;
		try {
			result = dao.update(vo);
		
		}catch (Exception e) {
			// TODO: handle exception
		}
			response.setCharacterEncoding("UTF-8");//
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			if(result==1) {
				out.print("alert('회원 수정 완료 되었습니다.');");
			}else {
				out.print("alert('회원 수정 문제가 발생 하였습니다.');");
			}
				out.print("location.href='update'");
				out.print("</script>");
	}

}
