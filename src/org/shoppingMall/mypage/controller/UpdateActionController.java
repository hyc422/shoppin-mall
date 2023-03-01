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
		long idx = Long.parseLong(request.getParameter("idx"));
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		// 이메일 부분
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + "@" + email2;

		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String phone2 = request.getParameter("phone2");
		String c_code = request.getParameter("c_code");
		Member vo = Member.builder()
	            .idx(idx)
	            .password(password)
	            .name(name)
	            .nickname(nickname)
	            .email(email)
	            .phone(phone2)
	            .c_code(c_code)
	            .address1(address1)
	            .address2(address2)
	            .address3(address3)
	            .build();
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
